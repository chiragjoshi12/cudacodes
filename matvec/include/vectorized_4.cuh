#ifndef VECTORIZED_SGEMV
#define VECTORIZED_SGEMV

__global__ void vectorized_sgemv_kernel(float* __restrict__ matd, float* __restrict__ vecd, float* __restrict__ resd, int M, int N);

float run_kernel_vectorized_sgmev(float* __restrict__ matd, float* __restrict__ vecd, float* __restrict__ resd, int M, int N, float THEORETICAL_MAX_GFLOPS, float THEORETICAL_MAX_MEMORY_BANDWIDTH);

#endif  // VECTORIZED_SGEMV
