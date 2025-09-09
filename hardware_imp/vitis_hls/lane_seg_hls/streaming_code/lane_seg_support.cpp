#include "lane_seg_top.h"
#include "ap_fixed.h"

// === Include compiled-in weights/BN (same approach as your LeNet build) ===
// Replace paths with your own generated headers



void encoder0_c1(
    data_t input  [IMG_HEIGHT][IMG_WIDTH][IN_CH],
    data_t output [OUT_H][OUT_W][OUT_CH],
    data_t encoder0_c1_weights[K*K*IN_C*OUT_C],
    data_t encoder0_c1_biases [OUT_C]
) {
#pragma HLS INLINE off

		// ─── Local unflattened weights ─── We are structuring the 1d array back into a 4D array
	    data_t local_weights[K][K][IN_C][OUT_C];

    // â”€â”€â”€ Basic Partitioning for Parallel Access â”€â”€â”€
#pragma HLS ARRAY_PARTITION variable=local_weights complete dim=1
#pragma HLS ARRAY_PARTITION variable=local_weights complete dim=2
#pragma HLS ARRAY_PARTITION variable=local_weights complete dim=3

	    // ─── Local copy of biases ───
	        data_t local_biases[OUT_C];
#pragma HLS ARRAY_PARTITION variable=local_biases complete dim=1

	        // ─── Unflatten weights ───
	        int idx = 0;
	        for (int ky = 0; ky < K; ky++) {
	            for (int kx = 0; kx < K; kx++) {
	                for (int ic = 0; ic < IN_C; ic++) {
	                    for (int oc = 0; oc < OUT_C; oc++) {
	    #pragma HLS PIPELINE
	                        local_weights[ky][kx][ic][oc] = encoder0_c1_weights[idx++];
	                    }
	                }
	            }
	        }

	        // ─── Copy biases ───
	        for (int oc = 0; oc < OUT_C; oc++) {
	    #pragma HLS PIPELINE
	            local_biases[oc] = encoder0_c1_biases[oc];
	        }

	        // ─── Local padded input ───
	        static data_t padded[IN_H + 2*PAD][IN_W + 2*PAD][IN_C] = {0};

	        for (int y = 0; y < IN_H; y++) {
	            for (int x = 0; x < IN_W; x++) {
	                for (int c = 0; c < IN_C; c++) {
	                    padded[y + PAD][x + PAD][c] = input[y][x][c];
	                }
	            }
	        }

	        // ─── Convolution ───
	        for (int oh = 0; oh < OUT_H; oh++) {
	            for (int ow = 0; ow < OUT_W; ow++) {
	    #pragma HLS PIPELINE II=1
	                int iy = oh * STRIDE;
	                int ix = ow * STRIDE;

	                for (int oc = 0; oc < OUT_C; oc++) {
	                    data_t sum = local_biases[oc];

	                    for (int ky = 0; ky < K; ky++) {
	                        for (int kx = 0; kx < K; kx++) {
	                            for (int ic = 0; ic < IN_C; ic++) {
	                                sum += padded[iy + ky][ix + kx][ic] * local_weights[ky][kx][ic][oc];
	                            }
	                        }
	                    }

	                    // ReLU6
	                    if (sum < 0) sum = 0;
	                    else if (sum > 6) sum = 6;

	                    output[oh][ow][oc] = sum;
	                }
	            }
	        }
	    }
