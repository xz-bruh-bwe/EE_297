#ifndef DEFINES_H_
#define DEFINES_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "nnet_utils/nnet_types.h"
#include <cstddef>
#include <cstdio>

// hls-fpga-machine-learning insert numbers
#define N_INPUT_1_1 1
#define N_LAYER_2 1
#define N_LAYER_2 1

// hls-fpga-machine-learning insert layer-precision
typedef ap_fixed<16,6> input_t;
typedef ap_fixed<16,6> model_default_t;
typedef ap_fixed<16,6> layer2_t;
typedef ap_uint<1> bias2_t;
typedef ap_uint<1> layer2_index;
typedef ap_fixed<16,6> result_t;
typedef ap_fixed<18,8> led_logic_table_t;

#endif
