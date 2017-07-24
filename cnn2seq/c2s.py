import cPickle as pickle
import numpy as np
import pandas
import random
import tensorflow as tf
import tensorflow.contrib.slim as slim
import os
import sys
util_path = os.path.abspath(os.path.join('../util'))
sys.path.append(util_path)
import set_assembler

sess = tf.Session()

def convert_to_one_hot(val, target_len):
    """ Converts an integer value to a one-hot encoded vector.

        Given a sequence of the first n integers and an integer i,
        creates a one-hot encoded vector of length n where the ith element is
        set to 1.0 and the rest to 0.0.

        Args:
            val: Integer to be encoded.
            target_len: Number of possible integers.

        Returns:
            one_hot: Encoding of val, where the "valth" element of a
                target-len length vector set to 1.0 and all other elements are set to 0.

        Raises:
            AssertionError: Val is greater than the number of encodable integers
    """
    assert target_len >= val
    val = int(val)
    one_hot = np.zeros(target_len)
    one_hot[val] = 1.0
    return one_hot


class ConvNet(object):
    def __init__(self, resolution, conv_shapes, fc_shapes, filter_shapes,   stride_shapes, batch_size):
        """Constructs a tensorflow convolutional neural network.

            Args:
                resolution: Numpy array of iput image resolution.
                conv_shapes: List of convolutional layer sizes.
                fc_shapes: List of fully connected layer sizes.
                filter_shapes: Numpy array of 2D filter (or kernel) dimensions.
                stride_shapes: Numpy array of 2d stride dimensions.

            Returns:
                N/A

            Raises:
                AssertionError: The number of convolution layer, filter, and
                    stride shapes are not equal.
        """
        assert len(conv_shapes) == len(filter_shapes) == len(stride_shapes)
        # Initialize parameters and IO
        self.resolution = resolution
        self.inputs = tf.placeholder(tf.float32, [batch_size] + \
                        list(resolution) + [1], name="CNN_Input")
        self.output_shape = fc_shapes[-1]
        self.layers = []

        # Build convolutional portion of tensorflow graph
        # 1. Create convolutional layers
        with tf.name_scope('cnn_layers') as scope:
            # construct convolutional layers
            tmp_conv = tf.contrib.layers.convolution2d(self.inputs,
                        num_outputs=conv_shapes[0], kernel_size=filter_shapes[0],
                        stride=stride_shapes[0], activation_fn=tf.nn.relu,
                        weights_initializer=tf.contrib.layers.xavier_initializer_conv2d(),
                        biases_initializer=tf.constant_initializer(0.1),
                        scope='conv_1')
            self.layers.append(tmp_conv)

            for i in range(1, len(conv_shapes)):
                layer_label = "conv_" + str(i+1)
                tmp_conv = tf.contrib.layers.convolution2d(self.layers[-1],
                            num_outputs=conv_shapes[i], kernel_size=filter_shapes[i],
                            stride=stride_shapes[i], activation_fn=tf.nn.relu,
                            weights_initializer=tf.contrib.layers.xavier_initializer_conv2d(),
                            biases_initializer=tf.constant_initializer(0.1),
                            scope=layer_label)
                self.layers.append(tmp_conv)

            # 2. Setup flattening layer to bridge convolutional and
            # fully-connected layers
            flattened_layer = tf.contrib.layers.flatten(self.layers[-1])

            # 3. Construct fully-connected layers
            tmp_fc = tf.contrib.layers.fully_connected(flattened_layer,
                        fc_shapes[0], activation_fn=tf.tanh,
                        weights_initializer=tf.contrib.layers.xavier_initializer(),
                        biases_initializer=tf.constant_initializer(0.1),
                        scope='fc_1')
            self.layers.append(tmp_fc)

            for i in range(1, len(fc_shapes)):
                layer_label = "fc_" + str(i+1)
                tmp_fc = tf.contrib.layers.fully_connected(self.layers[-1],
                fc_shapes[i], activation_fn=tf.nn.relu,
                weights_initializer=tf.contrib.layers.xavier_initializer(),
                biases_initializer=tf.constant_initializer(0.1),
                scope=layer_label)
                self.layers.append(tmp_fc)

            # Set last layer as output for the convolutional net
            self.outputs = self.layers[-1]

