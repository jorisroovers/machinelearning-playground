# Simple CUDA Hello World

Following this tutorial.
https://devblogs.nvidia.com/parallelforall/easy-introduction-cuda-c-and-c/


On AWS, boot a g2.2xlarge instance with the "NVIDIA CUDA 7.5 Toolkit on Amazon Linux" image (or later).

Then, ssh into the VM, copy over helloworld.cu and do:
```
$ /usr/local/cuda-7.5/bin/nvcc -o saxpy helloworld.cu
$ ./saxpy
Max error: 0.000000
```