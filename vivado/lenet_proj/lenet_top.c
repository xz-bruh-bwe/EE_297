#include "ap_fixed.h"
#include "hls_stream.h"
#include <math.h>
#include "conv1_weights.h"
#include "conv1_biases.h"


// Constants
#define IMG_HEIGHT 28
#define IMG_WIDTH 28
#define OUT_CHANNELS 6
#define KERNEL_SIZE 5

// Types
typedef float data_t;

// Weights/biases
extern data_t conv1_weights[KERNEL_SIZE][KERNEL_SIZE][1][OUT_CHANNELS];
extern data_t conv1_biases[OUT_CHANNELS];

// ───────────────────────────────────────────────
// Reusable Conv2D Layer (1 input channel, N output filters)
void conv2d_layer(data_t input[IMG_HEIGHT][IMG_WIDTH],
                  data_t output[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
                  data_t weights[KERNEL_SIZE][KERNEL_SIZE][1][OUT_CHANNELS],
                  data_t biases[OUT_CHANNELS]) {
                      
    data_t padded[IMG_HEIGHT + 4][IMG_WIDTH + 4] = {0};

    // Zero-padding (2 pixels on each side)
    for (int i = 0; i < IMG_HEIGHT; i++) {
        for (int j = 0; j < IMG_WIDTH; j++) {
            padded[i + 2][j + 2] = input[i][j];
        }
    }

    // Convolution computation
    for (int out_c = 0; out_c < OUT_CHANNELS; out_c++) {
        for (int i = 0; i < IMG_HEIGHT; i++) {
            for (int j = 0; j < IMG_WIDTH; j++) {
#pragma HLS PIPELINE II=1
                data_t sum = 0.0;
                for (int ki = 0; ki < KERNEL_SIZE; ki++) {
                    for (int kj = 0; kj < KERNEL_SIZE; kj++) {
                        data_t pixel = padded[i + ki][j + kj];
                        data_t weight = weights[ki][kj][0][out_c];
                        sum += pixel * weight;
                    }
                }
                sum += biases[out_c];
                output[i][j][out_c] = (sum > 0) ? sum : 0;  // ReLU
            }
        }
    }
}

// ───────────────────────────────────────────────
// Top-Level Function (HLS entry point)
void lenet_top(data_t image[IMG_HEIGHT][IMG_WIDTH],
               data_t conv1_out[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS]) {
#pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=conv1_out offset=slave bundle=gmem
#pragma HLS INTERFACE s_axilite port=image bundle=control
#pragma HLS INTERFACE s_axilite port=conv1_out bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // Call the first Conv2D layer
    conv2d_layer(image, conv1_out, conv1_weights, conv1_biases);
}
