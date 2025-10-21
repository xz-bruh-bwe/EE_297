#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void lenet_top(int*, int, int, int, int, int, int, int, int, int);
extern "C" void apatb_lenet_top_hw(volatile void * __xlx_apatb_param_image, volatile void * __xlx_apatb_param_conv1_out, volatile void * __xlx_apatb_param_pool1_out, volatile void * __xlx_apatb_param_conv2_out, volatile void * __xlx_apatb_param_pool2_out, volatile void * __xlx_apatb_param_flat_out, volatile void * __xlx_apatb_param_fc1_out, volatile void * __xlx_apatb_param_fc2_out, volatile void * __xlx_apatb_param_prediction) {
  // Collect __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec
  vector<sc_bv<32> >__xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec;
  for (int j = 0, e = 784; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_image)[j]);
  }
  int __xlx_size_param_image = 784;
  int __xlx_offset_param_image = 0;
  int __xlx_offset_byte_param_image = 0*4;
  for (int j = 0, e = 4704; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_conv1_out)[j]);
  }
  int __xlx_size_param_conv1_out = 4704;
  int __xlx_offset_param_conv1_out = 784;
  int __xlx_offset_byte_param_conv1_out = 784*4;
  for (int j = 0, e = 1176; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_pool1_out)[j]);
  }
  int __xlx_size_param_pool1_out = 1176;
  int __xlx_offset_param_pool1_out = 5488;
  int __xlx_offset_byte_param_pool1_out = 5488*4;
  for (int j = 0, e = 1600; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_conv2_out)[j]);
  }
  int __xlx_size_param_conv2_out = 1600;
  int __xlx_offset_param_conv2_out = 6664;
  int __xlx_offset_byte_param_conv2_out = 6664*4;
  for (int j = 0, e = 400; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_pool2_out)[j]);
  }
  int __xlx_size_param_pool2_out = 400;
  int __xlx_offset_param_pool2_out = 8264;
  int __xlx_offset_byte_param_pool2_out = 8264*4;
  for (int j = 0, e = 400; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_flat_out)[j]);
  }
  int __xlx_size_param_flat_out = 400;
  int __xlx_offset_param_flat_out = 8664;
  int __xlx_offset_byte_param_flat_out = 8664*4;
  for (int j = 0, e = 120; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_fc1_out)[j]);
  }
  int __xlx_size_param_fc1_out = 120;
  int __xlx_offset_param_fc1_out = 9064;
  int __xlx_offset_byte_param_fc1_out = 9064*4;
  for (int j = 0, e = 84; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_fc2_out)[j]);
  }
  int __xlx_size_param_fc2_out = 84;
  int __xlx_offset_param_fc2_out = 9184;
  int __xlx_offset_byte_param_fc2_out = 9184*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.push_back(((int*)__xlx_apatb_param_prediction)[j]);
  }
  int __xlx_size_param_prediction = 1;
  int __xlx_offset_param_prediction = 9268;
  int __xlx_offset_byte_param_prediction = 9268*4;
  int* __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer= new int[__xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.size()];
  for (int i = 0; i < __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec.size(); ++i) {
    __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  lenet_top(__xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer, __xlx_offset_byte_param_image, __xlx_offset_byte_param_conv1_out, __xlx_offset_byte_param_pool1_out, __xlx_offset_byte_param_conv2_out, __xlx_offset_byte_param_pool2_out, __xlx_offset_byte_param_flat_out, __xlx_offset_byte_param_fc1_out, __xlx_offset_byte_param_fc2_out, __xlx_offset_byte_param_prediction);
// print __xlx_apatb_param_image
  sc_bv<32>*__xlx_image_output_buffer = new sc_bv<32>[__xlx_size_param_image];
  for (int i = 0; i < __xlx_size_param_image; ++i) {
    __xlx_image_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_image];
  }
  for (int i = 0; i < __xlx_size_param_image; ++i) {
    ((int*)__xlx_apatb_param_image)[i] = __xlx_image_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_conv1_out
  sc_bv<32>*__xlx_conv1_out_output_buffer = new sc_bv<32>[__xlx_size_param_conv1_out];
  for (int i = 0; i < __xlx_size_param_conv1_out; ++i) {
    __xlx_conv1_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_conv1_out];
  }
  for (int i = 0; i < __xlx_size_param_conv1_out; ++i) {
    ((int*)__xlx_apatb_param_conv1_out)[i] = __xlx_conv1_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_pool1_out
  sc_bv<32>*__xlx_pool1_out_output_buffer = new sc_bv<32>[__xlx_size_param_pool1_out];
  for (int i = 0; i < __xlx_size_param_pool1_out; ++i) {
    __xlx_pool1_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_pool1_out];
  }
  for (int i = 0; i < __xlx_size_param_pool1_out; ++i) {
    ((int*)__xlx_apatb_param_pool1_out)[i] = __xlx_pool1_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_conv2_out
  sc_bv<32>*__xlx_conv2_out_output_buffer = new sc_bv<32>[__xlx_size_param_conv2_out];
  for (int i = 0; i < __xlx_size_param_conv2_out; ++i) {
    __xlx_conv2_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_conv2_out];
  }
  for (int i = 0; i < __xlx_size_param_conv2_out; ++i) {
    ((int*)__xlx_apatb_param_conv2_out)[i] = __xlx_conv2_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_pool2_out
  sc_bv<32>*__xlx_pool2_out_output_buffer = new sc_bv<32>[__xlx_size_param_pool2_out];
  for (int i = 0; i < __xlx_size_param_pool2_out; ++i) {
    __xlx_pool2_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_pool2_out];
  }
  for (int i = 0; i < __xlx_size_param_pool2_out; ++i) {
    ((int*)__xlx_apatb_param_pool2_out)[i] = __xlx_pool2_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_flat_out
  sc_bv<32>*__xlx_flat_out_output_buffer = new sc_bv<32>[__xlx_size_param_flat_out];
  for (int i = 0; i < __xlx_size_param_flat_out; ++i) {
    __xlx_flat_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_flat_out];
  }
  for (int i = 0; i < __xlx_size_param_flat_out; ++i) {
    ((int*)__xlx_apatb_param_flat_out)[i] = __xlx_flat_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_fc1_out
  sc_bv<32>*__xlx_fc1_out_output_buffer = new sc_bv<32>[__xlx_size_param_fc1_out];
  for (int i = 0; i < __xlx_size_param_fc1_out; ++i) {
    __xlx_fc1_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_fc1_out];
  }
  for (int i = 0; i < __xlx_size_param_fc1_out; ++i) {
    ((int*)__xlx_apatb_param_fc1_out)[i] = __xlx_fc1_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_fc2_out
  sc_bv<32>*__xlx_fc2_out_output_buffer = new sc_bv<32>[__xlx_size_param_fc2_out];
  for (int i = 0; i < __xlx_size_param_fc2_out; ++i) {
    __xlx_fc2_out_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_fc2_out];
  }
  for (int i = 0; i < __xlx_size_param_fc2_out; ++i) {
    ((int*)__xlx_apatb_param_fc2_out)[i] = __xlx_fc2_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_prediction
  sc_bv<32>*__xlx_prediction_output_buffer = new sc_bv<32>[__xlx_size_param_prediction];
  for (int i = 0; i < __xlx_size_param_prediction; ++i) {
    __xlx_prediction_output_buffer[i] = __xlx_image_conv1_out_pool1_out_conv2_out_pool2_out_flat_out_fc1_out_fc2_out_prediction__input_buffer[i+__xlx_offset_param_prediction];
  }
  for (int i = 0; i < __xlx_size_param_prediction; ++i) {
    ((int*)__xlx_apatb_param_prediction)[i] = __xlx_prediction_output_buffer[i].to_uint64();
  }
}
