node {
  name: "CNN_Input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 100
        }
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv_1/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 8
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\010\000\000\000\010\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0533001795411
      }
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0533001795411
      }
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv_1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv_1/weights/Initializer/random_uniform/max"
  input: "conv_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv_1/weights/Initializer/random_uniform/RandomUniform"
  input: "conv_1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "conv_1/weights/Initializer/random_uniform"
  op: "Add"
  input: "conv_1/weights/Initializer/random_uniform/mul"
  input: "conv_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "conv_1/weights/Assign"
  op: "Assign"
  input: "conv_1/weights"
  input: "conv_1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/weights/read"
  op: "Identity"
  input: "conv_1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_1/Conv2D"
  op: "Conv2D"
  input: "CNN_Input"
  input: "conv_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv_1/biases/Assign"
  op: "Assign"
  input: "conv_1/biases"
  input: "conv_1/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/biases/read"
  op: "Identity"
  input: "conv_1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_1/BiasAdd"
  op: "BiasAdd"
  input: "cnn_layers/conv_1/Conv2D"
  input: "conv_1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "cnn_layers/conv_1/Relu"
  op: "Relu"
  input: "cnn_layers/conv_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_2/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 6
        }
        dim {
          size: 6
        }
        dim {
          size: 32
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\006\000\000\000\006\000\000\000 \000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653322
      }
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653322
      }
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv_2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv_2/weights/Initializer/random_uniform/max"
  input: "conv_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv_2/weights/Initializer/random_uniform/RandomUniform"
  input: "conv_2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "conv_2/weights/Initializer/random_uniform"
  op: "Add"
  input: "conv_2/weights/Initializer/random_uniform/mul"
  input: "conv_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "conv_2/weights/Assign"
  op: "Assign"
  input: "conv_2/weights"
  input: "conv_2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/weights/read"
  op: "Identity"
  input: "conv_2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_2/Conv2D"
  op: "Conv2D"
  input: "cnn_layers/conv_1/Relu"
  input: "conv_2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv_2/biases/Assign"
  op: "Assign"
  input: "conv_2/biases"
  input: "conv_2/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/biases/read"
  op: "Identity"
  input: "conv_2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_2/BiasAdd"
  op: "BiasAdd"
  input: "cnn_layers/conv_2/Conv2D"
  input: "conv_2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "cnn_layers/conv_2/Relu"
  op: "Relu"
  input: "cnn_layers/conv_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_3/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 4
        }
        dim {
          size: 16
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\004\000\000\000\020\000\000\000\010\000\000\000"
      }
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv_3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv_3/weights/Initializer/random_uniform/max"
  input: "conv_3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv_3/weights/Initializer/random_uniform/RandomUniform"
  input: "conv_3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "conv_3/weights/Initializer/random_uniform"
  op: "Add"
  input: "conv_3/weights/Initializer/random_uniform/mul"
  input: "conv_3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "conv_3/weights/Assign"
  op: "Assign"
  input: "conv_3/weights"
  input: "conv_3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/weights/read"
  op: "Identity"
  input: "conv_3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_3/Conv2D"
  op: "Conv2D"
  input: "cnn_layers/conv_2/Relu"
  input: "conv_3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv_3/biases/Assign"
  op: "Assign"
  input: "conv_3/biases"
  input: "conv_3/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/biases/read"
  op: "Identity"
  input: "conv_3/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_3/BiasAdd"
  op: "BiasAdd"
  input: "cnn_layers/conv_3/Conv2D"
  input: "conv_3/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "cnn_layers/conv_3/Relu"
  op: "Relu"
  input: "cnn_layers/conv_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv_4/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 2
        }
        dim {
          size: 8
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\002\000\000\000\010\000\000\000\004\000\000\000"
      }
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.353553384542
      }
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.353553384542
      }
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv_4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv_4/weights/Initializer/random_uniform/max"
  input: "conv_4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv_4/weights/Initializer/random_uniform/RandomUniform"
  input: "conv_4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "conv_4/weights/Initializer/random_uniform"
  op: "Add"
  input: "conv_4/weights/Initializer/random_uniform/mul"
  input: "conv_4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "conv_4/weights/Assign"
  op: "Assign"
  input: "conv_4/weights"
  input: "conv_4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/weights/read"
  op: "Identity"
  input: "conv_4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_4/Conv2D"
  op: "Conv2D"
  input: "cnn_layers/conv_3/Relu"
  input: "conv_4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "conv_4/biases/Assign"
  op: "Assign"
  input: "conv_4/biases"
  input: "conv_4/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/biases/read"
  op: "Identity"
  input: "conv_4/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
}
node {
  name: "cnn_layers/conv_4/BiasAdd"
  op: "BiasAdd"
  input: "cnn_layers/conv_4/Conv2D"
  input: "conv_4/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "cnn_layers/conv_4/Relu"
  op: "Relu"
  input: "cnn_layers/conv_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cnn_layers/Flatten/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\020\000\000\000"
      }
    }
  }
}
node {
  name: "cnn_layers/Flatten/Reshape"
  op: "Reshape"
  input: "cnn_layers/conv_4/Relu"
  input: "cnn_layers/Flatten/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cnn_layers/fc_1/Shape"
  op: "Shape"
  input: "cnn_layers/Flatten/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cnn_layers/fc_1/unpack"
  op: "Unpack"
  input: "cnn_layers/fc_1/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "fc_1/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\020\000\000\000,\001\000\000"
      }
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.137794569135
      }
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.137794569135
      }
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fc_1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fc_1/weights/Initializer/random_uniform/max"
  input: "fc_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fc_1/weights/Initializer/random_uniform/RandomUniform"
  input: "fc_1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "fc_1/weights/Initializer/random_uniform"
  op: "Add"
  input: "fc_1/weights/Initializer/random_uniform/mul"
  input: "fc_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "fc_1/weights/Assign"
  op: "Assign"
  input: "fc_1/weights"
  input: "fc_1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/weights/read"
  op: "Identity"
  input: "fc_1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "cnn_layers/fc_1/MatMul"
  op: "MatMul"
  input: "cnn_layers/Flatten/Reshape"
  input: "fc_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fc_1/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fc_1/biases/Assign"
  op: "Assign"
  input: "fc_1/biases"
  input: "fc_1/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/biases/read"
  op: "Identity"
  input: "fc_1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
}
node {
  name: "cnn_layers/fc_1/BiasAdd"
  op: "BiasAdd"
  input: "cnn_layers/fc_1/MatMul"
  input: "fc_1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "cnn_layers/fc_1/Tanh"
  op: "Tanh"
  input: "cnn_layers/fc_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 41
        }
      }
    }
  }
}
node {
  name: "truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\0004\003\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.00999999977648
      }
    }
  }
}
node {
  name: "truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal/mul"
  op: "Mul"
  input: "truncated_normal/TruncatedNormal"
  input: "truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal"
  op: "Add"
  input: "truncated_normal/mul"
  input: "truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Variable"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 820
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "Variable_1"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Assign"
  op: "Assign"
  input: "Variable_1"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/read"
  op: "Identity"
  input: "Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "cnn_layers/fc_1/Tanh"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "MatMul"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "zeros_like"
  op: "ZerosLike"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 59
        }
        dim {
          size: 41
        }
      }
    }
  }
}
node {
  name: "transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "transpose"
  op: "Transpose"
  input: "Placeholder_1"
  input: "transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ToInt32/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 59
      }
    }
  }
}
node {
  name: "sequence_length"
  op: "Identity"
  input: "ToInt32/x"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/Shape"
  op: "Shape"
  input: "transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/Slice/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/Slice"
  op: "Slice"
  input: "RNN/Shape"
  input: "RNN/Slice/begin"
  input: "RNN/Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/Squeeze"
  op: "Squeeze"
  input: "RNN/Slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "squeeze_dims"
    value {
      list {
        i: 0
      }
    }
  }
}
node {
  name: "RNN/Shape_1"
  op: "Shape"
  input: "sequence_length"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/pack"
  op: "Pack"
  input: "RNN/Squeeze"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/Equal"
  op: "Equal"
  input: "RNN/Shape_1"
  input: "RNN/pack"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/Rank"
  op: "Rank"
  input: "RNN/Equal"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "RNN/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "RNN/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/range"
  op: "Range"
  input: "RNN/range/start"
  input: "RNN/Rank"
  input: "RNN/range/delta"
}
node {
  name: "RNN/All"
  op: "All"
  input: "RNN/Equal"
  input: "RNN/range"
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "RNN/Assert/data_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Expected shape for Tensor sequence_length:0 is "
      }
    }
  }
}
node {
  name: "RNN/Assert/data_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: " but saw shape: "
      }
    }
  }
}
node {
  name: "RNN/Assert"
  op: "Assert"
  input: "RNN/All"
  input: "RNN/Assert/data_0"
  input: "RNN/pack"
  input: "RNN/Assert/data_2"
  input: "RNN/Shape_1"
  attr {
    key: "T"
    value {
      list {
        type: DT_STRING
        type: DT_INT32
        type: DT_STRING
        type: DT_INT32
      }
    }
  }
  attr {
    key: "summarize"
    value {
      i: 3
    }
  }
}
node {
  name: "RNN/CheckSeqLen"
  op: "Identity"
  input: "sequence_length"
  input: "^RNN/Assert"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/Shape_2"
  op: "Shape"
  input: "transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/unpack"
  op: "Unpack"
  input: "RNN/Shape_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num"
    value {
      i: 3
    }
  }
}
node {
  name: "RNN/pack_1/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 820
      }
    }
  }
}
node {
  name: "RNN/pack_1"
  op: "Pack"
  input: "RNN/unpack:1"
  input: "RNN/pack_1/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/zeros"
  op: "Fill"
  input: "RNN/pack_1"
  input: "RNN/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/Rank_1"
  op: "Rank"
  input: "RNN/CheckSeqLen"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/range_1/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "RNN/range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/range_1"
  op: "Range"
  input: "RNN/range_1/start"
  input: "RNN/Rank_1"
  input: "RNN/range_1/delta"
}
node {
  name: "RNN/Min"
  op: "Min"
  input: "RNN/CheckSeqLen"
  input: "RNN/range_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "RNN/Rank_2"
  op: "Rank"
  input: "RNN/CheckSeqLen"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/range_2/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "RNN/range_2/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/range_2"
  op: "Range"
  input: "RNN/range_2/start"
  input: "RNN/Rank_2"
  input: "RNN/range_2/delta"
}
node {
  name: "RNN/Max"
  op: "Max"
  input: "RNN/CheckSeqLen"
  input: "RNN/range_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "RNN/time"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "RNN/TensorArray"
  op: "TensorArray"
  input: "RNN/unpack"
  attr {
    key: "clear_after_read"
    value {
      b: true
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "dynamic_size"
    value {
      b: false
    }
  }
  attr {
    key: "tensor_array_name"
    value {
      s: "RNN/dynamic_rnn/output"
    }
  }
}
node {
  name: "RNN/TensorArray/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/TensorArray_1"
  op: "TensorArray"
  input: "RNN/unpack"
  attr {
    key: "clear_after_read"
    value {
      b: true
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "dynamic_size"
    value {
      b: false
    }
  }
  attr {
    key: "tensor_array_name"
    value {
      s: "RNN/dynamic_rnn/input"
    }
  }
}
node {
  name: "RNN/TensorArray_1/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/TensorArrayUnpack"
  op: "TensorArrayUnpack"
  input: "RNN/TensorArray_1"
  input: "transpose"
  input: "RNN/TensorArray_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
}
node {
  name: "RNN/TensorArray_2/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/while/Enter"
  op: "Enter"
  input: "RNN/time"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Enter_1"
  op: "Enter"
  input: "RNN/TensorArray/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Enter_2"
  op: "Enter"
  input: "zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Enter_3"
  op: "Enter"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Merge"
  op: "Merge"
  input: "RNN/while/Enter"
  input: "RNN/while/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/Merge_1"
  op: "Merge"
  input: "RNN/while/Enter_1"
  input: "RNN/while/NextIteration_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Merge_2"
  op: "Merge"
  input: "RNN/while/Enter_2"
  input: "RNN/while/NextIteration_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Merge_3"
  op: "Merge"
  input: "RNN/while/Enter_3"
  input: "RNN/while/NextIteration_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Less/Enter"
  op: "Enter"
  input: "RNN/unpack"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Less"
  op: "Less"
  input: "RNN/while/Merge"
  input: "RNN/while/Less/Enter"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/LoopCond"
  op: "LoopCond"
  input: "RNN/while/Less"
}
node {
  name: "RNN/while/Switch"
  op: "Switch"
  input: "RNN/while/Merge"
  input: "RNN/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Merge"
      }
    }
  }
}
node {
  name: "RNN/while/Switch_1"
  op: "Switch"
  input: "RNN/while/Merge_1"
  input: "RNN/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Merge_1"
      }
    }
  }
}
node {
  name: "RNN/while/Switch_2"
  op: "Switch"
  input: "RNN/while/Merge_2"
  input: "RNN/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Merge_2"
      }
    }
  }
}
node {
  name: "RNN/while/Switch_3"
  op: "Switch"
  input: "RNN/while/Merge_3"
  input: "RNN/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Merge_3"
      }
    }
  }
}
node {
  name: "RNN/while/Identity"
  op: "Identity"
  input: "RNN/while/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/Identity_1"
  op: "Identity"
  input: "RNN/while/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Identity_2"
  op: "Identity"
  input: "RNN/while/Switch_2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Identity_3"
  op: "Identity"
  input: "RNN/while/Switch_3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/TensorArrayRead/RefEnter"
  op: "RefEnter"
  input: "RNN/TensorArray_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/TensorArrayRead/Enter"
  op: "Enter"
  input: "RNN/TensorArrayUnpack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/TensorArrayRead"
  op: "TensorArrayRead"
  input: "RNN/while/TensorArrayRead/RefEnter"
  input: "RNN/while/Identity"
  input: "RNN/while/TensorArrayRead/Enter"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 861
        }
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "]\003\000\000\320\014\000\000"
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05902813375
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05902813375
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/sub"
  op: "Sub"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/max"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/mul"
  op: "Mul"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/RandomUniform"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform"
  op: "Add"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/mul"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
  op: "Concat"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
  input: "RNN/while/TensorArrayRead"
  input: "RNN/while/Identity_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter"
  op: "Enter"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul"
  op: "MatMul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter"
  op: "Enter"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add"
  op: "Add"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split"
  op: "Split"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 4
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1/y"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1"
  op: "Add"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split:2"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
  op: "Sigmoid"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul"
  op: "Mul"
  input: "RNN/while/Identity_2"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
  op: "Sigmoid"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
  op: "Tanh"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1"
  op: "Mul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2"
  op: "Add"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
  op: "Tanh"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
  op: "Sigmoid"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  op: "Mul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/keep_prob"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.600000023842
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/min"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/max"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/sub"
  op: "Sub"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/max"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/mul"
  op: "Mul"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/RandomUniform"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform"
  op: "Add"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/mul"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/add"
  op: "Add"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/keep_prob"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/Floor"
  op: "Floor"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/Inv"
  op: "Inv"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/mul"
  op: "Mul"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/MultiRNNCell/Cell0/dropout/mul_1"
  op: "Mul"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/mul"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/GreaterEqual/Enter"
  op: "Enter"
  input: "RNN/CheckSeqLen"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/GreaterEqual"
  op: "GreaterEqual"
  input: "RNN/while/Identity"
  input: "RNN/while/GreaterEqual/Enter"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/Select/Enter"
  op: "Enter"
  input: "RNN/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/Select"
  op: "Select"
  input: "RNN/while/GreaterEqual"
  input: "RNN/while/Select/Enter"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Select_1"
  op: "Select"
  input: "RNN/while/GreaterEqual"
  input: "RNN/while/Identity_2"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Select_2"
  op: "Select"
  input: "RNN/while/GreaterEqual"
  input: "RNN/while/Identity_3"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/TensorArrayWrite/RefEnter"
  op: "RefEnter"
  input: "RNN/TensorArray"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "RNN/while/TensorArrayWrite"
  op: "TensorArrayWrite"
  input: "RNN/while/TensorArrayWrite/RefEnter"
  input: "RNN/while/Identity"
  input: "RNN/while/Select"
  input: "RNN/while/Identity_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
}
node {
  name: "RNN/while/TensorArray_2/Const"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/while/add/y"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "RNN/while/add"
  op: "Add"
  input: "RNN/while/Identity"
  input: "RNN/while/add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/NextIteration"
  op: "NextIteration"
  input: "RNN/while/add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/NextIteration_1"
  op: "NextIteration"
  input: "RNN/while/TensorArrayWrite"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/NextIteration_2"
  op: "NextIteration"
  input: "RNN/while/Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/NextIteration_3"
  op: "NextIteration"
  input: "RNN/while/Select_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Exit"
  op: "Exit"
  input: "RNN/while/Switch"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "RNN/while/Exit_1"
  op: "Exit"
  input: "RNN/while/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Exit_2"
  op: "Exit"
  input: "RNN/while/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/while/Exit_3"
  op: "Exit"
  input: "RNN/while/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/TensorArrayPack"
  op: "TensorArrayPack"
  input: "RNN/TensorArray"
  input: "RNN/while/Exit_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RNN/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "RNN/transpose"
  op: "Transpose"
  input: "RNN/TensorArrayPack"
  input: "RNN/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ";\000\000\0004\003\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "RNN/transpose"
  input: "Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fully_connected/Shape"
  op: "Shape"
  input: "Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "fully_connected/unpack"
  op: "Unpack"
  input: "fully_connected/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "num"
    value {
      i: 2
    }
  }
}
node {
  name: "fully_connected/weights"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "4\003\000\000)\000\000\000"
      }
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0834783837199
      }
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0834783837199
      }
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "fully_connected/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "fully_connected/weights/Initializer/random_uniform/max"
  input: "fully_connected/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "fully_connected/weights/Initializer/random_uniform/RandomUniform"
  input: "fully_connected/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "fully_connected/weights/Initializer/random_uniform"
  op: "Add"
  input: "fully_connected/weights/Initializer/random_uniform/mul"
  input: "fully_connected/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "fully_connected/weights/Assign"
  op: "Assign"
  input: "fully_connected/weights"
  input: "fully_connected/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/weights/read"
  op: "Identity"
  input: "fully_connected/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "fully_connected/MatMul"
  op: "MatMul"
  input: "Reshape"
  input: "fully_connected/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "fully_connected/biases"
  op: "Variable"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/biases/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 41
          }
        }
        float_val: 0.10000000149
      }
    }
  }
}
node {
  name: "fully_connected/biases/Assign"
  op: "Assign"
  input: "fully_connected/biases"
  input: "fully_connected/biases/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/biases/read"
  op: "Identity"
  input: "fully_connected/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
}
node {
  name: "fully_connected/BiasAdd"
  op: "BiasAdd"
  input: "fully_connected/MatMul"
  input: "fully_connected/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "fully_connected/Relu"
  op: "Relu"
  input: "fully_connected/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "fully_connected/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 59
        }
        dim {
          size: 41
        }
      }
    }
  }
}
node {
  name: "Log"
  op: "Log"
  input: "Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "Placeholder_2"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sum"
  op: "Sum"
  input: "mul"
  input: "Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Neg"
  op: "Neg"
  input: "Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Rank"
  op: "Rank"
  input: "Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "range"
  op: "Range"
  input: "range/start"
  input: "Rank"
  input: "range/delta"
}
node {
  name: "Mean"
  op: "Mean"
  input: "Neg"
  input: "range"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "TopKV2/k"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "TopKV2"
  op: "TopKV2"
  input: "Softmax"
  input: "TopKV2/k"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "sorted"
    value {
      b: true
    }
  }
}
node {
  name: "one_hot/on_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "one_hot/off_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "one_hot/depth"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "one_hot"
  op: "OneHot"
  input: "TopKV2:1"
  input: "one_hot/depth"
  input: "one_hot/on_value"
  input: "one_hot/off_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "TI"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: -1
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "one_hot"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_1"
  op: "ArgMax"
  input: "Placeholder_2"
  input: "ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "ArgMax"
  input: "ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Cast"
  op: "Cast"
  input: "Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Rank_1"
  op: "Rank"
  input: "Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "range_1/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "range_1"
  op: "Range"
  input: "range_1/start"
  input: "Rank_1"
  input: "range_1/delta"
}
node {
  name: "Mean_1"
  op: "Mean"
  input: "Cast"
  input: "range_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Shape"
  input: "Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/f_count"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/f_count_1"
  op: "Enter"
  input: "gradients/f_count"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/Merge"
  op: "Merge"
  input: "gradients/f_count_1"
  input: "gradients/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Switch"
  op: "Switch"
  input: "gradients/Merge"
  input: "RNN/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Add/y"
  op: "Const"
  input: "^RNN/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Add"
  op: "Add"
  input: "gradients/Switch:1"
  input: "gradients/Add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/NextIteration"
  op: "NextIteration"
  input: "gradients/Add"
  input: "^gradients/RNN/while/Select_1_grad/zeros_like/StackPush"
  input: "^gradients/RNN/while/Select_1_grad/Select/StackPush"
  input: "^gradients/RNN/while/Select_2_grad/zeros_like/StackPush"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPush_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPush"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPush"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/f_count_2"
  op: "Exit"
  input: "gradients/Switch"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/b_count"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/b_count_1"
  op: "Enter"
  input: "gradients/f_count_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/Merge_1"
  op: "Merge"
  input: "gradients/b_count_1"
  input: "gradients/NextIteration_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/GreaterEqual/Enter"
  op: "Enter"
  input: "gradients/b_count"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/GreaterEqual"
  op: "GreaterEqual"
  input: "gradients/Merge_1"
  input: "gradients/GreaterEqual/Enter"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/b_count_2"
  op: "LoopCond"
  input: "gradients/GreaterEqual"
}
node {
  name: "gradients/Switch_1"
  op: "Switch"
  input: "gradients/Merge_1"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sub"
  op: "Sub"
  input: "gradients/Switch_1:1"
  input: "gradients/GreaterEqual/Enter"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/NextIteration_1"
  op: "NextIteration"
  input: "gradients/Sub"
  input: "^gradients/RNN/while/Select_1_grad/zeros_like/b_sync"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Size"
  op: "Size"
  input: "gradients/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/add"
  op: "Add"
  input: "range"
  input: "gradients/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/mod"
  op: "Mod"
  input: "gradients/Mean_grad/add"
  input: "gradients/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "gradients/Mean_grad/mod"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range"
  op: "Range"
  input: "gradients/Mean_grad/range/start"
  input: "gradients/Mean_grad/Size"
  input: "gradients/Mean_grad/range/delta"
}
node {
  name: "gradients/Mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Fill"
  op: "Fill"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/Mean_grad/range"
  input: "gradients/Mean_grad/mod"
  input: "gradients/Mean_grad/Shape"
  input: "gradients/Mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/DynamicStitch"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "Div"
  input: "gradients/Mean_grad/Shape"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_2"
  op: "Shape"
  input: "Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_3"
  op: "Shape"
  input: "Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Rank"
  op: "Rank"
  input: "gradients/Mean_grad/Shape_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/range_1/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range_1"
  op: "Range"
  input: "gradients/Mean_grad/range_1/start"
  input: "gradients/Mean_grad/Rank"
  input: "gradients/Mean_grad/range_1/delta"
}
node {
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/range_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Rank_1"
  op: "Rank"
  input: "gradients/Mean_grad/Shape_3"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/range_2/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range_2/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/range_2"
  op: "Range"
  input: "gradients/Mean_grad/range_2/start"
  input: "gradients/Mean_grad/Rank_1"
  input: "gradients/Mean_grad/range_2/delta"
}
node {
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_3"
  input: "gradients/Mean_grad/range_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv_1"
  op: "Div"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/truediv"
  op: "Div"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Exit_2_grad/b_exit"
  op: "Enter"
  input: "gradients/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Exit_3_grad/b_exit"
  op: "Enter"
  input: "gradients/zeros_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_2_grad/b_switch"
  op: "Merge"
  input: "gradients/RNN/while/Exit_2_grad/b_exit"
  input: "gradients/RNN/while/Switch_2_grad_1/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_3_grad/b_switch"
  op: "Merge"
  input: "gradients/RNN/while/Exit_3_grad/b_exit"
  input: "gradients/RNN/while/Switch_3_grad_1/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_2_grad/Switch"
  op: "Switch"
  input: "gradients/RNN/while/Switch_2_grad/b_switch"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_2_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Merge_2_grad/Switch"
}
node {
  name: "gradients/RNN/while/Merge_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Merge_2_grad/Switch"
  input: "^gradients/RNN/while/Merge_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_2_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Merge_2_grad/Switch:1"
  input: "^gradients/RNN/while/Merge_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_2_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_3_grad/Switch"
  op: "Switch"
  input: "gradients/RNN/while/Switch_3_grad/b_switch"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_3_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_3_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Merge_3_grad/Switch"
}
node {
  name: "gradients/RNN/while/Merge_3_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Merge_3_grad/Switch"
  input: "^gradients/RNN/while/Merge_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_3_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_3_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Merge_3_grad/Switch:1"
  input: "^gradients/RNN/while/Merge_3_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_3_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/Neg_grad/Neg"
  op: "Neg"
  input: "gradients/Mean_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Enter_2_grad/Exit"
  op: "Exit"
  input: "gradients/RNN/while/Merge_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Enter_3_grad/Exit"
  op: "Exit"
  input: "gradients/RNN/while/Merge_3_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sum_grad/Shape"
  op: "Shape"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sum_grad/Size"
  op: "Size"
  input: "gradients/Sum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/add"
  op: "Add"
  input: "Sum/reduction_indices"
  input: "gradients/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/mod"
  op: "Mod"
  input: "gradients/Sum_grad/add"
  input: "gradients/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/Shape_1"
  op: "Shape"
  input: "gradients/Sum_grad/mod"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/range"
  op: "Range"
  input: "gradients/Sum_grad/range/start"
  input: "gradients/Sum_grad/Size"
  input: "gradients/Sum_grad/range/delta"
}
node {
  name: "gradients/Sum_grad/Fill/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Fill"
  op: "Fill"
  input: "gradients/Sum_grad/Shape_1"
  input: "gradients/Sum_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/Sum_grad/range"
  input: "gradients/Sum_grad/mod"
  input: "gradients/Sum_grad/Shape"
  input: "gradients/Sum_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Sum_grad/Maximum"
  op: "Maximum"
  input: "gradients/Sum_grad/DynamicStitch"
  input: "gradients/Sum_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/floordiv"
  op: "Div"
  input: "gradients/Sum_grad/Shape"
  input: "gradients/Sum_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients/Neg_grad/Neg"
  input: "gradients/Sum_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Sum_grad/Tile"
  op: "Tile"
  input: "gradients/Sum_grad/Reshape"
  input: "gradients/Sum_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/RefEnter"
  input: "RNN/while/Identity_2"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_2"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like/b_sync"
  op: "ControlTrigger"
  input: "^gradients/RNN/while/Select_1_grad/zeros_like/StackPop"
  input: "^gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "^gradients/RNN/while/Select_2_grad/zeros_like/StackPop"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPop"
}
node {
  name: "gradients/RNN/while/Select_1_grad/zeros_like"
  op: "ZerosLike"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/GreaterEqual"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_1_grad/Select/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/GreaterEqual"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/Select_1_grad/Select/RefEnter"
  input: "RNN/while/GreaterEqual"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/GreaterEqual"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_1_grad/Select/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/GreaterEqual"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/GreaterEqual"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/Merge_2_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/Select_1_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/Select_1"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/Select_1_grad/zeros_like"
  input: "gradients/RNN/while/Merge_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Select_1_grad/Select"
  input: "^gradients/RNN/while/Select_1_grad/Select_1"
}
node {
  name: "gradients/RNN/while/Select_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Select_1_grad/Select"
  input: "^gradients/RNN/while/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_1_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Select_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Select_1_grad/Select_1"
  input: "^gradients/RNN/while/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_1_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_3"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_3"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/RefEnter"
  input: "RNN/while/Identity_3"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_3"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_3"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/Identity_3"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/zeros_like"
  op: "ZerosLike"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/Select"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/Merge_3_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/Select_2_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/Select_1"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/Select_2_grad/zeros_like"
  input: "gradients/RNN/while/Merge_3_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Select_2_grad/Select"
  input: "^gradients/RNN/while/Select_2_grad/Select_1"
}
node {
  name: "gradients/RNN/while/Select_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Select_2_grad/Select"
  input: "^gradients/RNN/while/Select_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_2_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Select_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Select_2_grad/Select_1"
  input: "^gradients/RNN/while/Select_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_2_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/Shape"
  op: "Shape"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Shape_1"
  op: "Shape"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mul_grad/Shape"
  input: "gradients/mul_grad/Shape_1"
}
node {
  name: "gradients/mul_grad/mul"
  op: "Mul"
  input: "gradients/Sum_grad/Tile"
  input: "Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum"
  op: "Sum"
  input: "gradients/mul_grad/mul"
  input: "gradients/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mul_grad/Sum"
  input: "gradients/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/mul_1"
  op: "Mul"
  input: "Placeholder_2"
  input: "gradients/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mul_grad/mul_1"
  input: "gradients/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mul_grad/Sum_1"
  input: "gradients/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/Reshape_1"
}
node {
  name: "gradients/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_grad/Reshape"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_grad/Reshape_1"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/add_grad/Shape"
  op: "Shape"
  input: "MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_grad/Shape_1"
  op: "Shape"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/add_grad/Shape"
  input: "gradients/add_grad/Shape_1"
}
node {
  name: "gradients/add_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/Enter_3_grad/Exit"
  input: "gradients/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/add_grad/Sum"
  input: "gradients/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/Enter_3_grad/Exit"
  input: "gradients/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/add_grad/Sum_1"
  input: "gradients/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/add_grad/Reshape"
  input: "^gradients/add_grad/Reshape_1"
}
node {
  name: "gradients/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/add_grad/Reshape"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/add_grad/Reshape_1"
  input: "^gradients/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Log_grad/Inv"
  op: "Inv"
  input: "Softmax"
  input: "^gradients/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Log_grad/mul"
  op: "Mul"
  input: "gradients/mul_grad/tuple/control_dependency_1"
  input: "gradients/Log_grad/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/add_grad/tuple/control_dependency"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "cnn_layers/fc_1/Tanh"
  input: "gradients/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/MatMul_grad/MatMul_1"
  input: "^gradients/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/Softmax_grad/mul"
  op: "Mul"
  input: "gradients/Log_grad/mul"
  input: "Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Softmax_grad/Sum"
  op: "Sum"
  input: "gradients/Softmax_grad/mul"
  input: "gradients/Softmax_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Softmax_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Softmax_grad/Reshape"
  op: "Reshape"
  input: "gradients/Softmax_grad/Sum"
  input: "gradients/Softmax_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_grad/sub"
  op: "Sub"
  input: "gradients/Log_grad/mul"
  input: "gradients/Softmax_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Softmax_grad/mul_1"
  op: "Mul"
  input: "gradients/Softmax_grad/sub"
  input: "Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/Tanh_grad/Square"
  op: "Square"
  input: "cnn_layers/fc_1/Tanh"
  input: "^gradients/MatMul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/Tanh_grad/sub/x"
  op: "Const"
  input: "^gradients/MatMul_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/Tanh_grad/sub"
  op: "Sub"
  input: "gradients/cnn_layers/fc_1/Tanh_grad/sub/x"
  input: "gradients/cnn_layers/fc_1/Tanh_grad/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/Tanh_grad/mul"
  op: "Mul"
  input: "gradients/MatMul_grad/tuple/control_dependency"
  input: "gradients/cnn_layers/fc_1/Tanh_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/fully_connected/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/Softmax_grad/mul_1"
  input: "fully_connected/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/cnn_layers/fc_1/Tanh_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/fc_1/Tanh_grad/mul"
  input: "^gradients/cnn_layers/fc_1/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/fc_1/Tanh_grad/mul"
  input: "^gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/fc_1/Tanh_grad/mul"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/fc_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/fc_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/fully_connected/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/fully_connected/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/fully_connected/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/fully_connected/Relu_grad/ReluGrad"
  input: "^gradients/fully_connected/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/fully_connected/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/fully_connected/Relu_grad/ReluGrad"
  input: "^gradients/fully_connected/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fully_connected/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/fully_connected/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fully_connected/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/fully_connected/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fully_connected/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/control_dependency"
  input: "fc_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "cnn_layers/Flatten/Reshape"
  input: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/fc_1/MatMul_grad/MatMul"
  input: "^gradients/cnn_layers/fc_1/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/cnn_layers/fc_1/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/fc_1/MatMul_grad/MatMul"
  input: "^gradients/cnn_layers/fc_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/fc_1/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/fc_1/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/fc_1/MatMul_grad/MatMul_1"
  input: "^gradients/cnn_layers/fc_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/fc_1/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/fully_connected/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/fully_connected/BiasAdd_grad/tuple/control_dependency"
  input: "fully_connected/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/fully_connected/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "Reshape"
  input: "gradients/fully_connected/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/fully_connected/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/fully_connected/MatMul_grad/MatMul"
  input: "^gradients/fully_connected/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/fully_connected/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/fully_connected/MatMul_grad/MatMul"
  input: "^gradients/fully_connected/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fully_connected/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/fully_connected/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/fully_connected/MatMul_grad/MatMul_1"
  input: "^gradients/fully_connected/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/fully_connected/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/Flatten/Reshape_grad/Shape"
  op: "Shape"
  input: "cnn_layers/conv_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/Flatten/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/cnn_layers/fc_1/MatMul_grad/tuple/control_dependency"
  input: "gradients/cnn_layers/Flatten/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "RNN/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/fully_connected/MatMul_grad/tuple/control_dependency"
  input: "gradients/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/cnn_layers/Flatten/Reshape_grad/Reshape"
  input: "cnn_layers/conv_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/transpose_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "RNN/transpose/perm"
}
node {
  name: "gradients/RNN/transpose_grad/transpose"
  op: "Transpose"
  input: "gradients/Reshape_grad/Reshape"
  input: "gradients/RNN/transpose_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/cnn_layers/conv_4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_4/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_4/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_4/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_4/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_4/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_4/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/RNN/TensorArrayPack_grad/TensorArray/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/RNN/TensorArrayPack_grad/TensorArrayGrad/TensorArrayGrad"
  op: "TensorArrayGrad"
  input: "RNN/TensorArray"
  input: "RNN/while/Exit_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "source"
    value {
      s: "gradients"
    }
  }
}
node {
  name: "gradients/RNN/TensorArrayPack_grad/TensorArrayGrad/gradient_flow"
  op: "Identity"
  input: "RNN/while/Exit_1"
  input: "^gradients/RNN/TensorArrayPack_grad/TensorArrayGrad/TensorArrayGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
}
node {
  name: "gradients/RNN/TensorArrayPack_grad/TensorArrayUnpack"
  op: "TensorArrayUnpack"
  input: "gradients/RNN/TensorArrayPack_grad/TensorArrayGrad/TensorArrayGrad"
  input: "gradients/RNN/transpose_grad/transpose"
  input: "gradients/RNN/TensorArrayPack_grad/TensorArrayGrad/gradient_flow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
}
node {
  name: "gradients/RNN/TensorArrayPack_grad/TensorArray_1/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/Shape"
  op: "Shape"
  input: "cnn_layers/conv_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/Shape"
  input: "conv_4/weights/read"
  input: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "conv_4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "cnn_layers/conv_3/Relu"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/Shape_1"
  input: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_4/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/cnn_layers/conv_4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_4/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Exit_1_grad/b_exit"
  op: "Enter"
  input: "gradients/RNN/TensorArrayPack_grad/TensorArrayUnpack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/tuple/control_dependency"
  input: "cnn_layers/conv_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_1_grad/b_switch"
  op: "Merge"
  input: "gradients/RNN/while/Exit_1_grad/b_exit"
  input: "gradients/RNN/while/Switch_1_grad_1/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/cnn_layers/conv_3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_3/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_3/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_3/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_3/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_3/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_1_grad/Switch"
  op: "Switch"
  input: "gradients/RNN/while/Switch_1_grad/b_switch"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_1_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Merge_1_grad/Switch"
}
node {
  name: "gradients/RNN/while/Merge_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Merge_1_grad/Switch"
  input: "^gradients/RNN/while/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_1_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Merge_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Merge_1_grad/Switch:1"
  input: "^gradients/RNN/while/Merge_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_1_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/Shape"
  op: "Shape"
  input: "cnn_layers/conv_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/Shape"
  input: "conv_3/weights/read"
  input: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "conv_3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "cnn_layers/conv_2/Relu"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/Shape_1"
  input: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_3/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/cnn_layers/conv_3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_3/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/tuple/control_dependency"
  input: "cnn_layers/conv_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArray/Const"
  op: "Const"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/TensorArrayGrad/RefEnter"
  op: "RefEnter"
  input: "RNN/TensorArray"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/TensorArrayGrad"
  op: "TensorArrayGrad"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/TensorArrayGrad/RefEnter"
  input: "gradients/RNN/while/Merge_1_grad/tuple/control_dependency_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "source"
    value {
      s: "gradients"
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/gradient_flow"
  op: "Identity"
  input: "gradients/RNN/while/Merge_1_grad/tuple/control_dependency_1"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/TensorArrayGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
        s: "loc:@RNN/while/Identity"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
        s: "loc:@RNN/while/Identity"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/RefEnter"
  input: "RNN/while/Identity"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
        s: "loc:@RNN/while/Identity"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
        s: "loc:@RNN/while/Identity"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
        s: "loc:@RNN/while/Identity"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead"
  op: "TensorArrayRead"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/TensorArrayGrad"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead/StackPop"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayGrad/gradient_flow"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Merge_1_grad/tuple/control_dependency_1"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead"
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/TensorArrayWrite_grad/TensorArrayRead"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/TensorArrayWrite_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Merge_1_grad/tuple/control_dependency_1"
  input: "^gradients/RNN/while/TensorArrayWrite_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Switch_1_grad/b_switch"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/cnn_layers/conv_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_2/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_2/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_2/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_2/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/zeros_like/Enter"
  op: "Enter"
  input: "RNN/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/zeros_like"
  op: "ZerosLike"
  input: "gradients/RNN/while/Select_grad/zeros_like/Enter"
  input: "^gradients/Sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/Select"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/TensorArrayWrite_grad/tuple/control_dependency"
  input: "gradients/RNN/while/Select_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/Select_1"
  op: "Select"
  input: "gradients/RNN/while/Select_1_grad/Select/StackPop"
  input: "gradients/RNN/while/Select_grad/zeros_like"
  input: "gradients/RNN/while/TensorArrayWrite_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/Select_grad/Select"
  input: "^gradients/RNN/while/Select_grad/Select_1"
}
node {
  name: "gradients/RNN/while/Select_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/Select_grad/Select"
  input: "^gradients/RNN/while/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Select_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/Select_grad/Select_1"
  input: "^gradients/RNN/while/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/Select_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/Shape"
  op: "Shape"
  input: "cnn_layers/conv_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/Shape"
  input: "conv_2/weights/read"
  input: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "conv_2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "cnn_layers/conv_1/Relu"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/Shape_1"
  input: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_2/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/cnn_layers/conv_2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_2/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Floor"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Floor"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Floor"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Floor"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Floor"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Floor"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/Select_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/mul"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/mul"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/mul"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/mul"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/mul"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/mul"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1/StackPop"
  input: "gradients/RNN/while/Select_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_1_grad_1/NextIteration"
  op: "NextIteration"
  input: "gradients/RNN/while/TensorArrayWrite_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/tuple/control_dependency"
  input: "cnn_layers/conv_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Inv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Inv"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Inv"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/dropout/Inv"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Inv"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Inv"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/dropout/Inv"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/cnn_layers/conv_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_1/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_1/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_1/Relu_grad/ReluGrad"
  input: "^gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_1/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/Shape"
  op: "Shape"
  input: "CNN_Input"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/cnn_layers/conv_1/Conv2D_grad/Shape"
  input: "conv_1/weights/read"
  input: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/Shape_1"
  op: "Shape"
  input: "conv_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CNN_Input"
  input: "gradients/cnn_layers/conv_1/Conv2D_grad/Shape_1"
  input: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/cnn_layers/conv_1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/cnn_layers/conv_1/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/cnn_layers/conv_1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cnn_layers/conv_1/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/RNN/while/Select_2_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/dropout/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul"
  op: "Mul"
  input: "gradients/AddN"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop"
  input: "gradients/AddN"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/Square"
  op: "Square"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul_1/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/sub/x"
  op: "Const"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/sub"
  op: "Sub"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/sub/x"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/sub/x"
  op: "Const"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/sub"
  op: "Sub"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/sub/x"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/mul/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_2_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/RNN/while/Select_1_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_1_grad/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
  op: "Shape"
  input: "RNN/while/Identity_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/Select_1_grad/zeros_like/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_2_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/RNN/while/Select_1_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/sub/x"
  op: "Const"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/sub"
  op: "Sub"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/sub/x"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/mul/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/sub/x"
  op: "Const"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/sub"
  op: "Sub"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/sub/x"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul_1/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/mul_1"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/Square"
  op: "Square"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/mul/StackPop"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/sub/x"
  op: "Const"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/sub"
  op: "Sub"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/sub/x"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/mul"
  op: "Mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_2_grad_1/NextIteration"
  op: "NextIteration"
  input: "gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split/split_dim"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat"
  op: "Concat"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_1_grad/mul_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Tanh_grad/mul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_1_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Sigmoid_2_grad/mul_1"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
  op: "Shape"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter"
  input: "^RNN/while/Identity"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc_1"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/RefEnter_1"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPush_1"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/RefEnter_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/f_acc_1"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Shape_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Sum"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/split_grad/concat"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Sum_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/BroadcastGradientArgs/StackPop_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul/Enter"
  op: "Enter"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_1"
  op: "Enter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_2"
  op: "Merge"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/Switch"
  op: "Switch"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_2"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/Add"
  op: "Add"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/Switch:1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/NextIteration"
  op: "NextIteration"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_3"
  op: "Exit"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/RefEnter"
  input: "RNN/while/TensorArrayRead"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/TensorArray_1"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN"
  op: "ShapeN"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN/StackPop"
  input: "gradients/RNN/while/Select_2_grad/zeros_like/StackPop"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/f_acc"
  op: "Stack"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "stack_name"
    value {
      s: ""
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPush"
  op: "StackPush"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/RefEnter"
  input: "RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
  input: "^gradients/Add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
      }
    }
  }
  attr {
    key: "swap_memory"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPop/RefEnter"
  op: "RefEnter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/f_acc"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPop"
  op: "StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPop/RefEnter"
  input: "^gradients/Sub"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat/concat_dim"
      }
    }
  }
  attr {
    key: "elem_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset"
  op: "ConcatOffset"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset/StackPop"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN:1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice"
  op: "Slice"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice_1"
  op: "Slice"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ConcatOffset:1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/ShapeN:1"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice_1"
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice_1"
  input: "^gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/Slice_1"
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 861
          }
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_1"
  op: "Enter"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "gradients/RNN/while/RNN/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_2"
  op: "Merge"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/Switch"
  op: "Switch"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_2"
  input: "gradients/b_count_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/Add"
  op: "Add"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/Switch:1"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/NextIteration"
  op: "NextIteration"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/Add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_3"
  op: "Exit"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/RNN/while/Select_2_grad/tuple/control_dependency"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/concat_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/RNN/while/Switch_3_grad_1/NextIteration"
  op: "NextIteration"
  input: "gradients/AddN_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.899999976158
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "zeros"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
          dim {
            size: 8
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_1/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 8
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/weights/Adam/Assign"
  op: "Assign"
  input: "conv_1/weights/Adam"
  input: "zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/weights/Adam/read"
  op: "Identity"
  input: "conv_1/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "zeros_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
          dim {
            size: 8
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_1/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
        dim {
          size: 8
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/weights/Adam_1/Assign"
  op: "Assign"
  input: "conv_1/weights/Adam_1"
  input: "zeros_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/weights/Adam_1/read"
  op: "Identity"
  input: "conv_1/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "zeros_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_1/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/biases/Adam/Assign"
  op: "Assign"
  input: "conv_1/biases/Adam"
  input: "zeros_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/biases/Adam/read"
  op: "Identity"
  input: "conv_1/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
}
node {
  name: "zeros_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_1/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_1/biases/Adam_1/Assign"
  op: "Assign"
  input: "conv_1/biases/Adam_1"
  input: "zeros_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_1/biases/Adam_1/read"
  op: "Identity"
  input: "conv_1/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
}
node {
  name: "zeros_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 6
          }
          dim {
            size: 6
          }
          dim {
            size: 32
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_2/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 6
        }
        dim {
          size: 6
        }
        dim {
          size: 32
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/weights/Adam/Assign"
  op: "Assign"
  input: "conv_2/weights/Adam"
  input: "zeros_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/weights/Adam/read"
  op: "Identity"
  input: "conv_2/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "zeros_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 6
          }
          dim {
            size: 6
          }
          dim {
            size: 32
          }
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_2/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 6
        }
        dim {
          size: 6
        }
        dim {
          size: 32
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/weights/Adam_1/Assign"
  op: "Assign"
  input: "conv_2/weights/Adam_1"
  input: "zeros_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/weights/Adam_1/read"
  op: "Identity"
  input: "conv_2/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
}
node {
  name: "zeros_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_2/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/biases/Adam/Assign"
  op: "Assign"
  input: "conv_2/biases/Adam"
  input: "zeros_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/biases/Adam/read"
  op: "Identity"
  input: "conv_2/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
}
node {
  name: "zeros_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_2/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_2/biases/Adam_1/Assign"
  op: "Assign"
  input: "conv_2/biases/Adam_1"
  input: "zeros_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_2/biases/Adam_1/read"
  op: "Identity"
  input: "conv_2/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
}
node {
  name: "zeros_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
          dim {
            size: 4
          }
          dim {
            size: 16
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_3/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 4
        }
        dim {
          size: 16
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/weights/Adam/Assign"
  op: "Assign"
  input: "conv_3/weights/Adam"
  input: "zeros_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/weights/Adam/read"
  op: "Identity"
  input: "conv_3/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "zeros_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
          dim {
            size: 4
          }
          dim {
            size: 16
          }
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_3/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 4
        }
        dim {
          size: 16
        }
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/weights/Adam_1/Assign"
  op: "Assign"
  input: "conv_3/weights/Adam_1"
  input: "zeros_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/weights/Adam_1/read"
  op: "Identity"
  input: "conv_3/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
}
node {
  name: "zeros_10"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_3/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/biases/Adam/Assign"
  op: "Assign"
  input: "conv_3/biases/Adam"
  input: "zeros_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/biases/Adam/read"
  op: "Identity"
  input: "conv_3/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
}
node {
  name: "zeros_11"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 8
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_3/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 8
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_3/biases/Adam_1/Assign"
  op: "Assign"
  input: "conv_3/biases/Adam_1"
  input: "zeros_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_3/biases/Adam_1/read"
  op: "Identity"
  input: "conv_3/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
}
node {
  name: "zeros_12"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
          dim {
            size: 2
          }
          dim {
            size: 8
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_4/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 2
        }
        dim {
          size: 8
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/weights/Adam/Assign"
  op: "Assign"
  input: "conv_4/weights/Adam"
  input: "zeros_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/weights/Adam/read"
  op: "Identity"
  input: "conv_4/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "zeros_13"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 2
          }
          dim {
            size: 2
          }
          dim {
            size: 8
          }
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_4/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 2
        }
        dim {
          size: 8
        }
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/weights/Adam_1/Assign"
  op: "Assign"
  input: "conv_4/weights/Adam_1"
  input: "zeros_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/weights/Adam_1/read"
  op: "Identity"
  input: "conv_4/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
}
node {
  name: "zeros_14"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_4/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/biases/Adam/Assign"
  op: "Assign"
  input: "conv_4/biases/Adam"
  input: "zeros_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/biases/Adam/read"
  op: "Identity"
  input: "conv_4/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
}
node {
  name: "zeros_15"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv_4/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv_4/biases/Adam_1/Assign"
  op: "Assign"
  input: "conv_4/biases/Adam_1"
  input: "zeros_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv_4/biases/Adam_1/read"
  op: "Identity"
  input: "conv_4/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
}
node {
  name: "zeros_16"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc_1/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/weights/Adam/Assign"
  op: "Assign"
  input: "fc_1/weights/Adam"
  input: "zeros_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/weights/Adam/read"
  op: "Identity"
  input: "fc_1/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "zeros_17"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc_1/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/weights/Adam_1/Assign"
  op: "Assign"
  input: "fc_1/weights/Adam_1"
  input: "zeros_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/weights/Adam_1/read"
  op: "Identity"
  input: "fc_1/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
}
node {
  name: "zeros_18"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc_1/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/biases/Adam/Assign"
  op: "Assign"
  input: "fc_1/biases/Adam"
  input: "zeros_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/biases/Adam/read"
  op: "Identity"
  input: "fc_1/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
}
node {
  name: "zeros_19"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fc_1/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fc_1/biases/Adam_1/Assign"
  op: "Assign"
  input: "fc_1/biases/Adam_1"
  input: "zeros_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fc_1/biases/Adam_1/read"
  op: "Identity"
  input: "fc_1/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
}
node {
  name: "zeros_20"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam/Assign"
  op: "Assign"
  input: "Variable/Adam"
  input: "zeros_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam/read"
  op: "Identity"
  input: "Variable/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "zeros_21"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 300
          }
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Adam_1/Assign"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "zeros_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/Adam_1/read"
  op: "Identity"
  input: "Variable/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "zeros_22"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam/Assign"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "zeros_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam/read"
  op: "Identity"
  input: "Variable_1/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "zeros_23"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 820
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Adam_1/Assign"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "zeros_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/Adam_1/read"
  op: "Identity"
  input: "Variable_1/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "zeros_24"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 861
          }
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 861
        }
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  input: "zeros_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "zeros_25"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 861
          }
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 861
        }
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  input: "zeros_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "zeros_26"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  input: "zeros_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
}
node {
  name: "zeros_27"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3280
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3280
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  input: "zeros_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1/read"
  op: "Identity"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
}
node {
  name: "zeros_28"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 820
          }
          dim {
            size: 41
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fully_connected/weights/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/weights/Adam/Assign"
  op: "Assign"
  input: "fully_connected/weights/Adam"
  input: "zeros_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/weights/Adam/read"
  op: "Identity"
  input: "fully_connected/weights/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "zeros_29"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 820
          }
          dim {
            size: 41
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fully_connected/weights/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 820
        }
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/weights/Adam_1/Assign"
  op: "Assign"
  input: "fully_connected/weights/Adam_1"
  input: "zeros_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/weights/Adam_1/read"
  op: "Identity"
  input: "fully_connected/weights/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
}
node {
  name: "zeros_30"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 41
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fully_connected/biases/Adam"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/biases/Adam/Assign"
  op: "Assign"
  input: "fully_connected/biases/Adam"
  input: "zeros_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/biases/Adam/read"
  op: "Identity"
  input: "fully_connected/biases/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
}
node {
  name: "zeros_31"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 41
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "fully_connected/biases/Adam_1"
  op: "Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 41
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "fully_connected/biases/Adam_1/Assign"
  op: "Assign"
  input: "fully_connected/biases/Adam_1"
  input: "zeros_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "fully_connected/biases/Adam_1/read"
  op: "Identity"
  input: "fully_connected/biases/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
}
node {
  name: "Adam/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999974738e-05
      }
    }
  }
}
node {
  name: "Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.899999976158
      }
    }
  }
}
node {
  name: "Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.00999999977648
      }
    }
  }
}
node {
  name: "Adam/update_conv_1/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_1/weights"
  input: "conv_1/weights/Adam"
  input: "conv_1/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_1/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_1/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_1/biases"
  input: "conv_1/biases/Adam"
  input: "conv_1/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_2/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_2/weights"
  input: "conv_2/weights/Adam"
  input: "conv_2/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_2/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_2/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_2/biases"
  input: "conv_2/biases/Adam"
  input: "conv_2/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_3/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_3/weights"
  input: "conv_3/weights/Adam"
  input: "conv_3/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_3/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_3/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_3/biases"
  input: "conv_3/biases/Adam"
  input: "conv_3/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_3/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_4/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_4/weights"
  input: "conv_4/weights/Adam"
  input: "conv_4/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_4/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_conv_4/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "conv_4/biases"
  input: "conv_4/biases/Adam"
  input: "conv_4/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/conv_4/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc_1/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "fc_1/weights"
  input: "fc_1/weights/Adam"
  input: "fc_1/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/fc_1/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fc_1/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "fc_1/biases"
  input: "fc_1/biases/Adam"
  input: "fc_1/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/cnn_layers/fc_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_Variable_1/ApplyAdam"
  op: "ApplyAdam"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/ApplyAdam"
  op: "ApplyAdam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/Linear/MatMul/Enter_grad/b_acc_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/ApplyAdam"
  op: "ApplyAdam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/RNN/while/MultiRNNCell/Cell0/BasicLSTMCell/add/Enter_grad/b_acc_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fully_connected/weights/ApplyAdam"
  op: "ApplyAdam"
  input: "fully_connected/weights"
  input: "fully_connected/weights/Adam"
  input: "fully_connected/weights/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fully_connected/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_fully_connected/biases/ApplyAdam"
  op: "ApplyAdam"
  input: "fully_connected/biases"
  input: "fully_connected/biases/Adam"
  input: "fully_connected/biases/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/fully_connected/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "Adam/beta1"
  input: "^Adam/update_conv_1/weights/ApplyAdam"
  input: "^Adam/update_conv_1/biases/ApplyAdam"
  input: "^Adam/update_conv_2/weights/ApplyAdam"
  input: "^Adam/update_conv_2/biases/ApplyAdam"
  input: "^Adam/update_conv_3/weights/ApplyAdam"
  input: "^Adam/update_conv_3/biases/ApplyAdam"
  input: "^Adam/update_conv_4/weights/ApplyAdam"
  input: "^Adam/update_conv_4/biases/ApplyAdam"
  input: "^Adam/update_fc_1/weights/ApplyAdam"
  input: "^Adam/update_fc_1/biases/ApplyAdam"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/ApplyAdam"
  input: "^Adam/update_fully_connected/weights/ApplyAdam"
  input: "^Adam/update_fully_connected/biases/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "Adam/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "Adam/beta2"
  input: "^Adam/update_conv_1/weights/ApplyAdam"
  input: "^Adam/update_conv_1/biases/ApplyAdam"
  input: "^Adam/update_conv_2/weights/ApplyAdam"
  input: "^Adam/update_conv_2/biases/ApplyAdam"
  input: "^Adam/update_conv_3/weights/ApplyAdam"
  input: "^Adam/update_conv_3/biases/ApplyAdam"
  input: "^Adam/update_conv_4/weights/ApplyAdam"
  input: "^Adam/update_conv_4/biases/ApplyAdam"
  input: "^Adam/update_fc_1/weights/ApplyAdam"
  input: "^Adam/update_fc_1/biases/ApplyAdam"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/ApplyAdam"
  input: "^Adam/update_fully_connected/weights/ApplyAdam"
  input: "^Adam/update_fully_connected/biases/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
}
node {
  name: "Adam/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam"
  op: "NoOp"
  input: "^Adam/update_conv_1/weights/ApplyAdam"
  input: "^Adam/update_conv_1/biases/ApplyAdam"
  input: "^Adam/update_conv_2/weights/ApplyAdam"
  input: "^Adam/update_conv_2/biases/ApplyAdam"
  input: "^Adam/update_conv_3/weights/ApplyAdam"
  input: "^Adam/update_conv_3/biases/ApplyAdam"
  input: "^Adam/update_conv_4/weights/ApplyAdam"
  input: "^Adam/update_conv_4/biases/ApplyAdam"
  input: "^Adam/update_fc_1/weights/ApplyAdam"
  input: "^Adam/update_fc_1/biases/ApplyAdam"
  input: "^Adam/update_Variable/ApplyAdam"
  input: "^Adam/update_Variable_1/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/ApplyAdam"
  input: "^Adam/update_RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/ApplyAdam"
  input: "^Adam/update_fully_connected/weights/ApplyAdam"
  input: "^Adam/update_fully_connected/biases/ApplyAdam"
  input: "^Adam/Assign"
  input: "^Adam/Assign_1"
}
node {
  name: "init"
  op: "NoOp"
  input: "^conv_1/weights/Assign"
  input: "^conv_1/biases/Assign"
  input: "^conv_2/weights/Assign"
  input: "^conv_2/biases/Assign"
  input: "^conv_3/weights/Assign"
  input: "^conv_3/biases/Assign"
  input: "^conv_4/weights/Assign"
  input: "^conv_4/biases/Assign"
  input: "^fc_1/weights/Assign"
  input: "^fc_1/biases/Assign"
  input: "^Variable/Assign"
  input: "^Variable_1/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Assign"
  input: "^fully_connected/weights/Assign"
  input: "^fully_connected/biases/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
  input: "^conv_1/weights/Adam/Assign"
  input: "^conv_1/weights/Adam_1/Assign"
  input: "^conv_1/biases/Adam/Assign"
  input: "^conv_1/biases/Adam_1/Assign"
  input: "^conv_2/weights/Adam/Assign"
  input: "^conv_2/weights/Adam_1/Assign"
  input: "^conv_2/biases/Adam/Assign"
  input: "^conv_2/biases/Adam_1/Assign"
  input: "^conv_3/weights/Adam/Assign"
  input: "^conv_3/weights/Adam_1/Assign"
  input: "^conv_3/biases/Adam/Assign"
  input: "^conv_3/biases/Adam_1/Assign"
  input: "^conv_4/weights/Adam/Assign"
  input: "^conv_4/weights/Adam_1/Assign"
  input: "^conv_4/biases/Adam/Assign"
  input: "^conv_4/biases/Adam_1/Assign"
  input: "^fc_1/weights/Adam/Assign"
  input: "^fc_1/weights/Adam_1/Assign"
  input: "^fc_1/biases/Adam/Assign"
  input: "^fc_1/biases/Adam_1/Assign"
  input: "^Variable/Adam/Assign"
  input: "^Variable/Adam_1/Assign"
  input: "^Variable_1/Adam/Assign"
  input: "^Variable_1/Adam_1/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam/Assign"
  input: "^RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1/Assign"
  input: "^fully_connected/weights/Adam/Assign"
  input: "^fully_connected/weights/Adam_1/Assign"
  input: "^fully_connected/biases/Adam/Assign"
  input: "^fully_connected/biases/Adam_1/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/save/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 50
          }
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
        string_val: "Variable"
        string_val: "Variable/Adam"
        string_val: "Variable/Adam_1"
        string_val: "Variable_1"
        string_val: "Variable_1/Adam"
        string_val: "Variable_1/Adam_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
        string_val: "conv_1/biases"
        string_val: "conv_1/biases/Adam"
        string_val: "conv_1/biases/Adam_1"
        string_val: "conv_1/weights"
        string_val: "conv_1/weights/Adam"
        string_val: "conv_1/weights/Adam_1"
        string_val: "conv_2/biases"
        string_val: "conv_2/biases/Adam"
        string_val: "conv_2/biases/Adam_1"
        string_val: "conv_2/weights"
        string_val: "conv_2/weights/Adam"
        string_val: "conv_2/weights/Adam_1"
        string_val: "conv_3/biases"
        string_val: "conv_3/biases/Adam"
        string_val: "conv_3/biases/Adam_1"
        string_val: "conv_3/weights"
        string_val: "conv_3/weights/Adam"
        string_val: "conv_3/weights/Adam_1"
        string_val: "conv_4/biases"
        string_val: "conv_4/biases/Adam"
        string_val: "conv_4/biases/Adam_1"
        string_val: "conv_4/weights"
        string_val: "conv_4/weights/Adam"
        string_val: "conv_4/weights/Adam_1"
        string_val: "fc_1/biases"
        string_val: "fc_1/biases/Adam"
        string_val: "fc_1/biases/Adam_1"
        string_val: "fc_1/weights"
        string_val: "fc_1/weights/Adam"
        string_val: "fc_1/weights/Adam_1"
        string_val: "fully_connected/biases"
        string_val: "fully_connected/biases/Adam"
        string_val: "fully_connected/biases/Adam_1"
        string_val: "fully_connected/weights"
        string_val: "fully_connected/weights/Adam"
        string_val: "fully_connected/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/save/shapes_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 50
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/save"
  op: "SaveSlices"
  input: "save/Const"
  input: "save/save/tensor_names"
  input: "save/save/shapes_and_slices"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  input: "Variable"
  input: "Variable/Adam"
  input: "Variable/Adam_1"
  input: "Variable_1"
  input: "Variable_1/Adam"
  input: "Variable_1/Adam_1"
  input: "beta1_power"
  input: "beta2_power"
  input: "conv_1/biases"
  input: "conv_1/biases/Adam"
  input: "conv_1/biases/Adam_1"
  input: "conv_1/weights"
  input: "conv_1/weights/Adam"
  input: "conv_1/weights/Adam_1"
  input: "conv_2/biases"
  input: "conv_2/biases/Adam"
  input: "conv_2/biases/Adam_1"
  input: "conv_2/weights"
  input: "conv_2/weights/Adam"
  input: "conv_2/weights/Adam_1"
  input: "conv_3/biases"
  input: "conv_3/biases/Adam"
  input: "conv_3/biases/Adam_1"
  input: "conv_3/weights"
  input: "conv_3/weights/Adam"
  input: "conv_3/weights/Adam_1"
  input: "conv_4/biases"
  input: "conv_4/biases/Adam"
  input: "conv_4/biases/Adam_1"
  input: "conv_4/weights"
  input: "conv_4/weights/Adam"
  input: "conv_4/weights/Adam_1"
  input: "fc_1/biases"
  input: "fc_1/biases/Adam"
  input: "fc_1/biases/Adam_1"
  input: "fc_1/weights"
  input: "fc_1/weights/Adam"
  input: "fc_1/weights/Adam_1"
  input: "fully_connected/biases"
  input: "fully_connected/biases/Adam"
  input: "fully_connected/biases/Adam_1"
  input: "fully_connected/weights"
  input: "fully_connected/weights/Adam"
  input: "fully_connected/weights/Adam_1"
  attr {
    key: "T"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/save"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/restore_slice/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
}
node {
  name: "save/restore_slice/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice/tensor_name"
  input: "save/restore_slice/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
  input: "save/restore_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_1/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_1/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_1"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_1/tensor_name"
  input: "save/restore_slice_1/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam"
  input: "save/restore_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_2/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_2/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_2"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_2/tensor_name"
  input: "save/restore_slice_2/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias/Adam_1"
  input: "save/restore_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_3/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
}
node {
  name: "save/restore_slice_3/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_3"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_3/tensor_name"
  input: "save/restore_slice_3/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
  input: "save/restore_slice_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_4/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_4/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_4"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_4/tensor_name"
  input: "save/restore_slice_4/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam"
  input: "save/restore_slice_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_5/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_5/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_5"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_5/tensor_name"
  input: "save/restore_slice_5/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix/Adam_1"
  input: "save/restore_slice_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@RNN/MultiRNNCell/Cell0/BasicLSTMCell/Linear/Matrix"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_6/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/restore_slice_6/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_6"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_6/tensor_name"
  input: "save/restore_slice_6/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "Variable"
  input: "save/restore_slice_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_7/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_7/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_7"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_7/tensor_name"
  input: "save/restore_slice_7/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "Variable/Adam"
  input: "save/restore_slice_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_8/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_8/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_8"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_8/tensor_name"
  input: "save/restore_slice_8/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "Variable/Adam_1"
  input: "save/restore_slice_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_9/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_9/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_9"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_9/tensor_name"
  input: "save/restore_slice_9/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "Variable_1"
  input: "save/restore_slice_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_10/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable_1/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_10/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_10"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_10/tensor_name"
  input: "save/restore_slice_10/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "Variable_1/Adam"
  input: "save/restore_slice_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_11/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "Variable_1/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_11/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_11"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_11/tensor_name"
  input: "save/restore_slice_11/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "Variable_1/Adam_1"
  input: "save/restore_slice_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_12/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "beta1_power"
      }
    }
  }
}
node {
  name: "save/restore_slice_12/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_12"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_12/tensor_name"
  input: "save/restore_slice_12/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "beta1_power"
  input: "save/restore_slice_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_13/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/restore_slice_13/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_13"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_13/tensor_name"
  input: "save/restore_slice_13/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "beta2_power"
  input: "save/restore_slice_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_14/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_14/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_14"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_14/tensor_name"
  input: "save/restore_slice_14/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "conv_1/biases"
  input: "save/restore_slice_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_15/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_15/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_15"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_15/tensor_name"
  input: "save/restore_slice_15/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "conv_1/biases/Adam"
  input: "save/restore_slice_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_16/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_16/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_16"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_16/tensor_name"
  input: "save/restore_slice_16/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "conv_1/biases/Adam_1"
  input: "save/restore_slice_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_17/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_17/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_17"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_17/tensor_name"
  input: "save/restore_slice_17/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "conv_1/weights"
  input: "save/restore_slice_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_18/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_18/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_18"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_18/tensor_name"
  input: "save/restore_slice_18/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "conv_1/weights/Adam"
  input: "save/restore_slice_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_19/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_1/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_19/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_19"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_19/tensor_name"
  input: "save/restore_slice_19/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "conv_1/weights/Adam_1"
  input: "save/restore_slice_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_20/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_20/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_20"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_20/tensor_name"
  input: "save/restore_slice_20/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "conv_2/biases"
  input: "save/restore_slice_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_21/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_21/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_21"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_21/tensor_name"
  input: "save/restore_slice_21/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "conv_2/biases/Adam"
  input: "save/restore_slice_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_22/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_22/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_22"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_22/tensor_name"
  input: "save/restore_slice_22/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "conv_2/biases/Adam_1"
  input: "save/restore_slice_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_23/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_23/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_23"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_23/tensor_name"
  input: "save/restore_slice_23/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "conv_2/weights"
  input: "save/restore_slice_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_24/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_24/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_24"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_24/tensor_name"
  input: "save/restore_slice_24/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "conv_2/weights/Adam"
  input: "save/restore_slice_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_25/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_2/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_25/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_25"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_25/tensor_name"
  input: "save/restore_slice_25/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "conv_2/weights/Adam_1"
  input: "save/restore_slice_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_26/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_26/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_26"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_26/tensor_name"
  input: "save/restore_slice_26/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "conv_3/biases"
  input: "save/restore_slice_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_27/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_27/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_27"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_27/tensor_name"
  input: "save/restore_slice_27/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "conv_3/biases/Adam"
  input: "save/restore_slice_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_28/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_28/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_28"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_28/tensor_name"
  input: "save/restore_slice_28/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "conv_3/biases/Adam_1"
  input: "save/restore_slice_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_29/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_29/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_29"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_29/tensor_name"
  input: "save/restore_slice_29/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "conv_3/weights"
  input: "save/restore_slice_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_30/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_30/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_30"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_30/tensor_name"
  input: "save/restore_slice_30/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "conv_3/weights/Adam"
  input: "save/restore_slice_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_31/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_3/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_31/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_31"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_31/tensor_name"
  input: "save/restore_slice_31/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "conv_3/weights/Adam_1"
  input: "save/restore_slice_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_32/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_32/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_32"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_32/tensor_name"
  input: "save/restore_slice_32/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "conv_4/biases"
  input: "save/restore_slice_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_33/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_33/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_33"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_33/tensor_name"
  input: "save/restore_slice_33/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "conv_4/biases/Adam"
  input: "save/restore_slice_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_34/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_34/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_34"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_34/tensor_name"
  input: "save/restore_slice_34/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "conv_4/biases/Adam_1"
  input: "save/restore_slice_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_35/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_35/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_35"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_35/tensor_name"
  input: "save/restore_slice_35/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "conv_4/weights"
  input: "save/restore_slice_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_36/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_36/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_36"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_36/tensor_name"
  input: "save/restore_slice_36/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "conv_4/weights/Adam"
  input: "save/restore_slice_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_37/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "conv_4/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_37/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_37"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_37/tensor_name"
  input: "save/restore_slice_37/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "conv_4/weights/Adam_1"
  input: "save/restore_slice_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv_4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_38/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_38/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_38"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_38/tensor_name"
  input: "save/restore_slice_38/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "fc_1/biases"
  input: "save/restore_slice_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_39/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_39/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_39"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_39/tensor_name"
  input: "save/restore_slice_39/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "fc_1/biases/Adam"
  input: "save/restore_slice_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_40/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_40/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_40"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_40/tensor_name"
  input: "save/restore_slice_40/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "fc_1/biases/Adam_1"
  input: "save/restore_slice_40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_41/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_41/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_41"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_41/tensor_name"
  input: "save/restore_slice_41/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "fc_1/weights"
  input: "save/restore_slice_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_42/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_42/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_42"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_42/tensor_name"
  input: "save/restore_slice_42/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "fc_1/weights/Adam"
  input: "save/restore_slice_42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_43/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fc_1/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_43/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_43"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_43/tensor_name"
  input: "save/restore_slice_43/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "fc_1/weights/Adam_1"
  input: "save/restore_slice_43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fc_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_44/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/biases"
      }
    }
  }
}
node {
  name: "save/restore_slice_44/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_44"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_44/tensor_name"
  input: "save/restore_slice_44/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "fully_connected/biases"
  input: "save/restore_slice_44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_45/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/biases/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_45/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_45"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_45/tensor_name"
  input: "save/restore_slice_45/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "fully_connected/biases/Adam"
  input: "save/restore_slice_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_46/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/biases/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_46/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_46"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_46/tensor_name"
  input: "save/restore_slice_46/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "fully_connected/biases/Adam_1"
  input: "save/restore_slice_46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_47/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/weights"
      }
    }
  }
}
node {
  name: "save/restore_slice_47/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_47"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_47/tensor_name"
  input: "save/restore_slice_47/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "fully_connected/weights"
  input: "save/restore_slice_47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_48/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/weights/Adam"
      }
    }
  }
}
node {
  name: "save/restore_slice_48/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_48"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_48/tensor_name"
  input: "save/restore_slice_48/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "fully_connected/weights/Adam"
  input: "save/restore_slice_48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_slice_49/tensor_name"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "fully_connected/weights/Adam_1"
      }
    }
  }
}
node {
  name: "save/restore_slice_49/shape_and_slice"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/restore_slice_49"
  op: "RestoreSlice"
  input: "save/Const"
  input: "save/restore_slice_49/tensor_name"
  input: "save/restore_slice_49/shape_and_slice"
  attr {
    key: "dt"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "preferred_shard"
    value {
      i: -1
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "fully_connected/weights/Adam_1"
  input: "save/restore_slice_49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@fully_connected/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
}
versions {
  producer: 9
}
