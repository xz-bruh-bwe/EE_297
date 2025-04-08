
#include "lenet_top.h"
#include "ap_fixed.h"


// ─────────────────────────────────────────────
// Reusable Conv2D Layer (1 input channel, N output filters)
void conv2d_layer(data_t input[IMG_HEIGHT][IMG_WIDTH],
    data_t output[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t weights[KERNEL_HEIGHT][KERNEL_WIDTH][1][OUT_CHANNELS],
    data_t biases[OUT_CHANNELS]) {
                      
    data_t padded[IMG_HEIGHT + 4][IMG_WIDTH + 4] = {0};

    // Fix 1: Partition padded array to avoid memory bottlenecks
    #pragma HLS ARRAY_PARTITION variable=padded block factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=padded block factor=4 dim=2
    #pragma HLS RESOURCE variable=padded core=RAM_1P_LUTRAM

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
#pragma HLS PIPELINE
                data_t sum = 0.0;
                for (int ki = 0; ki < KERNEL_HEIGHT; ki++) {
                    for (int kj = 0; kj < KERNEL_WIDTH; kj++) {
                     
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

// Max Pooling Layer (2x2, stride 2)
void maxpool_layer(
    data_t input[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t output[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS])
{
#pragma HLS INLINE off

    for (int c = 0; c < OUT_CHANNELS; c++) {
        for (int i = 0; i < IMG_HEIGHT; i += 2) {
            for (int j = 0; j < IMG_WIDTH; j += 2) {
#pragma HLS PIPELINE II=1
                data_t v0 = input[i][j][c];
                data_t v1 = input[i][j + 1][c];
                data_t v2 = input[i + 1][j][c];
                data_t v3 = input[i + 1][j + 1][c];

                data_t max1 = (v0 > v1) ? v0 : v1;
                data_t max2 = (v2 > v3) ? v2 : v3;
                data_t max_final = (max1 > max2) ? max1 : max2;

                output[i / 2][j / 2][c] = max_final;
            }
        }
    }
}

//conv2d_6to16_layer (Layer 3)
void conv2d_6to16_layer(
    data_t input[14][14][6],  // Input from MaxPool1 (assumed 14x14x6)
    data_t output[10][10][16],  // Output will be 10x10x16 if no padding
    data_t weights[5][5][6][16],
    data_t biases[16])
{
#pragma HLS INLINE off

    for (int oc = 0; oc < 16; oc++) {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
#pragma HLS PIPELINE II
                data_t sum = 0.0f;

                for (int ic = 0; ic < 6; ic++) {
                    for (int ki = 0; ki < 5; ki++) {
                        for (int kj = 0; kj < 5; kj++) {
                            data_t pixel = input[i + ki][j + kj][ic];
                            data_t weight = weights[ki][kj][ic][oc];
                            sum += pixel * weight;
                        }
                    }
                }

                sum += biases[oc];
                output[i][j][oc] = (sum > 0.0f) ? sum : 0.0f;  // ReLU
            }
        }
    }
}

void maxpool2_layer(
    data_t input[10][10][16],
    data_t output[5][5][16])
{
#pragma HLS INLINE off

    for (int c = 0; c < 16; c++) {
        for (int i = 0; i < 10; i += 2) {
            for (int j = 0; j < 10; j += 2) {
#pragma HLS PIPELINE II=1
                data_t v0 = input[i][j][c];
                data_t v1 = input[i][j + 1][c];
                data_t v2 = input[i + 1][j][c];
                data_t v3 = input[i + 1][j + 1][c];

                data_t max1 = (v0 > v1) ? v0 : v1;
                data_t max2 = (v2 > v3) ? v2 : v3;
                data_t max_final = (max1 > max2) ? max1 : max2;

                output[i / 2][j / 2][c] = max_final;
            }
        }
    }
}

void flatten_layer(
    data_t input[5][5][16],
    data_t output[400])
{
#pragma HLS INLINE off

    int index = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            for (int c = 0; c < 16; c++) {
#pragma HLS PIPELINE II
                output[index++] = input[i][j][c];
            }
        }
    }
}


//template<int IN_SIZE, int OUT_SIZE>
//void fc_layer(
//    data_t input[IN_SIZE],
//    data_t output[OUT_SIZE],
//    data_t weights[IN_SIZE][OUT_SIZE],
//    data_t biases[OUT_SIZE])
//{
//#pragma HLS INLINE off
//
//    for (int i = 0; i < OUT_SIZE; i++) {
//#pragma HLS PIPELINE II
//        data_t sum = 0.0f;
//        for (int j = 0; j < IN_SIZE; j++) {
//            sum += input[j] * weights[j][i];
//        }
//        sum += biases[i];
//        output[i] = (sum > 0.0f) ? sum : 0.0f;  // ReLU
//    }
//}


