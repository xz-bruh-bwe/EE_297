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
// Shapes for Sixth InvertedResidual5 (enc6_ir5)
// Input:  28x28x32
// Expansion: 32 → 192
// Depthwise: stride=1, output H/W = 28
// Projection: 192 → 32
#define OUT6_IR5_H     OUT5_IR4_H         // 28
#define OUT6_IR5_W     OUT5_IR4_W         // 28
#define OUT6_IR5_C     32
#define OUT6_IR5_EXP_C 192


// ──────────────────────────────────────────────
// Shapes for Seventh InvertedResidual6 (enc7_ir6)
// Input:  28x28x32
// Expansion: 32 → 192
// Depthwise: stride=2, so output H/W = 14
// Projection: 192 → 64
#define OUT7_IR6_H     (OUT6_IR5_H / 2)   // 14
#define OUT7_IR6_W     (OUT6_IR5_W / 2)   // 14
#define OUT7_IR6_C     64
#define OUT7_IR6_EXP_C 192

// ──────────────────────────────────────────────
// Shapes for Eighth InvertedResidual (enc8_ir7)
// Input:  14x14x64 (from out7_ir6)
// Expansion: 64 → 384
// Depthwise: stride=1 (same H/W)
// Projection: 384 → 64
#define OUT8_IR7_H     OUT7_IR6_H       // 14
#define OUT8_IR7_W     OUT7_IR6_W       // 14
#define OUT8_IR7_C     64
#define OUT8_IR7_EXP_C 384

// ──────────────────────────────────────────────
// Shapes for Ninth InvertedResidual (enc9_ir8)
// Input:  14x14x64 (from out8_ir7)
// Expansion: 64 → 384
// Depthwise: stride=1 (same H/W)
// Projection: 384 → 64
#define OUT9_IR8_H     OUT8_IR7_H       // 14
#define OUT9_IR8_W     OUT8_IR7_W       // 14
#define OUT9_IR8_C     64
#define OUT9_IR8_EXP_C 384


// ──────────────────────────────────────────────
// Shapes for Tenth InvertedResidual (enc10_ir9)
// Input:  14x14x64 (from out9_ir8)
// Expansion: 64 → 384
// Depthwise: stride=1 (same H/W)
// Projection: 384 → 64
#define OUT10_IR9_H     OUT9_IR8_H       // 14
#define OUT10_IR9_W     OUT9_IR8_W       // 14
#define OUT10_IR9_C     64
#define OUT10_IR9_EXP_C 384

// ──────────────────────────────────────────────
// Shapes for Eleventh InvertedResidual (enc11_ir10)
// Input:  14x14x64 (from out10_ir9)
// Expansion: 64 → 384
// Depthwise: stride=1 (same H/W)
// Projection: 384 → 96
#define OUT11_IR10_H     OUT10_IR9_H       // 14
#define OUT11_IR10_W     OUT10_IR9_W       // 14
#define OUT11_IR10_C     96
#define OUT11_IR10_EXP_C 384


// ──────────────────────────────────────────────
// Shapes for Twelfth InvertedResidual (enc12_ir11)
// Input:  14x14x96 (from out11_ir10)
// Expansion: 96 → 576
// Depthwise: stride=1 (same H/W)
// Projection: 576 → 96
#define OUT12_IR11_H     OUT11_IR10_H       // 14
#define OUT12_IR11_W     OUT11_IR10_W       // 14
#define OUT12_IR11_C     96
#define OUT12_IR11_EXP_C 576

// ──────────────────────────────────────────────
// Shapes for Thirteenth InvertedResidual (enc13_ir12)
// Input:  14x14x96 (from out12_ir11)
// Expansion: 96 → 576
// Depthwise: stride=1 (same H/W)
// Projection: 576 → 96
#define OUT13_IR12_H     OUT12_IR11_H       // 14
#define OUT13_IR12_W     OUT12_IR11_W       // 14
#define OUT13_IR12_C     96
#define OUT13_IR12_EXP_C 576

// ──────────────────────────────────────────────
// Shapes for Fourteenth InvertedResidual (enc14_ir13)
// Input:  14x14x96 (from out13_ir12)
// Expansion: 96 → 576
// Depthwise: stride=2, so output H/W = 7
// Projection: 576 → 160
#define OUT14_IR13_H     (OUT13_IR12_H / 2)   // 7
#define OUT14_IR13_W     (OUT13_IR12_W / 2)   // 7
#define OUT14_IR13_C     160
#define OUT14_IR13_EXP_C 576


