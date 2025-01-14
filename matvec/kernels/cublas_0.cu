#include <cublas_v2.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>

#include "utils.cuh"

/*
CuBLAS matrix vector multiplication for the baseline scores.
We simply run the Sgemv function that cuBLAS provides.
*/
void run_kernel_cublas_sgemv(float* __restrict__ matd, float* __restrict__ vecd, float* __restrict__ resd, int M, int N) {
    cudaEvent_t start, stop;
    CUDA_CHECK(cudaEventCreate(&start));
    CUDA_CHECK(cudaEventCreate(&stop));
    float ms = 0.0f;

    // create cublas handle
    cublasHandle_t handle;
    cublasCreate(&handle);

    // Sgemv: y = (alpha * A * x) + (beta * y)
    float alpha = 1.0f, beta = 0.0f;
    cudaEventRecord(start);
    cublasSgemv(handle, CUBLAS_OP_N, M, N, &alpha, matd, M, vecd, 1, &beta, resd, 1);
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    cudaEventElapsedTime(&ms, start, stop);
    printf("------- cuBLAS sgmev kernel ---------\n");
    print_kernel_essentials(M, N, ms);
    printf("---------------------------\n");

    cublasDestroy(handle);
    CUDA_CHECK(cudaEventDestroy(start));
    CUDA_CHECK(cudaEventDestroy(stop));
}
