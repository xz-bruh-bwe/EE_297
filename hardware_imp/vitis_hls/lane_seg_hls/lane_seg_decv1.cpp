#include <cstdio> // Required for printf


// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// Project Headers
#include "lane_seg_top.h"
#include "ap_fixed.h"

//â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//Function: dec0  (Decoder Stage 0)
//ConvTranspose2d 2x2 stride=2 (1280â†’256) + ReLU
//BN already folded into weights/biases
//â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
void dec0(
    data_t input[OUT18_CNV_H][OUT18_CNV_W][OUT18_CNV_C],          // [7][7][1280]
    data_t output[OUT19_DEC0_H][OUT19_DEC0_W][OUT19_DEC0_C],      // [14][14][256]

    data_t weights[2][2][OUT18_CNV_C][OUT19_DEC0_C],              // (2x2x1280x256)
    data_t biases[OUT19_DEC0_C]                                   // (256)
) {
#pragma HLS INLINE off

    // â”€â”€â”€â”€â”€ Array Partitioning â”€â”€â”€â”€â”€
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    // Initialize output with biases
    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    // ConvTranspose2d (2x2 stride=2)
    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    for (int iy = 0; iy < OUT18_CNV_H; iy++) {
        for (int ix = 0; ix < OUT18_CNV_W; ix++) {
            for (int ic = 0; ic < OUT18_CNV_C; ic++) {
                for (int ky = 0; ky < 2; ky++) {
                    for (int kx = 0; kx < 2; kx++) {
                        int oy = iy * 2 + ky;
                        int ox = ix * 2 + kx;
                        if (oy < OUT19_DEC0_H && ox < OUT19_DEC0_W) {
                            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
                                output[oy][ox][oc] += input[iy][ix][ic] * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    // Apply ReLU
    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
                data_t val = output[oy][ox][oc];
                if (val < (data_t)0) val = (data_t)0; // ReLU
                output[oy][ox][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec1  (Decoder Stage 1)
// Conv2d 3x3 stride=1 pad=1 (256→256) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec1(
    data_t input[OUT19_DEC0_H][OUT19_DEC0_W][OUT19_DEC0_C],        // [14][14][256]
    data_t output[OUT20_DEC1_H][OUT20_DEC1_W][OUT20_DEC1_C],       // [14][14][256]

    data_t weights[3][3][OUT19_DEC0_C][OUT20_DEC1_C],              // (3x3x256x256)
    data_t biases[OUT20_DEC1_C]                                    // (256)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int y = 0; y < OUT20_DEC1_H; y++) {
        for (int x = 0; x < OUT20_DEC1_W; x++) {
            for (int oc = 0; oc < OUT20_DEC1_C; oc++) {
                output[y][x][oc] = biases[oc];
            }
        }
    }

    // ───── Conv2d (3x3 stride=1 pad=1) ─────
    for (int y = 0; y < OUT20_DEC1_H; y++) {
        for (int x = 0; x < OUT20_DEC1_W; x++) {
            for (int ic = 0; ic < OUT19_DEC0_C; ic++) {
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = y + ky - 1; // padding=1
                        int ix = x + kx - 1;
                        if (iy >= 0 && iy < OUT19_DEC0_H && ix >= 0 && ix < OUT19_DEC0_W) {
                            for (int oc = 0; oc < OUT20_DEC1_C; oc++) {
                                output[y][x][oc] += input[iy][ix][ic] * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int y = 0; y < OUT20_DEC1_H; y++) {
        for (int x = 0; x < OUT20_DEC1_W; x++) {
            for (int oc = 0; oc < OUT20_DEC1_C; oc++) {
                data_t val = output[y][x][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[y][x][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec2  (Decoder Stage 2)
// ConvTranspose2d 2x2 stride=2 (256→128) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec2(
    data_t input[OUT20_DEC1_H][OUT20_DEC1_W][OUT20_DEC1_C],        // [14][14][256]
    data_t output[OUT21_DEC2_H][OUT21_DEC2_W][OUT21_DEC2_C],       // [28][28][128]

    data_t weights[2][2][OUT20_DEC1_C][OUT21_DEC2_C],              // (2x2x256x128)
    data_t biases[OUT21_DEC2_C]                                    // (128)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int oy = 0; oy < OUT21_DEC2_H; oy++) {
        for (int ox = 0; ox < OUT21_DEC2_W; ox++) {
            for (int oc = 0; oc < OUT21_DEC2_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // ───── ConvTranspose2d (2x2 stride=2) ─────
    for (int iy = 0; iy < OUT20_DEC1_H; iy++) {
        for (int ix = 0; ix < OUT20_DEC1_W; ix++) {
            for (int ic = 0; ic < OUT20_DEC1_C; ic++) {
                data_t vin = input[iy][ix][ic];
                for (int ky = 0; ky < 2; ky++) {
                    for (int kx = 0; kx < 2; kx++) {
                        int oy = iy * 2 + ky;
                        int ox = ix * 2 + kx;
                        if (oy < OUT21_DEC2_H && ox < OUT21_DEC2_W) {
                            for (int oc = 0; oc < OUT21_DEC2_C; oc++) {
                                output[oy][ox][oc] += vin * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int oy = 0; oy < OUT21_DEC2_H; oy++) {
        for (int ox = 0; ox < OUT21_DEC2_W; ox++) {
            for (int oc = 0; oc < OUT21_DEC2_C; oc++) {
                data_t val = output[oy][ox][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[oy][ox][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec3  (Decoder Stage 3)
// Conv2d 3x3 stride=1 pad=1 (128→128) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec3(
    data_t input[OUT21_DEC2_H][OUT21_DEC2_W][OUT21_DEC2_C],        // [28][28][128]
    data_t output[OUT22_DEC3_H][OUT22_DEC3_W][OUT22_DEC3_C],       // [28][28][128]

    data_t weights[3][3][OUT21_DEC2_C][OUT22_DEC3_C],              // (3x3x128x128)
    data_t biases[OUT22_DEC3_C]                                    // (128)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int y = 0; y < OUT22_DEC3_H; y++) {
        for (int x = 0; x < OUT22_DEC3_W; x++) {
            for (int oc = 0; oc < OUT22_DEC3_C; oc++) {
                output[y][x][oc] = biases[oc];
            }
        }
    }

    // ───── Conv2d (3x3 stride=1 pad=1) ─────
    for (int y = 0; y < OUT22_DEC3_H; y++) {
        for (int x = 0; x < OUT22_DEC3_W; x++) {
            for (int ic = 0; ic < OUT21_DEC2_C; ic++) {
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = y + ky - 1;  // padding = 1
                        int ix = x + kx - 1;
                        if (iy >= 0 && iy < OUT21_DEC2_H && ix >= 0 && ix < OUT21_DEC2_W) {
                            for (int oc = 0; oc < OUT22_DEC3_C; oc++) {
                                output[y][x][oc] += input[iy][ix][ic] * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int y = 0; y < OUT22_DEC3_H; y++) {
        for (int x = 0; x < OUT22_DEC3_W; x++) {
            for (int oc = 0; oc < OUT22_DEC3_C; oc++) {
                data_t val = output[y][x][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[y][x][oc] = val;
            }
        }
    }
}


// ──────────────────────────────────────────────
// Function: dec4  (Decoder Stage 4)
// ConvTranspose2d 2x2 stride=2 (128→64) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec4(
    data_t input[OUT22_DEC3_H][OUT22_DEC3_W][OUT22_DEC3_C],        // [28][28][128]
    data_t output[OUT23_DEC4_H][OUT23_DEC4_W][OUT23_DEC4_C],       // [56][56][64]

    data_t weights[2][2][OUT22_DEC3_C][OUT23_DEC4_C],              // (2x2x128x64)
    data_t biases[OUT23_DEC4_C]                                    // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int oy = 0; oy < OUT23_DEC4_H; oy++) {
        for (int ox = 0; ox < OUT23_DEC4_W; ox++) {
            for (int oc = 0; oc < OUT23_DEC4_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // ───── ConvTranspose2d (2x2 stride=2) ─────
    for (int iy = 0; iy < OUT22_DEC3_H; iy++) {
        for (int ix = 0; ix < OUT22_DEC3_W; ix++) {
            for (int ic = 0; ic < OUT22_DEC3_C; ic++) {
                data_t vin = input[iy][ix][ic];
                for (int ky = 0; ky < 2; ky++) {
                    for (int kx = 0; kx < 2; kx++) {
                        int oy = iy * 2 + ky;
                        int ox = ix * 2 + kx;
                        if (oy < OUT23_DEC4_H && ox < OUT23_DEC4_W) {
                            for (int oc = 0; oc < OUT23_DEC4_C; oc++) {
                                output[oy][ox][oc] += vin * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int oy = 0; oy < OUT23_DEC4_H; oy++) {
        for (int ox = 0; ox < OUT23_DEC4_W; ox++) {
            for (int oc = 0; oc < OUT23_DEC4_C; oc++) {
                data_t val = output[oy][ox][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[oy][ox][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec5  (Decoder Stage 5)
// Conv2d 3x3 stride=1 pad=1 (64→64) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec5(
    data_t input[OUT23_DEC4_H][OUT23_DEC4_W][OUT23_DEC4_C],        // [56][56][64]
    data_t output[OUT24_DEC5_H][OUT24_DEC5_W][OUT24_DEC5_C],       // [56][56][64]

    data_t weights[3][3][OUT23_DEC4_C][OUT24_DEC5_C],              // (3x3x64x64)
    data_t biases[OUT24_DEC5_C]                                    // (64)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int y = 0; y < OUT24_DEC5_H; y++) {
        for (int x = 0; x < OUT24_DEC5_W; x++) {
            for (int oc = 0; oc < OUT24_DEC5_C; oc++) {
                output[y][x][oc] = biases[oc];
            }
        }
    }

    // ───── Conv2d (3x3 stride=1 pad=1) ─────
    for (int y = 0; y < OUT24_DEC5_H; y++) {
        for (int x = 0; x < OUT24_DEC5_W; x++) {
            for (int ic = 0; ic < OUT23_DEC4_C; ic++) {
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int iy = y + ky - 1;  // padding = 1
                        int ix = x + kx - 1;
                        if (iy >= 0 && iy < OUT23_DEC4_H && ix >= 0 && ix < OUT23_DEC4_W) {
                            for (int oc = 0; oc < OUT24_DEC5_C; oc++) {
                                output[y][x][oc] += input[iy][ix][ic] * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int y = 0; y < OUT24_DEC5_H; y++) {
        for (int x = 0; x < OUT24_DEC5_W; x++) {
            for (int oc = 0; oc < OUT24_DEC5_C; oc++) {
                data_t val = output[y][x][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[y][x][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec6  (Decoder Stage 6)
// ConvTranspose2d 2x2 stride=2 (64→32) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec6(
    data_t input[OUT24_DEC5_H][OUT24_DEC5_W][OUT24_DEC5_C],        // [56][56][64]
    data_t output[OUT25_DEC6_H][OUT25_DEC6_W][OUT25_DEC6_C],       // [112][112][32]

    data_t weights[2][2][OUT24_DEC5_C][OUT25_DEC6_C],              // (2x2x64x32)
    data_t biases[OUT25_DEC6_C]                                    // (32)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int oy = 0; oy < OUT25_DEC6_H; oy++) {
        for (int ox = 0; ox < OUT25_DEC6_W; ox++) {
            for (int oc = 0; oc < OUT25_DEC6_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // ───── ConvTranspose2d (2x2 stride=2) ─────
    for (int iy = 0; iy < OUT24_DEC5_H; iy++) {
        for (int ix = 0; ix < OUT24_DEC5_W; ix++) {
            for (int ic = 0; ic < OUT24_DEC5_C; ic++) {
                data_t vin = input[iy][ix][ic];
                for (int ky = 0; ky < 2; ky++) {
                    for (int kx = 0; kx < 2; kx++) {
                        int oy = iy * 2 + ky;
                        int ox = ix * 2 + kx;
                        if (oy < OUT25_DEC6_H && ox < OUT25_DEC6_W) {
                            for (int oc = 0; oc < OUT25_DEC6_C; oc++) {
                                output[oy][ox][oc] += vin * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int oy = 0; oy < OUT25_DEC6_H; oy++) {
        for (int ox = 0; ox < OUT25_DEC6_W; ox++) {
            for (int oc = 0; oc < OUT25_DEC6_C; oc++) {
                data_t val = output[oy][ox][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[oy][ox][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec7  (Decoder Stage 7)
// Conv2d 3x3 stride=1 pad=1 (32→32) + ReLU
// BN already folded into weights/biases
// ──────────────────────────────────────────────
void dec7(
    data_t input[OUT25_DEC6_H][OUT25_DEC6_W][OUT25_DEC6_C],        // [112][112][32]
    data_t output[OUT26_DEC7_H][OUT26_DEC7_W][OUT26_DEC7_C],      // [112][112][32]

    data_t weights[3][3][OUT25_DEC6_C][OUT26_DEC7_C],              // (3x3x32x32)
    data_t biases[OUT26_DEC7_C]                                    // (32)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int oy = 0; oy < OUT26_DEC7_H; oy++) {
        for (int ox = 0; ox < OUT26_DEC7_W; ox++) {
            for (int oc = 0; oc < OUT26_DEC7_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // ───── Conv2d (3x3 stride=1 pad=1) ─────
    for (int iy = 0; iy < OUT25_DEC6_H; iy++) {
        for (int ix = 0; ix < OUT25_DEC6_W; ix++) {
            for (int ic = 0; ic < OUT25_DEC6_C; ic++) {
                data_t vin = input[iy][ix][ic];
                for (int ky = 0; ky < 3; ky++) {
                    for (int kx = 0; kx < 3; kx++) {
                        int oy = iy + ky - 1;  // pad=1
                        int ox = ix + kx - 1;
                        if (oy >= 0 && oy < OUT26_DEC7_H && ox >= 0 && ox < OUT26_DEC7_W) {
                            for (int oc = 0; oc < OUT26_DEC7_C; oc++) {
                                output[oy][ox][oc] += vin * weights[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU Activation ─────
    for (int oy = 0; oy < OUT26_DEC7_H; oy++) {
        for (int ox = 0; ox < OUT26_DEC7_W; ox++) {
            for (int oc = 0; oc < OUT26_DEC7_C; oc++) {
                data_t val = output[oy][ox][oc];
                if (val < (data_t)0) val = (data_t)0;
                output[oy][ox][oc] = val;
            }
        }
    }
}

// ──────────────────────────────────────────────
// Function: dec8  (Decoder Stage 8)
// Conv2d 1x1 stride=1 pad=0 (32→1)
// No activation (final logits output)
// ──────────────────────────────────────────────
void dec8(
    data_t input[OUT26_DEC7_H][OUT26_DEC7_W][OUT26_DEC7_C],        // [112][112][32]
    data_t output[OUT27_DEC8_H][OUT27_DEC8_W][OUT27_DEC8_C],       // [112][112][1]

    data_t weights[1][1][OUT26_DEC7_C][OUT27_DEC8_C],               // (1x1x32x1)
    data_t biases[OUT27_DEC8_C]                                     // (1)
) {
#pragma HLS INLINE off

    // ───── Array Partitioning ─────
    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1

    // ───── Initialize output with bias ─────
    for (int oy = 0; oy < OUT27_DEC8_H; oy++) {
        for (int ox = 0; ox < OUT27_DEC8_W; ox++) {
            for (int oc = 0; oc < OUT27_DEC8_C; oc++) {
                output[oy][ox][oc] = biases[oc];
            }
        }
    }

    // ───── Conv2d (1x1 stride=1 pad=0) ─────
    for (int iy = 0; iy < OUT26_DEC7_H; iy++) {
        for (int ix = 0; ix < OUT26_DEC7_W; ix++) {
            for (int ic = 0; ic < OUT26_DEC7_C; ic++) {
                data_t vin = input[iy][ix][ic];
                for (int oc = 0; oc < OUT27_DEC8_C; oc++) {
                    output[iy][ix][oc] += vin * weights[0][0][ic][oc];
                }
            }
        }
    }
}


