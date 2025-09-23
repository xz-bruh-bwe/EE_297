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
#pragma HLS PIPELINE II=10
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

                //if (oh == 0 && ow == 0 && c == 0) {
                    //printf("DEBUG DW: bias[%d] = %f\n", c, (float)dw_biases[c]);
                //}

                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oh + ky - 1; // PAD=1
                        int ix = ow + kx - 1;
                        if (iy >= 0 && iy < OUT_H && ix >= 0 && ix < OUT_W) {
                            data_t a = input[iy][ix][c];        // same channel
                            data_t b = dw_weights[ky][kx][0][c]; // depthwise
                            sum += a * b;

                            //if (oh == 0 && ow == 0 && c == 0) {
                                //data_t p = a * b;
                                //printf("DW DEBUG: a=%f * b=%f => p=%f | sum=%f\n",
                                       //(float)a, (float)b, (float)p, (float)sum);
                            //}
                        }
                    }
                }
                if (sum < 0) sum = 0;
                else if (sum > 6) sum = 6;  // ReLU6
                dw_out[oh][ow][c] = sum;

                //if (oh == 0 && ow == 0 && c == 0) {
                    //printf("DW DEBUG: output[%d][%d][%d] after ReLU6 = %f\n",
                           //oh, ow, c, (float)sum);
                //}
            }
        }
    }

    // Pointwise conv (1x1, across channels)
    for (int oh = 0; oh < OUT1_IR0_H; oh++) {
        for (int ow = 0; ow < OUT1_IR0_W; ow++) {
#pragma HLS PIPELINE II=10 // CPU user time: 48 seconds
            for (int oc = 0; oc < OUT1_IR0_C; oc++) {
                data_t sum = pw_biases[oc];

                //if (oh == 0 && ow == 0 && oc == 0) {
                    //printf("PW DEBUG: bias[%d] = %f\n", oc, (float)pw_biases[oc]);
                //}

                for (int ic = 0; ic < OUT_C; ic++) {
                    data_t a = dw_out[oh][ow][ic];
                    data_t b = pw_weights[0][0][ic][oc];
                    sum += a * b;

                    //if (oh == 0 && ow == 0 && oc == 0 && ic < 3) {
                        //data_t p = a * b;
                        //printf("PW DEBUG: ic=%d, a=%f, b=%f, p=%f, sum=%f\n",
                               //ic, (float)a, (float)b, (float)p, (float)sum);
                    //}
                }
                output[oh][ow][oc] = sum; // no ReLU6 here

                //if (oh == 0 && ow == 0 && oc == 0) {
                    //printf("PW DEBUG: output[%d][%d][%d] final = %f\n",
                           //oh, ow, oc, (float)sum);
                //}
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc2_ir1  (InvertedResidual1)
// Expansion 1x1 (16→96) + ReLU6
// Depthwise 3x3 stride=2 (groups=96) + ReLU6
// Projection 1x1 (96→24), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc2_ir1(
    data_t input[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],          // [112][112][16]
    data_t output[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],         // [56][56][24]
    data_t exp_weights[1][1][OUT1_IR0_C][OUT2_IR1_EXP_C],      // expansion: (1x1x16x96)
    data_t exp_biases[OUT2_IR1_EXP_C],                         // expansion biases (96)
    data_t dw_weights[3][3][1][OUT2_IR1_EXP_C],                // depthwise: (3x3x1x96)
    data_t dw_biases[OUT2_IR1_EXP_C],                          // depthwise biases (96)
    data_t pw_weights[1][1][OUT2_IR1_EXP_C][OUT2_IR1_C],       // projection: (1x1x96x24)
    data_t pw_biases[OUT2_IR1_C]                               // projection biases (24)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning (relaxed) ─────
	// Expansion weights/biases
	#pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
	#pragma HLS ARRAY_PARTITION variable=exp_biases block factor=1 dim=1

	// Depthwise weights/biases
	#pragma HLS ARRAY_PARTITION variable=dw_weights block factor=1 dim=1
	#pragma HLS ARRAY_PARTITION variable=dw_weights block factor=1 dim=2
	#pragma HLS ARRAY_PARTITION variable=dw_biases block factor=1 dim=1

	// Projection weights/biases
	#pragma HLS ARRAY_PARTITION variable=pw_weights block factor=1 dim=3
	#pragma HLS ARRAY_PARTITION variable=pw_biases block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT1_IR0_H][OUT1_IR0_W][OUT2_IR1_EXP_C];  // after expansion + ReLU6
    static data_t dw_out[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_EXP_C];   // after depthwise + ReLU6

    // ──────────────────────────────
    // Expansion conv 1x1 (16→96) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT1_IR0_H; y++) {
        for (int x = 0; x < OUT1_IR0_W; x++) {
        //#pragma HLS PIPELINE II=10
            for (int oc = 0; oc < OUT2_IR1_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT1_IR0_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                if (sum < 0) sum = 0;
                else if (sum > 6) sum = 6;  // ReLU6
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=2 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT2_IR1_H; oy++) {
        for (int ox = 0; ox < OUT2_IR1_W; ox++) {

            int iy0 = oy * 2;  // stride=2
            int ix0 = ox * 2;
            for (int c = 0; c < OUT2_IR1_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = iy0 + ky - 1;  // PAD=1
                        int ix = ix0 + kx - 1;
                        if (iy >= 0 && iy < OUT1_IR0_H && ix >= 0 && ix < OUT1_IR0_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                if (sum < 0) sum = 0;
                else if (sum > 6) sum = 6;  // ReLU6
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (96→24), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT2_IR1_H; y++) {
        for (int x = 0; x < OUT2_IR1_W; x++) {

            for (int oc = 0; oc < OUT2_IR1_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT2_IR1_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum;  // no ReLU6
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc3_ir2  (InvertedResidual3)
// Expansion 1x1 (24→144) + ReLU6
// Depthwise 3x3 stride=1 (groups=144) + ReLU6
// Projection 1x1 (144→24), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc3_ir2(
    data_t input[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],            // [56][56][24]
    data_t output[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],           // [56][56][24]

    data_t exp_weights[1][1][OUT2_IR1_C][OUT3_IR2_EXP_C],        // expansion: (1x1x24x144)
    data_t exp_biases[OUT3_IR2_EXP_C],                           // expansion biases (144)

    data_t dw_weights[3][3][1][OUT3_IR2_EXP_C],                  // depthwise: (3x3x1x144)
    data_t dw_biases[OUT3_IR2_EXP_C],                            // depthwise biases (144)

    data_t pw_weights[1][1][OUT3_IR2_EXP_C][OUT3_IR2_C],         // projection: (1x1x144x24)
    data_t pw_biases[OUT3_IR2_C]                                 // projection biases (24)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning (very relaxed for faster synthesis) ─────
    // Keep arrays mostly intact so HLS maps them to BRAM; minimal banking.
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_EXP_C]; // after expansion + ReLU6 (56x56x144)
    static data_t dw_out [OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_EXP_C]; // after depthwise + ReLU6 (56x56x144)

    // ──────────────────────────────
    // Expansion conv 1x1 (24→144) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT3_IR2_H; y++) {

        for (int x = 0; x < OUT3_IR2_W; x++) {
            // #pragma HLS PIPELINE off   // keep relaxed
            for (int oc = 0; oc < OUT3_IR2_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT2_IR1_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT3_IR2_H; oy++) {

        for (int ox = 0; ox < OUT3_IR2_W; ox++) {
            for (int c = 0; c < OUT3_IR2_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // PAD=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT3_IR2_H && ix >= 0 && ix < OUT3_IR2_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (144→24), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT3_IR2_H; y++) {

        for (int x = 0; x < OUT3_IR2_W; x++) {
            for (int oc = 0; oc < OUT3_IR2_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT3_IR2_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}


// ──────────────────────────────────────────────
// Function: enc4_ir3  (InvertedResidual4)
// Expansion 1x1 (24→144) + ReLU6
// Depthwise 3x3 stride=2 (groups=144) + ReLU6
// Projection 1x1 (144→32), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc4_ir3(
    data_t input[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],              // [56][56][24]
    data_t output[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],             // [28][28][32]

    data_t exp_weights[1][1][OUT3_IR2_C][OUT4_IR3_EXP_C],          // expansion: (1x1x24x144)
    data_t exp_biases[OUT4_IR3_EXP_C],                             // expansion biases (144)

    data_t dw_weights[3][3][1][OUT4_IR3_EXP_C],                    // depthwise: (3x3x1x144)
    data_t dw_biases[OUT4_IR3_EXP_C],                              // depthwise biases (144)

    data_t pw_weights[1][1][OUT4_IR3_EXP_C][OUT4_IR3_C],           // projection: (1x1x144x32)
    data_t pw_biases[OUT4_IR3_C]                                   // projection biases (32)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning (relaxed for BRAM) ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT3_IR2_H][OUT3_IR2_W][OUT4_IR3_EXP_C]; // after expansion + ReLU6 (56x56x144)
    static data_t dw_out [OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_EXP_C]; // after depthwise + ReLU6 (28x28x144)

    // ──────────────────────────────
    // Expansion conv 1x1 (24→144) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT3_IR2_H; y++) {
        for (int x = 0; x < OUT3_IR2_W; x++) {
            for (int oc = 0; oc < OUT4_IR3_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT3_IR2_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=2 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT4_IR3_H; oy++) {
        for (int ox = 0; ox < OUT4_IR3_W; ox++) {
            for (int c = 0; c < OUT4_IR3_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy * 2 + ky - 1;  // stride=2, pad=1
                        int ix = ox * 2 + kx - 1;
                        if (iy >= 0 && iy < OUT3_IR2_H && ix >= 0 && ix < OUT3_IR2_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (144→32), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT4_IR3_H; y++) {
        for (int x = 0; x < OUT4_IR3_W; x++) {
            for (int oc = 0; oc < OUT4_IR3_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT4_IR3_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}


// ──────────────────────────────────────────────
// Function: enc5_ir4  (InvertedResidual5)
// Expansion 1x1 (32→192) + ReLU6
// Depthwise 3x3 stride=1 (groups=192) + ReLU6
// Projection 1x1 (192→32), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc5_ir4(
    data_t input[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],              // [28][28][32]
    data_t output[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],             // [28][28][32]

    data_t exp_weights[1][1][OUT4_IR3_C][OUT5_IR4_EXP_C],          // expansion: (1x1x32x192)
    data_t exp_biases[OUT5_IR4_EXP_C],                             // expansion biases (192)

    data_t dw_weights[3][3][1][OUT5_IR4_EXP_C],                    // depthwise: (3x3x1x192)
    data_t dw_biases[OUT5_IR4_EXP_C],                              // depthwise biases (192)

    data_t pw_weights[1][1][OUT5_IR4_EXP_C][OUT5_IR4_C],           // projection: (1x1x192x32)
    data_t pw_biases[OUT5_IR4_C]                                   // projection biases (32)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning (relaxed for BRAM) ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT4_IR3_H][OUT4_IR3_W][OUT5_IR4_EXP_C]; // after expansion + ReLU6 (28x28x192)
    static data_t dw_out [OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_EXP_C]; // after depthwise + ReLU6 (28x28x192)

    // ──────────────────────────────
    // Expansion conv 1x1 (32→192) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT4_IR3_H; y++) {
        for (int x = 0; x < OUT4_IR3_W; x++) {
            for (int oc = 0; oc < OUT5_IR4_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT4_IR3_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT5_IR4_H; oy++) {
        for (int ox = 0; ox < OUT5_IR4_W; ox++) {
            for (int c = 0; c < OUT5_IR4_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // stride=1, pad=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT4_IR3_H && ix >= 0 && ix < OUT4_IR3_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (192→32), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT5_IR4_H; y++) {
        for (int x = 0; x < OUT5_IR4_W; x++) {
            for (int oc = 0; oc < OUT5_IR4_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT5_IR4_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}


// ──────────────────────────────────────────────
// Function: enc6_ir5  (InvertedResidual6)
// Expansion 1x1 (32→192) + ReLU6
// Depthwise 3x3 stride=1 (groups=192) + ReLU6
// Projection 1x1 (192→32), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc6_ir5(
    data_t input[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],              // [28][28][32]
    data_t output[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],             // [28][28][32]

    data_t exp_weights[1][1][OUT5_IR4_C][OUT6_IR5_EXP_C],          // expansion: (1x1x32x192)
    data_t exp_biases[OUT6_IR5_EXP_C],                             // expansion biases (192)

    data_t dw_weights[3][3][1][OUT6_IR5_EXP_C],                    // depthwise: (3x3x1x192)
    data_t dw_biases[OUT6_IR5_EXP_C],                              // depthwise biases (192)

    data_t pw_weights[1][1][OUT6_IR5_EXP_C][OUT6_IR5_C],           // projection: (1x1x192x32)
    data_t pw_biases[OUT6_IR5_C]                                   // projection biases (32)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning (relaxed for BRAM) ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT5_IR4_H][OUT5_IR4_W][OUT6_IR5_EXP_C]; // after expansion + ReLU6 (28x28x192)
    static data_t dw_out [OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_EXP_C]; // after depthwise + ReLU6 (28x28x192)

    // ──────────────────────────────
    // Expansion conv 1x1 (32→192) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT5_IR4_H; y++) {
        for (int x = 0; x < OUT5_IR4_W; x++) {
            for (int oc = 0; oc < OUT6_IR5_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT5_IR4_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT6_IR5_H; oy++) {
        for (int ox = 0; ox < OUT6_IR5_W; ox++) {
            for (int c = 0; c < OUT6_IR5_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // stride=1, pad=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT5_IR4_H && ix >= 0 && ix < OUT5_IR4_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (192→32), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT6_IR5_H; y++) {
        for (int x = 0; x < OUT6_IR5_W; x++) {
            for (int oc = 0; oc < OUT6_IR5_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT6_IR5_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc7_ir6  (InvertedResidual7)
// Expansion 1x1 (32→192) + ReLU6
// Depthwise 3x3 stride=2 (groups=192) + ReLU6
// Projection 1x1 (192→64), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc7_ir6(
    data_t input[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],       // [28][28][32]
    data_t output[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],      // [14][14][64]

    data_t exp_weights[1][1][OUT6_IR5_C][OUT7_IR6_EXP_C],   // (1x1x32x192)
    data_t exp_biases[OUT7_IR6_EXP_C],                      // (192)

    data_t dw_weights[3][3][1][OUT7_IR6_EXP_C],             // (3x3x1x192)
    data_t dw_biases[OUT7_IR6_EXP_C],                       // (192)

    data_t pw_weights[1][1][OUT7_IR6_EXP_C][OUT7_IR6_C],    // (1x1x192x64)
    data_t pw_biases[OUT7_IR6_C]                            // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT6_IR5_H][OUT6_IR5_W][OUT7_IR6_EXP_C];  // 28x28x192
    static data_t dw_out [OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_EXP_C];  // 14x14x192

    // ──────────────────────────────
    // Expansion conv 1x1 (32→192) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT6_IR5_H; y++) {
        for (int x = 0; x < OUT6_IR5_W; x++) {
            for (int oc = 0; oc < OUT7_IR6_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT6_IR5_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=2 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT7_IR6_H; oy++) {
        for (int ox = 0; ox < OUT7_IR6_W; ox++) {
            for (int c = 0; c < OUT7_IR6_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy*2 + ky - 1;  // stride=2, pad=1
                        int ix = ox*2 + kx - 1;
                        if (iy >= 0 && iy < OUT6_IR5_H && ix >= 0 && ix < OUT6_IR5_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (192→64), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT7_IR6_H; y++) {
        for (int x = 0; x < OUT7_IR6_W; x++) {
            for (int oc = 0; oc < OUT7_IR6_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT7_IR6_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc8_ir7  (InvertedResidual8)
// Expansion 1x1 (64→384) + ReLU6
// Depthwise 3x3 stride=1 (groups=384) + ReLU6
// Projection 1x1 (384→64), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc8_ir7(
    data_t input[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],       // [14][14][64]
    data_t output[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],      // [14][14][64]

    data_t exp_weights[1][1][OUT7_IR6_C][OUT8_IR7_EXP_C],   // (1x1x64x384)
    data_t exp_biases[OUT8_IR7_EXP_C],                      // (384)

    data_t dw_weights[3][3][1][OUT8_IR7_EXP_C],             // (3x3x1x384)
    data_t dw_biases[OUT8_IR7_EXP_C],                       // (384)

    data_t pw_weights[1][1][OUT8_IR7_EXP_C][OUT8_IR7_C],    // (1x1x384x64)
    data_t pw_biases[OUT8_IR7_C]                            // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_EXP_C];  // 14x14x384
    static data_t dw_out [OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_EXP_C];  // 14x14x384

    // ──────────────────────────────
    // Expansion conv 1x1 (64→384) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT7_IR6_H; y++) {
        for (int x = 0; x < OUT7_IR6_W; x++) {
            for (int oc = 0; oc < OUT8_IR7_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT7_IR6_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT8_IR7_H; oy++) {
        for (int ox = 0; ox < OUT8_IR7_W; ox++) {
            for (int c = 0; c < OUT8_IR7_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // stride=1, pad=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT8_IR7_H && ix >= 0 && ix < OUT8_IR7_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (384→64), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT8_IR7_H; y++) {
        for (int x = 0; x < OUT8_IR7_W; x++) {
            for (int oc = 0; oc < OUT8_IR7_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT8_IR7_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc9_ir8  (InvertedResidual9)
// Expansion 1x1 (64→384) + ReLU6
// Depthwise 3x3 stride=1 (groups=384) + ReLU6
// Projection 1x1 (384→64), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc9_ir8(
    data_t input[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],       // [14][14][64]
    data_t output[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],      // [14][14][64]

    data_t exp_weights[1][1][OUT8_IR7_C][OUT9_IR8_EXP_C],   // (1x1x64x384)
    data_t exp_biases[OUT9_IR8_EXP_C],                      // (384)

    data_t dw_weights[3][3][1][OUT9_IR8_EXP_C],             // (3x3x1x384)
    data_t dw_biases[OUT9_IR8_EXP_C],                       // (384)

    data_t pw_weights[1][1][OUT9_IR8_EXP_C][OUT9_IR8_C],    // (1x1x384x64)
    data_t pw_biases[OUT9_IR8_C]                            // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_EXP_C];  // 14x14x384
    static data_t dw_out [OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_EXP_C];  // 14x14x384

    // ──────────────────────────────
    // Expansion conv 1x1 (64→384) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT8_IR7_H; y++) {
        for (int x = 0; x < OUT8_IR7_W; x++) {
            for (int oc = 0; oc < OUT9_IR8_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT8_IR7_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT9_IR8_H; oy++) {
        for (int ox = 0; ox < OUT9_IR8_W; ox++) {
            for (int c = 0; c < OUT9_IR8_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // stride=1, pad=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT9_IR8_H && ix >= 0 && ix < OUT9_IR8_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (384→64), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT9_IR8_H; y++) {
        for (int x = 0; x < OUT9_IR8_W; x++) {
            for (int oc = 0; oc < OUT9_IR8_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT9_IR8_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum; // no ReLU6
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: enc10_ir9  (InvertedResidual10)
// Expansion 1x1 (64→384) + ReLU6
// Depthwise 3x3 stride=1 (groups=384) + ReLU6
// Projection 1x1 (384→64), no activation
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void enc10_ir9(
    data_t input[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],       // [14][14][64]
    data_t output[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C],   // [14][14][64]

    data_t exp_weights[1][1][OUT9_IR8_C][OUT10_IR9_EXP_C],  // (1x1x64x384)
    data_t exp_biases[OUT10_IR9_EXP_C],                     // (384)

    data_t dw_weights[3][3][1][OUT10_IR9_EXP_C],            // (3x3x1x384)
    data_t dw_biases[OUT10_IR9_EXP_C],                      // (384)

    data_t pw_weights[1][1][OUT10_IR9_EXP_C][OUT10_IR9_C],  // (1x1x384x64)
    data_t pw_biases[OUT10_IR9_C]                           // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=exp_weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=exp_biases  block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=dw_weights  block factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=dw_biases   block factor=1 dim=1

    #pragma HLS ARRAY_PARTITION variable=pw_weights  block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=pw_biases   block factor=1 dim=1

    // ───── Local buffers ─────
    static data_t exp_out[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_EXP_C];  // 14x14x384
    static data_t dw_out [OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_EXP_C];  // 14x14x384

    // ──────────────────────────────
    // Expansion conv 1x1 (64→384) + ReLU6
    // ──────────────────────────────
    for (int y = 0; y < OUT9_IR8_H; y++) {
        for (int x = 0; x < OUT9_IR8_W; x++) {
            for (int oc = 0; oc < OUT10_IR9_EXP_C; oc++) {
                data_t sum = exp_biases[oc];
                for (int ic = 0; ic < OUT9_IR8_C; ic++) {
                    sum += input[y][x][ic] * exp_weights[0][0][ic][oc];
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                exp_out[y][x][oc] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Depthwise conv 3x3 stride=1 + ReLU6
    // ──────────────────────────────
    for (int oy = 0; oy < OUT10_IR9_H; oy++) {
        for (int ox = 0; ox < OUT10_IR9_W; ox++) {
            for (int c = 0; c < OUT10_IR9_EXP_C; c++) {
                data_t sum = dw_biases[c];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = oy + ky - 1;  // stride=1, pad=1
                        int ix = ox + kx - 1;
                        if (iy >= 0 && iy < OUT10_IR9_H && ix >= 0 && ix < OUT10_IR9_W) {
                            sum += exp_out[iy][ix][c] * dw_weights[ky][kx][0][c];
                        }
                    }
                }
                // ReLU6
                if (sum < 0) sum = 0;
                else if (sum > (data_t)6) sum = (data_t)6;
                dw_out[oy][ox][c] = sum;
            }
        }
    }

    // ──────────────────────────────
    // Projection conv 1x1 (384→64), no activation
    // ──────────────────────────────
    for (int y = 0; y < OUT10_IR9_H; y++) {
        for (int x = 0; x < OUT10_IR9_W; x++) {
            for (int oc = 0; oc < OUT10_IR9_C; oc++) {
                data_t sum = pw_biases[oc];
                for (int ic = 0; ic < OUT10_IR9_EXP_C; ic++) {
                    sum += dw_out[y][x][ic] * pw_weights[0][0][ic][oc];
                }
                output[y][x][oc] = sum;  // no ReLU6
            }
        }
    }
}







