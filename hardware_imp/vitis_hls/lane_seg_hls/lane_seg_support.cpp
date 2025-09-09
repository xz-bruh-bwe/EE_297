#include <cstdio> // Required for printf

// ──────────────────────────────────────────────
// Project Headers
#include "lane_seg_top.h"
#include "ap_fixed.h"


// Function: encoder0_c1
// Description: Performs convolution + ReLU6 with padding
// Inputs:
//   - input:   input feature map [IMG_HEIGHT][IMG_WIDTH][IN_CH]
//   - weights: convolution weights [K][K][IN_CH][OUT_CH]
//   - biases:  convolution biases [OUT_CH]
// Output:
//   - output:  output feature map [OUT_H][OUT_W][OUT_CH]
void encoder0_c1(
    data_t input[IMG_HEIGHT][IMG_WIDTH][IN_CH],
    data_t output[OUT_H][OUT_W][OUT_CH],
    data_t weights[K][K][IN_CH][OUT_CH],
    data_t biases[OUT_CH]
) {
#pragma HLS INLINE off

    // â”€â”€â”€â”€â”€ HLS Array Partitioning â”€â”€â”€â”€â”€
    #pragma HLS ARRAY_PARTITION variable=weights complete dim=1
    #pragma HLS ARRAY_PARTITION variable=weights complete dim=2
    #pragma HLS ARRAY_PARTITION variable=weights complete dim=3
    #pragma HLS ARRAY_PARTITION variable=biases complete dim=1

    // â”€â”€â”€â”€â”€ Local Padded Buffer â”€â”€â”€â”€â”€
    data_t padded[IMG_HEIGHT + 2 * PAD][IMG_WIDTH + 2 * PAD][IN_CH] = {0};

    // â”€â”€â”€â”€â”€ Padding â”€â”€â”€â”€â”€
    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            for (int c = 0; c < IN_CH; c++) {
                padded[y + PAD][x + PAD][c] = input[y][x][c];
            }
        }
    }

    // Print first few weights and biases
        printf("DEBUG: bias[0] = %f\n", (float)biases[0]);
        printf("DEBUG: weights[0][0][0][0] = %f\n", (float)weights[0][0][0][0]);

    //  Convolution + ReLU6
    for (int oh = 0; oh < OUT_H; oh++) {
        for (int ow = 0; ow < OUT_W; ow++) {
#pragma HLS PIPELINE II=1
            int iy = oh * STRIDE;
            int ix = ow * STRIDE;

            for (int oc = 0; oc < OUT_CH; oc++) {
                data_t sum = biases[oc];
               printf("DEBUG: sum init at [%d][%d][%d] = %f\n", oh, ow, oc, (float)sum);

                for (int ky = 0; ky < K; ky++) {
                    for (int kx = 0; kx < K; kx++) {
                        for (int ic = 0; ic < IN_CH; ic++) {
                        	data_t a = padded[iy + ky][ix + kx][ic];
                        	data_t b = weights[ky][kx][ic][oc];
                        	data_t p = a * b;
                        	sum += p;
                        	printf("DEBUG: a=%f * b=%f => %f | sum=%f\n",
                        			(float)a, (float)b, (float)p, (float)sum);
                        	//sum += padded[iy + ky][ix + kx][ic] * weights[ky][kx][ic][oc];

                        }
                    }
                }

                // Inline ReLU6 Activation
                if (sum < 0)
                    sum = 0;
                else if (sum > 6)
                    sum = 6;

                output[oh][ow][oc] = sum;
                printf("DEBUG: output[%d][%d][%d] = %f\n", oh, ow, oc, (float)sum);
            }
        }
    }
}

