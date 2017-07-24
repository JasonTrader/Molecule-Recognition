from copy import deepcopy
import pandas
import pickle
import numpy as np
import random
import os
import sys
util_path = os.path.abspath(os.path.join('../util'))
sys.path.append(util_path)
import set_assembler
import torch

from torch.autograd import Variable
from torch.nn import init
import torch.nn.functional as F

class CNN(object):
    def __init__(self, in_shape, out_shape, activation, layer_params, channels):
        """ Constructs a Convolutional Neural Network (CNN).

            Args:
                in_shape: Shape of the 2-dimensional network input.
                out_shape: Shape of the network's output flattened,
                    fully-connected layer.
                activation: The activation function to apply to each
                    convolutional layer. Should be a torch.nn.functional method.
                layer_params: List of dictionaries specifying the consecutive
                    layers of the CNN. Each dictionary should specify
                    the following fields:
                        -'type': Type of layer to construct.
                            e.g. 'conv', 'max_pool'
                        -'kernel': Size of the layer's sliding window.
                        -'strides': Stride of the convolving kernel.
                            Can be a 2D tuple (height, width) or a single
                            integer.
                        -'padding': Integer (0 or 1). Whether or not to apply
                            zero padding to the layer's input.
                        -'out_channels': 'conv'-layer only. The number of
                            channels in the layer's output.
        """
        assert(len([l for l in layer_params if l['type'] == 'conv']) == len(channels))

        act2str = {F.elu: 'elu',
                   F.relu: 'relu'}

        self.in_shape = in_shape
        self.out_shape = out_shape
        self.last_channels = self.in_shape[1]
        self.act_str = act2str[activation]
        self._cnn = torch.nn.ModuleList()

        for ps in layer_params:
            if ps['type'] == 'conv':
                self.add_conv_layer(ps)
            elif ps['type'] == 'max_pool':
                self.add_max_pool(ps)
            else:
                raise TypeError("Unsupported CNN layer type.")

    def add_conv_layer(self, ps):
        in_channels = self.last_channels
        out_channels = ps['channels']
        kernel = ps['kernel']
        strides = ps['strides']
        padding = ps['padding']
        new_layer = torch.nn.Conv2d(in_channels, out_channels, kernel,
                         stride=strides, padding=padding)
        torch.nn.init.xavier_uniform(new_layer.weight,
                                     gain=torch.nn.init.calculate_gain(self.act_str))
        self._cnn.append(new_layer)
        self.last_channels = out_channels

    def add_max_pool(self, ps):
        kernel = ps['kernel']
        strides = ps['strides']
        padding = ps['padding']
        new_layer = torch.nn.MaxPool2d(kernel, stride=strides, padding=padding)
        self._cnn.append(new_layer)

    def forward(self, x):
        for l in self._cnn:
            x = l(x)
        out_shape = x.size()
        new_shape = [32, out_shape[1] * out_shape[2] * out_shape[3]]
        x = x.view(new_shape)
        x = torch.nn.Linear(new_shape[1], self.out_shape)(x)
        return x

class RNN(object):
    def __init__(self, in_shape, hidden_shape, cell_shape, batch_size):
        self.batch_size = batch_size
        self.in_shape = in_shape
        self.h_shape = hidden_shape
        self.c_shape = cell_shape
        self._rnn = torch.nn.ModuleList()
        self._rnn.append(torch.nn.LSTM(self.in_shape, self.h_shape))
        self.h0 = Variable(torch.zeros(1, self.batch_size, hidden_shape))
        self.c0 = Variable(torch.zeros(1, self.batch_size, cell_shape))
        self.h = Variable(torch.randn(1, self.batch_size, hidden_shape))
        self.c = Variable(torch.randn( self.batch_size, cell_shape))

    def forward(self, x):
        x = x.view([1, 32, -1])
        x, h_c = self._rnn[-1](x, (self.h0, self.c0))
        return x

if __name__ == '__main__':
    # Data initialization
    # TODO: Refactor into own module
    null_char = "#"
    train_path = "../mol/ai.db"
    train_directory = "../mol/im/"
    table_name = "AI"
    train_n_noise_variants = 6
    img_base = "noise"
    img_extension = ".png"

    rows = set_assembler.fetch_rows(train_path, table_name)
    train_alphabet = str(set_assembler.alph_from_rows(rows))
    train_alphabet += null_char
    train_alphabet = [char for char in train_alphabet]
    train_seq_len = set_assembler.seq_len_from_rows(rows)
    train_set = set_assembler.cross_reference_db_imgs(rows, train_directory,
                    train_n_noise_variants, img_extension, img_base)
    img = train_set[0][0]
    resolution = (len(img[0]), len(img[1]))

    batch_size = 32
    # batch_size x in_channels x h x w
    cnn_in_shape = [batch_size] + [1] + list(resolution)
    cnn_out_shape = 256
    rnn_h = 512
    rnn_c = 512

    cnn_activation = F.relu
    conv_dict = {'type': 'conv',
                 'kernel': 3,
                 'strides': 1,
                 'padding': 1}
    pool = {'type': 'max_pool',
                 'kernel': 2,
                 'strides': 2,
                 'padding': 0}
    chans = [128]*2 + [256]*2 + [512]*2
    chans_counter = 0
    cnn_ps = []
    convs_per_pool = 2
    n_superlayers = 3
    for i in range(n_superlayers):
        for j in range(convs_per_pool):
            d = deepcopy(conv_dict)
            d['channels'] = chans[chans_counter]
            chans_counter += 1
            cnn_ps.append(d)
        cnn_ps.append(pool)


    x = Variable(torch.randn(cnn_in_shape))
    print("Initializing CNN...")
    cnn = CNN(cnn_in_shape, cnn_out_shape, cnn_activation, cnn_ps, chans)
    print("Done!\nInitializing RNN...")
    rnn = RNN(cnn_out_shape, rnn_h, rnn_c, batch_size)
    print("Done!")
    print("Dummy input test...")
    x = rnn.forward(cnn.forward(x))[0]
