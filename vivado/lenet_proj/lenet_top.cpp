#include "ap_fixed.h"
#include "hls_stream.h"
#include <math.h>
// Include Biases/Weights:
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\conv1_weights.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\conv1_biases.h"

#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\conv2_weights.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\conv2_biases.h"

#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc1_weights.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc1_biases.h"

#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc2_weights.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc2_biases.h"

#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc3_weights.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\projects\weights\fc3_biases.h"


// Include support files
#include "lenet_top.h"
//#include "lenet_support.cpp"

// Types
//typedef ap_fixed<32, 16> data_t;
typedef float data_t;

// ─────────────────────────────────────────────
// Top-Level Function (HLS entry point)
void lenet_top(
    data_t image[IMG_HEIGHT][IMG_WIDTH],
    data_t conv1_out[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS],
    data_t pool1_out[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS],
    data_t conv2_out[10][10][16], 
    data_t pool2_out[5][5][16],
    data_t flat_out[400],
    data_t fc1_out[120])  {// (New output for conv)

#pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem

#pragma HLS INTERFACE m_axi port=conv1_out offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=pool1_out offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=conv2_out offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=pool2_out offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=flat_out offset=slave bundle=gmem
#pragma HLS INTERFACE m_axi port=fc1_out offset=slave bundle=gmem

#pragma HLS INTERFACE s_axilite port=image bundle=control
#pragma HLS INTERFACE s_axilite port=conv1_out bundle=control
#pragma HLS INTERFACE s_axilite port=pool1_out bundle=control
#pragma HLS INTERFACE s_axilite port=conv2_out bundle=control
#pragma HLS INTERFACE s_axilite port=pool2_out bundle=control
#pragma HLS INTERFACE s_axilite port=flat_out bundle=control
#pragma HLS INTERFACE s_axilite port=fc1_out bundle=control

#pragma HLS INTERFACE s_axilite port=return bundle=control



    // Call the first Conv2D layer
    conv2d_layer(image, conv1_out, conv1_weights, conv1_biases);

    //Call the second layer
    maxpool_layer(conv1_out, pool1_out);

    // Call the third layer
    conv2d_6to16_layer(pool1_out, conv2_out, conv2_weights, conv2_biases);

    // Call the fourth layer
    maxpool2_layer(conv2_out, pool2_out);

    // Call the fifth layer
    flatten_layer(pool2_out, flat_out);

    // Call the 6th Layer
    fc_layer<400, 120>(flat_out, fc1_out, fc1_weights, fc1_biases);




}
