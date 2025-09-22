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
// Shapes for First InvertedResidual0 (enc0_ir0)
// Input:  112x112x32
// Output: 112x112x16
#define OUT1_IR0_H   OUT_H
#define OUT1_IR0_W   OUT_W
#define OUT1_IR0_C   16

// ──────────────────────────────────────────────
// Shapes for Second InvertedResidual1 (enc2_ir1)
// Input:  112x112x16
// Expansion: 16 → 96
// Depthwise: stride=2, so output H/W = 56
// Projection: 96 → 24
#define OUT2_IR1_H     (OUT1_IR0_H / 2)   // 56
#define OUT2_IR1_W     (OUT1_IR0_W / 2)   // 56
#define OUT2_IR1_C     24
#define OUT2_IR1_EXP_C 96

// ──────────────────────────────────────────────
// Shapes for Third InvertedResidual2 (enc3_ir2)
// Input:  56x56x24
// Expansion: 24 → 144
// Depthwise: stride=1, output H/W = 56
// Projection: 144 → 24
#define OUT3_IR2_H     OUT2_IR1_H         // 56
#define OUT3_IR2_W     OUT2_IR1_W         // 56
#define OUT3_IR2_C     24
#define OUT3_IR2_EXP_C 144

// ──────────────────────────────────────────────
// Shapes for Fourth InvertedResidual3 (enc4_ir3)
// Input:  56x56x24
// Expansion: 24 → 144
// Depthwise: stride=2, so output H/W = 28
// Projection: 144 → 32
#define OUT4_IR3_H     (OUT3_IR2_H / 2)   // 28
#define OUT4_IR3_W     (OUT3_IR2_W / 2)   // 28
#define OUT4_IR3_C     32
#define OUT4_IR3_EXP_C 144

// ──────────────────────────────────────────────
// Shapes for Fifth InvertedResidual4 (enc5_ir4)
// Input:  28x28x32
// Expansion: 32 → 192
// Depthwise: stride=1, output H/W = 28
// Projection: 192 → 32
#define OUT5_IR4_H     OUT4_IR3_H         // 28
#define OUT5_IR4_W     OUT4_IR3_W         // 28
#define OUT5_IR4_C     32
#define OUT5_IR4_EXP_C 192

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
    //data_t out0[OUT_H][OUT_W][OUT_C],          // Output of conv0 + bn + relu6
	//data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],  // <-- output after encoder1_ir0
	//data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],  // <-- output after encoder2_ir1
	//data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],  // <-- output after encoder3_ir2
	//data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],  	// <-- output after encoder4_ir3
	data_t out5_ir4[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],


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

// ───── Encoder Stage 2: Second InvertedResidual (enc2_ir1) ─────
// Expansion 1x1 (16→96) → Depthwise 3x3 stride=2 → Projection 1x1 (96→24)
void enc2_ir1(
    data_t input[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],              // 112x112x16
    data_t output[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],             // 56x56x24

    data_t exp_weights[1][1][OUT1_IR0_C][OUT2_IR1_EXP_C],          // 1x1: 16→96
    data_t exp_biases[OUT2_IR1_EXP_C],                             // 96
    data_t dw_weights[3][3][1][OUT2_IR1_EXP_C],                    // 3x3: 96
    data_t dw_biases[OUT2_IR1_EXP_C],                              // 96
    data_t pw_weights[1][1][OUT2_IR1_EXP_C][OUT2_IR1_C],           // 1x1: 96→24
    data_t pw_biases[OUT2_IR1_C]                                   // 24
);


// ───── Encoder Stage 3: Third InvertedResidual (enc3_ir2) ─────
void enc3_ir2(
    data_t input[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],              // 56x56x24
    data_t output[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],             // 56x56x24

    data_t exp_weights[1][1][OUT2_IR1_C][OUT3_IR2_EXP_C],          // 1x1: 24→144
    data_t exp_biases[OUT3_IR2_EXP_C],                             // 144
    data_t dw_weights[3][3][1][OUT3_IR2_EXP_C],                    // 3x3: 144
    data_t dw_biases[OUT3_IR2_EXP_C],                              // 144
    data_t pw_weights[1][1][OUT3_IR2_EXP_C][OUT3_IR2_C],           // 1x1: 144→24
    data_t pw_biases[OUT3_IR2_C]                                   // 24
);


// ───── Encoder Stage 4: Fourth InvertedResidual (enc4_ir3) ─────
void enc4_ir3(
    data_t input[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],              // 56x56x24
    data_t output[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],             // 28x28x32

    data_t exp_weights[1][1][OUT3_IR2_C][OUT4_IR3_EXP_C],          // 1x1: 24→144
    data_t exp_biases[OUT4_IR3_EXP_C],                             // 144
    data_t dw_weights[3][3][1][OUT4_IR3_EXP_C],                    // 3x3: 144
    data_t dw_biases[OUT4_IR3_EXP_C],                              // 144
    data_t pw_weights[1][1][OUT4_IR3_EXP_C][OUT4_IR3_C],           // 1x1: 144→32
    data_t pw_biases[OUT4_IR3_C]                                   // 32
);


// ───── Encoder Stage 5: Fifth InvertedResidual (enc5_ir4) ─────
void enc5_ir4(
    data_t input[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],              // 28x28x32
    data_t output[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],             // 28x28x32

    data_t exp_weights[1][1][OUT4_IR3_C][OUT5_IR4_EXP_C],          // 1x1: 32→192
    data_t exp_biases[OUT5_IR4_EXP_C],                             // 192
    data_t dw_weights[3][3][1][OUT5_IR4_EXP_C],                    // 3x3: 192
    data_t dw_biases[OUT5_IR4_EXP_C],                              // 192
    data_t pw_weights[1][1][OUT5_IR4_EXP_C][OUT5_IR4_C],           // 1x1: 192→32
    data_t pw_biases[OUT5_IR4_C]                                   // 32
);

#endif  // LANE_SEG_TOP_H
