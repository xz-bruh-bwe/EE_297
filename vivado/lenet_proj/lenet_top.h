#ifndef LENET_TOP_H
#define LENET_TOP_H

#include "ap_fixed.h"

//typedef ap_fixed<32, 16> data_t;
typedef float data_t;

#define IMG_HEIGHT 28
#define IMG_WIDTH  28
#define OUT_CHANNELS 6
#define KERNEL_HEIGHT  5
#define KERNEL_WIDTH   5


#define FC1_IN  400
#define FC1_OUT 120
#define FC2_IN  120
#define FC2_OUT 84
#define FC3_IN  84
#define FC3_OUT 10

// Function declarations
void lenet_top(
    data_t image[IMG_HEIGHT][IMG_WIDTH],
    data_t conv1_out[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t pool1_out[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS],
    data_t conv2_out[10][10][16],
    data_t pool2_out[5][5][16],
    data_t flat_out[400]);  // Add this

void conv2d_layer(data_t input[IMG_HEIGHT][IMG_WIDTH],
    data_t output[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t weights[KERNEL_HEIGHT][KERNEL_WIDTH][1][OUT_CHANNELS],
    data_t biases[OUT_CHANNELS]);

// void avgpool_layer(...);
void maxpool_layer(
    data_t input[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t output[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS]);

// conv2d 
void conv2d_6to16_layer(
    data_t input[14][14][6],
    data_t output[10][10][16],
    data_t weights[5][5][6][16],
    data_t biases[16]);

void maxpool2_layer(
    data_t input[10][10][16],
    data_t output[5][5][16]);


void flatten_layer(
    data_t input[5][5][16],
    data_t output[400]);

    template<int IN_SIZE, int OUT_SIZE>
    void fc_layer(
        data_t input[IN_SIZE],
        data_t output[OUT_SIZE],
        data_t weights[IN_SIZE][OUT_SIZE],
        data_t biases[OUT_SIZE])
    {
    #pragma HLS INLINE off
    
        for (int i = 0; i < OUT_SIZE; i++) {
    #pragma HLS PIPELINE II
            data_t sum = 0.0f;
            for (int j = 0; j < IN_SIZE; j++) {
                sum += input[j] * weights[j][i];
            }
            sum += biases[i];
            output[i] = (sum > 0.0f) ? sum : 0.0f;  // ReLU
        }
    }

#endif