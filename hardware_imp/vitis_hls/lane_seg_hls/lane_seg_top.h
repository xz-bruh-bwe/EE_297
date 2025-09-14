#ifndef LANE_SEG_TOP_H
#define LANE_SEG_TOP_H

#include <hls_math.h>
#include "ap_fixed.h"

// ──────────────────────────────────────────────
// Data Type Configuration
typedef ap_fixed<16, 4> data_t;
//typedef float data_t;  // Change as needed

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

#endif  // LANE_SEG_TOP_H
