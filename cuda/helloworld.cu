// This code is from this tutorial:
// https://devblogs.nvidia.com/parallelforall/easy-introduction-cuda-c-and-c/
// This is a so-called SAXPY example. SAXPY stands for "Single-precision A*X Plus Y", and is a good hello world example
// for parallel computation.

#include <stdio.h>

// Functions starting wit __global__ are "device" functions, or "kernels" that run on the GPU.
// (sometimes they're also referred to as (compute) shaders as a reference to graphics shaders, the name of these
// kernels when used for in a graphics context).
// GPU have a large number of cores (sometimes several thousands) that run these kernels in parallel.
// The cores are are grouped in blocks of dimensions NxN.
// This particular kernel will do a single element multiplication in a vector multiplication. The GPU will invoke
// this kernel in every thread, and will automatically replace the magic variables blockIdx, blockDim and threadIdx
// with the corresponding block number, dimensions and thread ID (within the block). This way, you can figure out
// what part of the calculation to do within a certain kernel instantiation.
__global__ void saxpy(int n, float a, float *x, float *y)
{
  // Determine which calculation to perform in this particular thread
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  if (i < n)
    y[i] = a * x[i] + y[i];
}

// Normal functions are referred to as "host" functions/code and run on the CPU as usual
int main(void)
{
  // Allocate 2 vectors, x and y with 1 million floats (=single precision) each
  int N = 1 << 20;          // 2^20 ~= 1 million
  float *x, *y, *d_x, *d_y; // d_x -> "device x", d_y -> "device y"
  x = (float *)malloc(N * sizeof(float));
  y = (float *)malloc(N * sizeof(float));

  // Allocate the memory on the GPUs
  cudaMalloc(&d_x, N * sizeof(float));
  cudaMalloc(&d_y, N * sizeof(float));

  // set all values in x to 1, all values in y to 2
  for (int i = 0; i < N; i++)
  {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  // copy the values from the host to the GPU
  cudaMemcpy(d_x, x, N * sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(d_y, y, N * sizeof(float), cudaMemcpyHostToDevice);

  // Perform SAXPY on 1M elements
  // Note that triple angular brackets, that's specific to CUDA
  saxpy<<<(N + 255) / 256, 256>>>(N, 2.0f, d_x, d_y);

  // We stored the result in Y on the device, copy it back to the host
  cudaMemcpy(y, d_y, N * sizeof(float), cudaMemcpyDeviceToHost);

  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = max(maxError, abs(y[i] - 4.0f));
  printf("Max error: %f\n", maxError);

  // clean up :)
  cudaFree(d_x);
  cudaFree(d_y);
  free(x);
  free(y);
}