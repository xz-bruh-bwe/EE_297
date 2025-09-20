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
    float input[IMG_HEIGHT][IMG_WIDTH][IN_CH],
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
    float padded[IMG_HEIGHT + 2 * PAD][IMG_WIDTH + 2 * PAD][IN_CH] = {0};

    // â”€â”€â”€â”€â”€ Padding â”€â”€â”€â”€â”€
    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            for (int c = 0; c < IN_CH; c++) {
                padded[y + PAD][x + PAD][c] = input[y][x][c];
                //printf("TESTBENCH DEBUG: padded[0][0][0] = %f\n", (float)padded[y][x][c]);
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
                data_t sum = biases[oc]; // <- Adds the bias first instead of the


                for (int ky = 0; ky < K; ky++) {
                    for (int kx = 0; kx < K; kx++) {
                        for (int ic = 0; ic < IN_CH; ic++) {
                        	data_t a = (data_t)padded[iy + ky][ix + kx][ic];
                        	data_t b = weights[ky][kx][ic][oc];
                        	data_t p = a * b;
                        	sum += p;
                        	//printf("DEBUG: a=%f * b=%f => %f | sum=%f\n",
                        			//(float)a, (float)b, (float)p, (float)sum); // <- Represents the data_t at instance BACK to float.
                        	//sum += (data_t)padded[iy + ky][ix + kx][ic] * weights[ky][kx][ic][oc];

                        }
                    }
                }

                // Inline ReLU6 Activation
                if (sum < 0)
                    sum = 0;
                else if (sum > 6)
                    sum = 6;

                output[oh][ow][oc] = sum;
               // printf("DEBUG: output[%d][%d][%d] = %f\n", oh, ow, oc, (float)sum); // <- Represents the data_t at instance BACK to float.

            }
        }
    }
}


// ──────────────────────────────────────────────
// Function: encoder1_ir  (enc0_ir0)
// Depthwise 3x3 (groups=32) + ReLU6
// followed by Pointwise 1x1 (32→16)
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc1_ir0(
    data_t input[OUT_H][OUT_W][OUT_C],                     // [112][112][32]
    data_t output[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],     // [112][112][16]
    data_t dw_weights[3][3][1][OUT_C],                 // depthwise: (3x3x32x32)
    data_t dw_biases[OUT_C],                               // depthwise biases
    data_t pw_weights[1][1][OUT_C][OUT1_IR0_C],            // pointwise: (1x1x32x16)
    data_t pw_biases[OUT1_IR0_C]                           // pointwise biases
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
	// Depthwise weights
	#pragma HLS ARRAY_PARTITION variable=dw_weights cyclic factor=3 dim=1
	#pragma HLS ARRAY_PARTITION variable=dw_weights cyclic factor=3 dim=2
	// leave dim=3 (channels) unpartitioned for now
	#pragma HLS ARRAY_PARTITION variable=dw_biases complete dim=1

	// Pointwise weights
	// For 1x1 kernel, no need to partition dims 1 and 2 at all
	//#pragma HLS ARRAY_PARTITION variable=pw_weights complete dim=1
	//#pragma HLS ARRAY_PARTITION variable=pw_weights complete dim=2
	#pragma HLS ARRAY_PARTITION variable=pw_weights cyclic factor=16 dim=3
	#pragma HLS ARRAY_PARTITION variable=pw_biases complete dim=1


    // ───── Local buffer for depthwise output ─────
    static data_t dw_out[OUT_H][OUT_W][OUT_C];

    // Depthwise conv (stride=1, padding=1)
    for (int oh = 0; oh < OUT_H; oh++) {
        for (int ow = 0; ow < OUT_W; ow++) {
#pragma HLS PIPELINE II=10 // // CPU user time: 48 seconds
            for (int c = 0; c < OUT_C; c++) {
                data_t sum = dw_biases[c];
                if (oh == 0 && ow == 0 && c == 0) {
                    printf("DEBUG DW: bias[%d] = %f\n", c, (float)dw_biases[c]);
                }
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oh + ky - 1; // PAD=1
                        int ix = ow + kx - 1;
                        if (iy >= 0 && iy < OUT_H && ix >= 0 && ix < OUT_W) {
                            data_t a = input[iy][ix][c];        // same channel
                            data_t b = dw_weights[ky][kx][0][c]; // depthwise
                            sum += a * b;
                            if (oh == 0 && ow == 0 && c == 0) {
                                data_t p = a * b;
                                printf("DW DEBUG: a=%f * b=%f => p=%f | sum=%f\n",
                                       (float)a, (float)b, (float)p, (float)sum);
                            }
                        }
                    }
                }
                if (sum < 0) sum = 0;
                else if (sum > 6) sum = 6;  // ReLU6
                dw_out[oh][ow][c] = sum;
                if (oh == 0 && ow == 0 && c == 0) {
                    printf("DW DEBUG: output[%d][%d][%d] after ReLU6 = %f\n",
                           oh, ow, c, (float)sum);
                }
            }
        }
    }

    // Pointwise conv (1x1, across channels)
    for (int oh = 0; oh < OUT1_IR0_H; oh++) {
        for (int ow = 0; ow < OUT1_IR0_W; ow++) {
#pragma HLS PIPELINE II=10 // CPU user time: 48 seconds
            for (int oc = 0; oc < OUT1_IR0_C; oc++) {
                data_t sum = pw_biases[oc];

                if (oh == 0 && ow == 0 && oc == 0) {
                    printf("PW DEBUG: bias[%d] = %f\n", oc, (float)pw_biases[oc]);
                }

                for (int ic = 0; ic < OUT_C; ic++) {
                    data_t a = dw_out[oh][ow][ic];
                    data_t b = pw_weights[0][0][ic][oc];
                    sum += a * b;
                    if (oh == 0 && ow == 0 && oc == 0 && ic < 3) {
                        data_t p = a * b;
                        printf("PW DEBUG: ic=%d, a=%f, b=%f, p=%f, sum=%f\n",
                               ic, (float)a, (float)b, (float)p, (float)sum);
                    }
                }
                output[oh][ow][oc] = sum; // no ReLU6 here
                if (oh == 0 && ow == 0 && oc == 0) {
                    printf("PW DEBUG: output[%d][%d][%d] final = %f\n",
                           oh, ow, oc, (float)sum);
                }
            }
        }
    }
}
