# Tensorflow examples

https://github.com/aymericdamien/TensorFlow-Examples


## Getting started
```sh
virtualenv .venv && source .venv/bin/activate
pip install tensorflow

# To use tensorboard, add the following to the code:
# file_writer = tf.summary.FileWriter('/tmp', sess.graph)

# Then launch tensorboard
tensorboard --log-dir /tmp

python hello.py
```


## Definitions

While Tensor in the context of math/physics has a more elaborate definition and requirements, in the context of Tensorflow it's really just a multi-dimensional array.

From [http://mathworld.wolfram.com/Tensor.html]():
Tensors are generalizations of scalars (that have no indices), vectors (that have exactly one index), and matrices (that have exactly two indices) to an arbitrary number of indices.

