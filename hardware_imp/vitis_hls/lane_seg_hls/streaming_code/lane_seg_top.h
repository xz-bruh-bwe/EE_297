#ifndef LANE_SEG_TOP_H
#define LANE_SEG_TOP_H

#include <hls_math.h>
#include "ap_fixed.h"
// Define the data type

typedef ap_fixed<16, 8> data_t;
//typedef float data_t;

// ---- Shapes for the first MobileNetV2 layer (224x224 → 112x112) ----
#define IN_H   224
#define IN_W   224
#define IN_C   3
#define OUT_C  32
#define K      3
#define STRIDE 2
#define PAD    1
#define OUT_H  ((IN_H + 2*PAD - K)/STRIDE + 1)   // 112
#define OUT_W  ((IN_W + 2*PAD - K)/STRIDE + 1)   // 112

//Encoder
#define IMG_HEIGHT 224
#define IMG_WIDTH  224
#define IN_CH      3
#define OUT_CH     32

// Function Prototypes

// HLS entry: only image + output + control, no weight pointers
void lane_seg_top(
    data_t image[IN_H][IN_W][IN_C],     // input RGB
    data_t out0[OUT_H][OUT_W][OUT_C],   // output of conv0+bn+relu6
	data_t encoder0_c1_weights[K*K*IN_C*OUT_C],
	data_t encoder0_c1_biases [OUT_C],


	// Status Bits Outputs
    unsigned int  ctrl,                 // AXI-lite control (optional)
    unsigned int& status,               // status bits
    unsigned int& magic                 // ID
);



// First Stage: Encoder
// Encoder Stage 0: First Conv Block
void encoder0_c1(
    data_t input  [IN_H][IN_W][IN_C],
    data_t output [OUT_H][OUT_W][OUT_C],
	data_t weights_flat[K*K*IN_C*OUT_C],
	data_t biases      [OUT_C]
);


#endif // LANE_SEG_TOP_H
