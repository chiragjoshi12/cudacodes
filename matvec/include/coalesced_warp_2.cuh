#ifndef COALWARP_SGEMV
#define COALWARP_SGEMV

__global__ void coalesced_warp_sgmev_kernel(float* __restrict__ matd, float* __restrict__ vecd, float* __restrict__ resd, int M, int N);

void run_kernel_coalesced_warp_sgmev(float* __restrict__ matd, float* __restrict__ vecd, float* __restrict__ resd, int M, int N);

#endif  // COALWARP_SGEMV
