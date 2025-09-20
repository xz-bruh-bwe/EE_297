#ifndef LANE_SEG_TOP_H
#define LANE_SEG_TOP_H

#include <hls_math.h>
#include "ap_fixed.h"

// ──────────────────────────────────────────────
// Data Type Configuration
//typedef ap_fixed<16, 4> data_t;
//typedef float data_t;  // Change as needed
typedef half data_t;  // Change as needed

// ──────────────────────────────────────────────
// Layer Shape Definitions (MobileNetV2 First Layer)
// Input:  224x224x3
// Output: 112x112x32 after Conv + BN + ReLU6
#define IN_H     224
#define IN_W     224
#define IN_C     3
#define OUT_C    32
#define K        3       // Kernel size
#define STRIDE   2
#define PAD      1
#define OUT_H    ((IN_H + 2 * PAD - K) / STRIDE + 1)  // 112
#define OUT_W    ((IN_W + 2 * PAD - K) / STRIDE + 1)  // 112
// ──────────────────────────────────────────────
// Shapes for Encoder Stage 0 (encoder0_c1)
// Output: 112x112x32
#define OUT0_H   OUT_H
#define OUT0_W   OUT_W
#define OUT0_C   OUT_C


// ──────────────────────────────────────────────
// Shapes for First InvertedResidual (enc0_ir0)
// Input:  112x112x32
// Output: 112x112x16
#define OUT1_IR0_H   OUT_H
#define OUT1_IR0_W   OUT_W
#define OUT1_IR0_C   16


// ──────────────────────────────────────────────
// Legacy Alias Macros (for backward compatibility, optional)
#define IMG_HEIGHT  IN_H
#define IMG_WIDTH   IN_W
#define IN_CH       IN_C
#define OUT_CH      OUT_C

// ──────────────────────────────────────────────
// Function Prototypes

// ───── HLS Entry Point ─────
// Only image input + output + AXI-lite control and status registers
void lane_seg_top(
    float image[IN_H][IN_W][IN_C],            // Input RGB image
    data_t out0[OUT_H][OUT_W][OUT_C],          // Output of conv0 + bn + relu6
	//data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C], // Output of enc0_ir0


    unsigned int ctrl,                         // AXI-lite control (optional)
    unsigned int& status,                      // AXI-lite status
    unsigned int& magic                        // AXI-lite magic ID (0x1EAF0001)
);

// ───── Encoder Stage 0: First Conv Block ─────
// Convolution + Bias + ReLU6
void encoder0_c1(
    float input[IN_H][IN_W][IN_C],
    data_t output[OUT_H][OUT_W][OUT_C],
    data_t weights[K][K][IN_C][OUT_C],
    data_t biases[OUT_C]
);


// ───── Encoder Stage 1: First InvertedResidual (enc0_ir0) ─────
// Nested depthwise + pointwise conv with BN folded
void enc1_ir0(
    data_t input[OUT_H][OUT_W][OUT_C],                   // 112x112x32
    data_t output[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],   // 112x112x16
    data_t dw_weights[3][3][1][OUT_C],               // depthwise: (3x3x32x32)
    data_t dw_biases[OUT_C],                             // depthwise biases (32)
    data_t pw_weights[1][1][OUT_C][OUT1_IR0_C],          // pointwise: (1x1x32x16)
    data_t pw_biases[OUT1_IR0_C]                         // pointwise biases (16)
);

#endif  // LANE_SEG_TOP_H