// ──────────────────────────────────────────────
// Shapes for Fifteenth InvertedResidual (enc15_ir14)
// Input:  7x7x160 (from out14_ir13)
// Expansion: 160 → 960
// Depthwise: stride=1 (same H/W)
// Projection: 960 → 160
#define OUT15_IR14_H       OUT14_IR13_H        // 7
#define OUT15_IR14_W       OUT14_IR13_W        // 7
#define OUT15_IR14_C       160
#define OUT15_IR14_EXP_C   960

// ──────────────────────────────────────────────
// Shapes for Sixteenth InvertedResidual (enc16_ir15)
// Input:  7x7x160 (from out15_ir14)
// Expansion: 160 → 960
// Depthwise: stride=1 (same H/W)
// Projection: 960 → 160
#define OUT16_IR15_H       OUT15_IR14_H        // 7
#define OUT16_IR15_W       OUT15_IR14_W        // 7
#define OUT16_IR15_C       160
#define OUT16_IR15_EXP_C   960

// ──────────────────────────────────────────────
// Shapes for Seventeenth InvertedResidual (enc17_ir16)
// Input:  7x7x160 (from out16_ir15)
// Expansion: 160 → 960
// Depthwise: stride=1 (same H/W)
// Projection: 960 → 320
#define OUT17_IR16_H       OUT16_IR15_H        // 7
#define OUT17_IR16_W       OUT16_IR15_W        // 7
#define OUT17_IR16_C       320
#define OUT17_IR16_EXP_C   960


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
    //float image[IN_H][IN_W][IN_C],            // Input RGB image
    //data_t out0[OUT_H][OUT_W][OUT_C],          // Output of conv0 + bn + relu6
	//data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],  // <-- output after encoder1_ir0
	//data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],  // <-- output after encoder2_ir1
	//data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],  // <-- output after encoder3_ir2
	//data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],  // <-- output after encoder4_ir3
	//data_t out5_ir4[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],
	//data_t out6_ir5[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],
	//data_t out7_ir6[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],
	//data_t out8_ir7[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],
    //data_t out9_ir8[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],
	//data_t out10_ir9[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C],
	//data_t out11_ir10[OUT11_IR10_H][OUT11_IR10_W][OUT11_IR10_C],
	//data_t out12_ir11[OUT12_IR11_H][OUT12_IR11_W][OUT12_IR11_C],
	//data_t out13_ir12[OUT13_IR12_H][OUT13_IR12_W][OUT13_IR12_C],
	//data_t out14_ir13[OUT14_IR13_H][OUT14_IR13_W][OUT14_IR13_C],
	//data_t out15_ir14[OUT15_IR14_H][OUT15_IR14_W][OUT15_IR14_C],
	float out16_ir15[OUT16_IR15_H][OUT16_IR15_W][OUT16_IR15_C],
	data_t out17_ir16[OUT17_IR16_H][OUT17_IR16_W][OUT17_IR16_C],



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

// ───── Encoder Stage 6: Sixth InvertedResidual (enc6_ir5) ─────
void enc6_ir5(
    data_t input[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],              // 28x28x32
    data_t output[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],             // 28x28x32

    data_t exp_weights[1][1][OUT5_IR4_C][OUT6_IR5_EXP_C],          // 1x1: 32→192
    data_t exp_biases[OUT6_IR5_EXP_C],                             // 192
    data_t dw_weights[3][3][1][OUT6_IR5_EXP_C],                    // 3x3: 192
    data_t dw_biases[OUT6_IR5_EXP_C],                              // 192
    data_t pw_weights[1][1][OUT6_IR5_EXP_C][OUT6_IR5_C],           // 1x1: 192→32
    data_t pw_biases[OUT6_IR5_C]                                   // 32
);


// ───── Encoder Stage 7: Seventh InvertedResidual (enc7_ir6) ─────
void enc7_ir6(
    data_t input[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],              // 28x28x32
    data_t output[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],             // 14x14x64

    data_t exp_weights[1][1][OUT6_IR5_C][OUT7_IR6_EXP_C],          // 1x1: 32→192
    data_t exp_biases[OUT7_IR6_EXP_C],                             // 192
    data_t dw_weights[3][3][1][OUT7_IR6_EXP_C],                    // 3x3: 192
    data_t dw_biases[OUT7_IR6_EXP_C],                              // 192
    data_t pw_weights[1][1][OUT7_IR6_EXP_C][OUT7_IR6_C],           // 1x1: 192→64
    data_t pw_biases[OUT7_IR6_C]                                   // 64
);