class RecNet(object):
    def __init__(self, input_shape, hidden_shape, n_layers):
        """Constructs a multi-layered recurrent neural network.

            Given an input size i, state size s and multiplicity m, constructs
            an m-layer multi-LSTM cell taking i-length inputs and with s-length
            hidden and cell states.

            Args:
                input_shape: Shape of inputs accepted by the RNN
                hidden_shape: Shape of each LSTM cell's hidden and cell states
                n_layers: Number of LSTM cells

            Returns:
                N/A
        """
        # Set parameters
        self.input_shape = input_shape
        self.hidden_shape = hidden_shape
        self.output_shape = hidden_shape
        rnn_cells = []
        # Build input tensor
        self.inputs = tf.placeholder(tf.float32, input_shape)
        # Construct "n_layers"-length MultiRNNCell
        with tf.variable_scope('rnn_model') as scope:
            lstm = tf.nn.rnn_cell.BasicLSTMCell(hidden_shape,
                        state_is_tuple=True)
            self.net = tf.nn.rnn_cell.MultiRNNCell([lstm] * n_layers,
                        state_is_tuple=True)



class C2SModel(object):
    def __init__(self, cnn, rnn, learning_rate, alphabet, null_char,
                embedding_size, max_seq_len):
        """ Constructs a Convolutional-To-Sequence (C2S) model.

            Args:
                cnn: ConvNet object to be used for learning image features.
                rnn: RecNet object to be used for generating character sequences
                    given image features.
                learning_rate: Learning rate of the model's optimizer.
                alphabet: String of the characters the model can possibly
                    generate.
                null_char: Character in alphabet used to represent lack of
                    character in the model's output sequence.
                embedding_size: Size of the image embedding used for the RNN's
                    hidden state. Will map X image features to Y embedding
                    variables.
                max_seq_length: The length of the largest possible sequence
                    the RNN would be asked to generate.

            Returns:
                N/A

            Raises:
                AssertionError: Null character must be in alphabet
        """
        assert null_terminator in alphabet
        # Component networks
        self.cnn = cnn
        self.rnn = rnn
        # Model parameters
        self.lr = learning_rate
        self.batch_size = 1
        self.seq_len = max_seq_len
        self.alphabet = alphabet
        self.null_terminator = null_char
        self.img_embedding_size = embedding_size
        # Image embedding
        self.img_features = self.cnn.outputs
        self.img_embedding_weights = \
            tf.Variable(tf.truncated_normal([self.cnn.output_shape,
                self.rnn.hidden_shape], stddev=0.01))
        self.img_embedding_bias = tf.Variable(tf.constant(0.1,
                                    shape=[self.rnn.hidden_shape]))
        self.h0 = tf.matmul(self.img_features, self.img_embedding_weights) \
                    + self.img_embedding_bias
        self.c0 = tf.zeros_like(self.h0)
        # Setup dictionaries for easy conversion to and from characters and
        # their one-hot encodings
        vec = pandas.get_dummies(alphabet).to_dict()
        for k in vec.keys():
            vs = vec[k].values()
            vec[k] = tuple([v for v in vs])
        self.alph2vec = vec
        self.vec2alph = {value:key for key, value in self.alph2vec.items()}
        self.input_char = tf.placeholder(tf.float32, [self.batch_size,
                            self.seq_len, len(self.alphabet)])
        # Other
        self.step = 0

    def str_to_one_hots(self, str):
        """ Converts an n-character string to n one-hot encoded vectors
            representing that string.

            Args:
                str: String to convert.

            Returns:
                one_hots: n x m matrix, where n is the length of str and m is
                    the size of the C2S model's alphabet. Represents a
                    one-hot encoded representation of str.

            Raises:
                N/A
        """
        one_hots = np.zeros([1, self.seq_len, len(self.alphabet)])
        seq_pos = 0
        for i in range(len(iupac)):
            one_hots[0][seq_pos] = self.alph2vec[iupac[i]]
            seq_pos += 1
        for i in range(len(iupac), self.seq_len):
            one_hots[0][seq_pos] = self.alph2vec[self.null_terminator]
            seq_pos += 1
        return one_hots

    def get_output(self):
        """ Builds the parts of the tensorflow graph combining the ConvNet and
            RecNet objects, as well as generating a softmax prediction layer
            using the latter's output.

            Args:
                N/A

            Returns:
                prediction: Reference to the tensorflow softmax prediction
                    layer.

            Raises:
                N/A
        """
        rnn_output, rnn_state = tf.nn.dynamic_rnn(self.rnn.net,
                                        self.input_char, dtype=tf.float32,
                                        initial_state=(self.c0, self.h0),
                                        sequence_length=[self.seq_len])
        # Need to reshape rnn results into shape [sequence length, output shape]
        # to be processed by the fully connected layers
        rnn_output = tf.reshape(rnn_output, [self.seq_len,
                        self.rnn.output_shape])
        # Generate character sequence predictions
        fc = tf.contrib.layrs.fully_connected(rnn_output, len(self.alphabet),
                activation_fn=tf.nn.relu,
                weights_initializer=tf.contrib.layers.xavier_initializer(),
                biases_initializer=tf.constant_initializer(0.1))
        prediction = tf.nn.softmax(fc, name="Softmax")
        return prediction

    def train(self, train_samples, test_samples, stop_threshold, display_interval, epoch_len):
        # Setup prediction and training parts of the graph
        pred = self.get_output()
        target = tf.placeholder(tf.float32, [1, self.seq_len,
                    len(self.alphabet)])
        cross_entropy = -tf.reduce_sum(target * tf.log(pred),
                            reduction_indices=[1])
        cross_entropy = tf.reduce_mean(cross_entropy)
        pred_one_hot = tf.one_hot(tf.nn.top_k(pred).indices, 1)
        correct_pred = tf.equal(tf.argmax(pred_one_hot,1), tf.argmax(target,1))
        accuracy = tf.reduce_mean(tf.cast(correct_pred, tf.float32))
        optimizer = tf.train.AdamOptimizer(learning_rate=self.lr,
                        epsilon=1e-2).minimize(cross_entropy)
        # Initialize tensorflow graph and get graph saver/loader ready
        sess.run(tf.initialize_all_variables())
        saver = tf.train.Saver()
        # RNN gets null characters as its initial input. These characters are
        # in the same shape as its final prediction. Learning is really done
        # off of the image embeddings, which are fed to the RNN's hidden state.
        initial_input = self.iupac_to_one_hots("")
        # Variables for stopping and counting training epochs
        last_test_loss = 1e3
        n_test_samples = len(test_samples)
        epoch_counter = 0
        # Training
        while last_test_loss > stop_threshold:
            # Stats since last loss-accuracy display to user
            display_acc = 0.0
            display_loss = 0.0
            epoch_acc = 0.0
            epoch_loss = 0.0
            # Training for a single epoch
            for i in range(epoch_len):
                batch = random.sample(train_samples, self.batch_size)
                xs = []
                ys = []
                # Prep example inputs and target outputs
                for sample in batch:
                    xs.append(sample[0])
                    ys.append(sample[1])
                ys = self.str_to_one_hots(ys[0])
                # Values which will serve as inputs to the tensorflow graph
                feed = {self.cnn.inputs: xs, target: ys,
                        self.input_char: initial_input}
                # Run optimizer, and fetch loss / accuracy
                loss, correct_percent, _ = sess.run([cross_entropy, accuracy,
                                    optimizer], feed_dict=feed)
                # Update stat-tracking variables
                display_acc += correct_percent
                display_loss += loss
                epoch_acc += correct_percent
                epoch_loss += loss
                self.step += 1
                # Print stats to user
                if self.step % display_interval == 0:
                    print str(self.step) + ": " + \
                     str(display_acc / display_interval) + " - " + \
                     str(display_loss / display_interval)
                    display_acc = 0.0
                    display_loss = 0.0

            epoch_counter += 1
            # Print epoch stats to user
            epoch_acc = epoch_acc / epoch_len
            epoch_loss = epoch_loss / epoch_len
            print "EPOCH " + str(epoch_counter) + ": " + str(epoch_acc) + \
                " - " + str(epoch_loss)
            epoch_acc = 0.0
            epoch_loss = 0.0

            test_acc = 0.0
            test_loss = 0.0
            # Evaluate performance on the test set
            for sample in test_samples:
                xs = []
                ys = []
                xs.append(sample[0])
                ys.append(sample[1])
                ys = self.iupac_to_one_hots(ys[0])
                feed = {self.cnn.inputs: xs, target: ys,
                        self.input_char: initial_input}
                loss, correct_percent = sess.run([cross_entropy, accuracy],
                                            feed_dict=feed)
                test_acc += correct_percent
                test_loss += loss
            test_acc = test_acc / n_test_samples
            test_loss = test_loss / n_test_samples
            last_test_loss = test_loss
            print "TEST " + str(epoch_counter) + ": " + str(test_acc) + \
                " - " + str(test_loss)
            saver.save(sess, "learned.ckpt")
            tf.train.write_graph(sess.graph_def, '', 'graph.pb')
            print "SAVED CHECKPOINT"

