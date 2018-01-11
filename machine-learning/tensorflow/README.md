# Tensorflow examples

https://github.com/aymericdamien/TensorFlow-Examples


```
virtualenv .venv && source .venv/bin/activate
pip install tensorflow

# To use tensorboard, add the following to the code:
# file_writer = tf.summary.FileWriter('/tmp', sess.graph)

# Then launch tensorboard
tensorboard --log-dir /tmp
```