// ───── Encoder Stage 8: Eighth InvertedResidual (enc8_ir7) ─────
void enc8_ir7(
    data_t input[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],              // 14x14x64
    data_t output[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],             // 14x14x64

    data_t exp_weights[1][1][OUT7_IR6_C][OUT8_IR7_EXP_C],          // 1x1: 64→384
    data_t exp_biases[OUT8_IR7_EXP_C],                             // 384
    data_t dw_weights[3][3][1][OUT8_IR7_EXP_C],                    // 3x3: 384
    data_t dw_biases[OUT8_IR7_EXP_C],                              // 384
    data_t pw_weights[1][1][OUT8_IR7_EXP_C][OUT8_IR7_C],           // 1x1: 384→64
    data_t pw_biases[OUT8_IR7_C]                                   // 64
);

// ───── Encoder Stage 9: Ninth InvertedResidual (enc9_ir8) ─────
void enc9_ir8(
    data_t input[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],              // 14x14x64
    data_t output[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],             // 14x14x64

    data_t exp_weights[1][1][OUT8_IR7_C][OUT9_IR8_EXP_C],          // 1x1: 64→384
    data_t exp_biases[OUT9_IR8_EXP_C],                             // 384
    data_t dw_weights[3][3][1][OUT9_IR8_EXP_C],                    // 3x3: 384
    data_t dw_biases[OUT9_IR8_EXP_C],                              // 384
    data_t pw_weights[1][1][OUT9_IR8_EXP_C][OUT9_IR8_C],           // 1x1: 384→64
    data_t pw_biases[OUT9_IR8_C]                                   // 64
);

// ───── Encoder Stage 10: Tenth InvertedResidual (enc10_ir9) ─────
void enc10_ir9(
    data_t input[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],              // 14x14x64
    data_t output[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C],          // 14x14x64

    data_t exp_weights[1][1][OUT9_IR8_C][OUT10_IR9_EXP_C],         // 1x1: 64→384
    data_t exp_biases[OUT10_IR9_EXP_C],                            // 384
    data_t dw_weights[3][3][1][OUT10_IR9_EXP_C],                   // 3x3: 384
    data_t dw_biases[OUT10_IR9_EXP_C],                             // 384
    data_t pw_weights[1][1][OUT10_IR9_EXP_C][OUT10_IR9_C],         // 1x1: 384→64
    data_t pw_biases[OUT10_IR9_C]                                  // 64
);


// ───── Encoder Stage 11: Eleventh InvertedResidual (enc11_ir10) ─────
void enc11_ir10(
    data_t input[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C],              // 14x14x64
    data_t output[OUT11_IR10_H][OUT11_IR10_W][OUT11_IR10_C],         // 14x14x96

    data_t exp_weights[1][1][OUT10_IR9_C][OUT11_IR10_EXP_C],         // 1x1: 64→384
    data_t exp_biases[OUT11_IR10_EXP_C],                             // 384
    data_t dw_weights[3][3][1][OUT11_IR10_EXP_C],                    // 3x3: 384
    data_t dw_biases[OUT11_IR10_EXP_C],                              // 384
    data_t pw_weights[1][1][OUT11_IR10_EXP_C][OUT11_IR10_C],         // 1x1: 384→96
    data_t pw_biases[OUT11_IR10_C]                                   // 96
);

// ───── Encoder Stage 12: Twelfth InvertedResidual (enc12_ir11) ─────
void enc12_ir11(
    data_t input[OUT11_IR10_H][OUT11_IR10_W][OUT11_IR10_C],              // 14x14x96
    data_t output[OUT12_IR11_H][OUT12_IR11_W][OUT12_IR11_C],            // 14x14x96

    data_t exp_weights[1][1][OUT11_IR10_C][OUT12_IR11_EXP_C],           // 1x1: 96→576
    data_t exp_biases[OUT12_IR11_EXP_C],                                // 576
    data_t dw_weights[3][3][1][OUT12_IR11_EXP_C],                       // 3x3: 576
    data_t dw_biases[OUT12_IR11_EXP_C],                                 // 576
    data_t pw_weights[1][1][OUT12_IR11_EXP_C][OUT12_IR11_C],            // 1x1: 576→96
    data_t pw_biases[OUT12_IR11_C]                                      // 96
);