if __name__ == "__main__":
    null_char = "#"
    train_path = "../mol2/ai.db"
    test_path = "../mol/ai.db"
    table_name = "AI"
    train_directory = "../mol2/im/"
    test_directory = "../mol/im/"
    img_base = "noise"
    img_extension = ".png"
    train_n_noise_variants = 6
    test_n_noise_variants = 2
    epoch_len = 1000
    display_freq = 100

    # Assemble training set
    rows = set_assembler.fetch_rows(train_path, table_name)
    train_alphabet = str(set_assembler.alph_from_rows(rows))
    train_alphabet += null_char
    train_alphabet = [char for char in train_alphabet]
    train_seq_len = set_assembler.seq_len_from_rows(rows)
    train_set = set_assembler.cross_reference_db_imgs(rows, train_directory,
                    train_n_noise_variants, img_extension, img_base)
    img = train_set[0][0]
    resolution = (len(img[0]), len(img[1]))

    # Assemble evaluation set
    rows = set_assembler.fetch_rows(test_path, table_name)
    test_alphabet = str(set_assembler.alph_from_rows(rows))
    test_alphabet = [char for char in test_alphabet]
    test_seq_len = set_assembler.seq_len_from_rows(rows)
    test_set = set_assembler.cross_reference_db_imgs(rows, test_directory,
                    test_n_noise_variants, img_extension, img_base)

    alphabet = set(train_alphabet).union(set(test_alphabet))
    alphabet = [char for char in alphabet]
    max_seq_len = max(train_seq_len, test_seq_len)

    batch_size = 1
    sample_input_shape = list(resolution) + [1]
    summaries_dir = ""
    embedding_size = 1400
    n_hidden = 1400

    cnn = ConvNet(resolution, [24, 12, 8, 6, 4], [1200, 800, 600], [[8,8], [6,6],
            [4,4], [2,2], [1,1]], [[3,3], [3,3], [3,3], [3,3], [3,3]], batch_size)
    rnn_input_shape = [len(alphabet)]
    rnn = RecNet(rnn_input_shape, n_hidden, 1, 0.6)
    c2s = C2SModel(cnn, rnn, 0.00004, batch_size, max_seq_len, [600, 400], alphabet,
            null_char, embedding_size, max_seq_len)
    c2s.train(train_set, test_set, stop_threshold=0.4,
        display_interval=display_freq, epoch_len=epoch_len)
