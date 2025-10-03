#include <cstdio> // Required for printf


// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// Project Headers
#include "lane_seg_top.h"
#include "ap_fixed.h"

// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// Function: dec0  (Decoder Stage 0)
// ConvTranspose2d 2x2 stride=2 (1280â†’256) + ReLU
// BN already folded into weights/biases
// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//void dec0(
//    float input[OUT18_CNV_H][OUT18_CNV_W][OUT18_CNV_C],          // [7][7][1280]
//    data_t output[OUT19_DEC0_H][OUT19_DEC0_W][OUT19_DEC0_C],      // [14][14][256]
//
//    data_t weights[2][2][OUT18_CNV_C][OUT19_DEC0_C],              // (2x2x1280x256)
//    data_t biases[OUT19_DEC0_C]                                   // (256)
//) {
//#pragma HLS INLINE off
//
//    // â”€â”€â”€â”€â”€ Array Partitioning â”€â”€â”€â”€â”€
//    #pragma HLS ARRAY_PARTITION variable=weights block factor=1 dim=3
//    #pragma HLS ARRAY_PARTITION variable=biases  block factor=1 dim=1
//
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    // Initialize output with biases
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
//        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
//            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
//                output[oy][ox][oc] = biases[oc];
//            }
//        }
//    }
//
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    // ConvTranspose2d (2x2 stride=2)
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    for (int iy = 0; iy < OUT18_CNV_H; iy++) {
//        for (int ix = 0; ix < OUT18_CNV_W; ix++) {
//            for (int ic = 0; ic < OUT18_CNV_C; ic++) {
//                for (int ky = 0; ky < 2; ky++) {
//                    for (int kx = 0; kx < 2; kx++) {
//                        int oy = iy * 2 + ky;
//                        int ox = ix * 2 + kx;
//                        if (oy < OUT19_DEC0_H && ox < OUT19_DEC0_W) {
//                            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
//                                output[oy][ox][oc] += input[iy][ix][ic] * weights[ky][kx][ic][oc];
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    // Apply ReLU
//    // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
//    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
//        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
//            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
//                data_t val = output[oy][ox][oc];
//                if (val < 0) val = 0; // ReLU
//                output[oy][ox][oc] = val;
//            }
//        }
//    }
//}

// ──────────────────────────────────────────────
// Function: dec0 (Decoder Stage 0, HLS-streamed)
// ConvTranspose2d (1280→256, kernel=2, stride=2) + ReLU
// BN already folded into streamed weights/biases
// ──────────────────────────────────────────────
void dec0(
    float input[OUT18_CNV_H][OUT18_CNV_W][OUT18_CNV_C],
    data_t output[OUT19_DEC0_H][OUT19_DEC0_W][OUT19_DEC0_C],
    hls::stream<float>& dec0_w,
    hls::stream<float>& dec0_b
) {
#pragma HLS INLINE off

    // ───── Static buffers to avoid stack overflow ─────
    static data_t Wbuf[2][2][OUT18_CNV_C][OUT19_DEC0_C];
    static data_t Bbuf[OUT19_DEC0_C];

#pragma HLS ARRAY_PARTITION variable=Wbuf dim=4 factor=8 cyclic
#pragma HLS ARRAY_PARTITION variable=Bbuf complete dim=1

    // ───── Load biases ─────
    for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
#pragma HLS PIPELINE II=1
        Bbuf[oc] = (data_t)dec0_b.read();
    }

    // ───── Load weights ─────
    for (int ky = 0; ky < 2; ky++) {
        for (int kx = 0; kx < 2; kx++) {
            for (int ic = 0; ic < OUT18_CNV_C; ic++) {
                for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
#pragma HLS PIPELINE II=1
                    Wbuf[ky][kx][ic][oc] = (data_t)dec0_w.read();
                }
            }
        }
    }

    // ───── Initialize output ─────
    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
#pragma HLS PIPELINE II=1
                output[oy][ox][oc] = Bbuf[oc];
            }
        }
    }

    // ───── Transposed convolution ─────
    for (int iy = 0; iy < OUT18_CNV_H; iy++) {
        for (int ix = 0; ix < OUT18_CNV_W; ix++) {
            for (int ic = 0; ic < OUT18_CNV_C; ic++) {
                data_t vin = (data_t)input[iy][ix][ic];
                for (int ky = 0; ky < 2; ky++) {
                    for (int kx = 0; kx < 2; kx++) {
                        int oy = iy * 2 + ky;
                        int ox = ix * 2 + kx;
                        if (oy < OUT19_DEC0_H && ox < OUT19_DEC0_W) {
                            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
#pragma HLS PIPELINE II=1
                                output[oy][ox][oc] += vin * Wbuf[ky][kx][ic][oc];
                            }
                        }
                    }
                }
            }
        }
    }

    // ───── ReLU ─────
    for (int oy = 0; oy < OUT19_DEC0_H; oy++) {
        for (int ox = 0; ox < OUT19_DEC0_W; ox++) {
            for (int oc = 0; oc < OUT19_DEC0_C; oc++) {
#pragma HLS PIPELINE II=1
                data_t v = output[oy][ox][oc];
                output[oy][ox][oc] = (v <(data_t)0) ? (data_t)(0) : v;
            }
        }
    }
}