// ───── Encoder Stage 13: Thirteenth InvertedResidual (enc13_ir12) ─────
void enc13_ir12(
    data_t input[OUT12_IR11_H][OUT12_IR11_W][OUT12_IR11_C],              // 14x14x96
    data_t output[OUT13_IR12_H][OUT13_IR12_W][OUT13_IR12_C],            // 14x14x96

    data_t exp_weights[1][1][OUT12_IR11_C][OUT13_IR12_EXP_C],           // 1x1: 96→576
    data_t exp_biases[OUT13_IR12_EXP_C],                                // 576
    data_t dw_weights[3][3][1][OUT13_IR12_EXP_C],                       // 3x3: 576
    data_t dw_biases[OUT13_IR12_EXP_C],                                 // 576
    data_t pw_weights[1][1][OUT13_IR12_EXP_C][OUT13_IR12_C],            // 1x1: 576→96
    data_t pw_biases[OUT13_IR12_C]                                      // 96
);

// ───── Encoder Stage 14: Fourteenth InvertedResidual (enc14_ir13) ─────
void enc14_ir13(
	data_t input[OUT13_IR12_H][OUT13_IR12_W][OUT13_IR12_C],              // 14x14x96
    data_t output[OUT14_IR13_H][OUT14_IR13_W][OUT14_IR13_C],             // 7x7x160

    data_t exp_weights[1][1][OUT13_IR12_C][OUT14_IR13_EXP_C],            // 1x1: 96→576
    data_t exp_biases[OUT14_IR13_EXP_C],                                 // 576
    data_t dw_weights[3][3][1][OUT14_IR13_EXP_C],                        // 3x3: 576 (stride=2)
    data_t dw_biases[OUT14_IR13_EXP_C],                                  // 576
    data_t pw_weights[1][1][OUT14_IR13_EXP_C][OUT14_IR13_C],             // 1x1: 576→160
    data_t pw_biases[OUT14_IR13_C]                                       // 160
);


// ───── Encoder Stage 15: Fifteenth InvertedResidual (enc15_ir14) ─────
void enc15_ir14(
    data_t input[OUT14_IR13_H][OUT14_IR13_W][OUT14_IR13_C],             // 7x7x160
    data_t output[OUT15_IR14_H][OUT15_IR14_W][OUT15_IR14_C],            // 7x7x160

    data_t exp_weights[1][1][OUT14_IR13_C][OUT15_IR14_EXP_C],           // 1x1: 160→960
    data_t exp_biases[OUT15_IR14_EXP_C],                                // 960

    data_t dw_weights[3][3][1][OUT15_IR14_EXP_C],                       // 3x3: 960 (depthwise)
    data_t dw_biases[OUT15_IR14_EXP_C],                                 // 960

    data_t pw_weights[1][1][OUT15_IR14_EXP_C][OUT15_IR14_C],            // 1x1: 960→160
    data_t pw_biases[OUT15_IR14_C]                                      // 160
);


// ───── Encoder Stage 16: Sixteenth InvertedResidual (enc16_ir15) ─────
void enc16_ir15(
    data_t input[OUT15_IR14_H][OUT15_IR14_W][OUT15_IR14_C],             // 7x7x160
    data_t output[OUT16_IR15_H][OUT16_IR15_W][OUT16_IR15_C],            // 7x7x160

    data_t exp_weights[1][1][OUT15_IR14_C][OUT16_IR15_EXP_C],           // 1x1: 160→960
    data_t exp_biases[OUT16_IR15_EXP_C],                                // 960

    data_t dw_weights[3][3][1][OUT16_IR15_EXP_C],                       // 3x3: 960 (depthwise, stride=1)
    data_t dw_biases[OUT16_IR15_EXP_C],                                 // 960

    data_t pw_weights[1][1][OUT16_IR15_EXP_C][OUT16_IR15_C],            // 1x1: 960→320
    data_t pw_biases[OUT16_IR15_C]                                      // 320
);

// ───── Encoder Stage 17: Seventeenth InvertedResidual (enc17_ir16) ─────
void enc17_ir16(
    float input[OUT16_IR15_H][OUT16_IR15_W][OUT16_IR15_C],             // 7x7x160
    data_t output[OUT17_IR16_H][OUT17_IR16_W][OUT17_IR16_C],            // 7x7x320

    data_t exp_weights[1][1][OUT16_IR15_C][OUT17_IR16_EXP_C],           // 1x1: 160→960
    data_t exp_biases[OUT17_IR16_EXP_C],                                // 960

    data_t dw_weights[3][3][1][OUT17_IR16_EXP_C],                       // 3x3: 960 (depthwise, stride=1)
    data_t dw_biases[OUT17_IR16_EXP_C],                                 // 960

    data_t pw_weights[1][1][OUT17_IR16_EXP_C][OUT17_IR16_C],            // 1x1: 960→320
    data_t pw_biases[OUT17_IR16_C]                                      // 320
);




#endif  // LANE_SEG_TOP_H
