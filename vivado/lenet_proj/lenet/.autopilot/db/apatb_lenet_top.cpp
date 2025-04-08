#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.lenet_top.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.lenet_top.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_image "../tv/cdatafile/c.lenet_top.autotvin_image_r.dat"
#define AUTOTB_TVOUT_image "../tv/cdatafile/c.lenet_top.autotvout_image_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_conv1_out "../tv/cdatafile/c.lenet_top.autotvin_conv1_out.dat"
#define AUTOTB_TVOUT_conv1_out "../tv/cdatafile/c.lenet_top.autotvout_conv1_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_pool1_out "../tv/cdatafile/c.lenet_top.autotvin_pool1_out.dat"
#define AUTOTB_TVOUT_pool1_out "../tv/cdatafile/c.lenet_top.autotvout_pool1_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_conv2_out "../tv/cdatafile/c.lenet_top.autotvin_conv2_out.dat"
#define AUTOTB_TVOUT_conv2_out "../tv/cdatafile/c.lenet_top.autotvout_conv2_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_pool2_out "../tv/cdatafile/c.lenet_top.autotvin_pool2_out.dat"
#define AUTOTB_TVOUT_pool2_out "../tv/cdatafile/c.lenet_top.autotvout_pool2_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_flat_out "../tv/cdatafile/c.lenet_top.autotvin_flat_out.dat"
#define AUTOTB_TVOUT_flat_out "../tv/cdatafile/c.lenet_top.autotvout_flat_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_fc1_out "../tv/cdatafile/c.lenet_top.autotvin_fc1_out.dat"
#define AUTOTB_TVOUT_fc1_out "../tv/cdatafile/c.lenet_top.autotvout_fc1_out.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.lenet_top.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_image "../tv/rtldatafile/rtl.lenet_top.autotvout_image_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_conv1_out "../tv/rtldatafile/rtl.lenet_top.autotvout_conv1_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pool1_out "../tv/rtldatafile/rtl.lenet_top.autotvout_pool1_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_conv2_out "../tv/rtldatafile/rtl.lenet_top.autotvout_conv2_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pool2_out "../tv/rtldatafile/rtl.lenet_top.autotvout_pool2_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_flat_out "../tv/rtldatafile/rtl.lenet_top.autotvout_flat_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fc1_out "../tv/rtldatafile/rtl.lenet_top.autotvout_fc1_out.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  image_depth = 0;
  conv1_out_depth = 0;
  pool1_out_depth = 0;
  conv2_out_depth = 0;
  pool2_out_depth = 0;
  flat_out_depth = 0;
  fc1_out_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{image_r " << image_depth << "}\n";
  total_list << "{conv1_out " << conv1_out_depth << "}\n";
  total_list << "{pool1_out " << pool1_out_depth << "}\n";
  total_list << "{conv2_out " << conv2_out_depth << "}\n";
  total_list << "{pool2_out " << pool2_out_depth << "}\n";
  total_list << "{flat_out " << flat_out_depth << "}\n";
  total_list << "{fc1_out " << fc1_out_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
  public:
    int gmem_depth;
    int image_depth;
    int conv1_out_depth;
    int pool1_out_depth;
    int conv2_out_depth;
    int pool2_out_depth;
    int flat_out_depth;
    int fc1_out_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void lenet_top_hw_stub(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_lenet_top_hw(volatile void * __xlx_apatb_param_image, volatile void * __xlx_apatb_param_conv1_out, volatile void * __xlx_apatb_param_pool1_out, volatile void * __xlx_apatb_param_conv2_out, volatile void * __xlx_apatb_param_pool2_out, volatile void * __xlx_apatb_param_flat_out, volatile void * __xlx_apatb_param_fc1_out) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > gmem_pc_buffer(9184);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 784; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_image)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 4704; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_conv1_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1176; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_pool1_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 1600; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_conv2_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 400; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_pool2_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 400; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_flat_out)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 120; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_fc1_out)[j] = gmem_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem
aesl_fh.touch(AUTOTB_TVIN_gmem);
aesl_fh.touch(AUTOTB_TVOUT_gmem);
//image
aesl_fh.touch(AUTOTB_TVIN_image);
aesl_fh.touch(AUTOTB_TVOUT_image);
//conv1_out
aesl_fh.touch(AUTOTB_TVIN_conv1_out);
aesl_fh.touch(AUTOTB_TVOUT_conv1_out);
//pool1_out
aesl_fh.touch(AUTOTB_TVIN_pool1_out);
aesl_fh.touch(AUTOTB_TVOUT_pool1_out);
//conv2_out
aesl_fh.touch(AUTOTB_TVIN_conv2_out);
aesl_fh.touch(AUTOTB_TVOUT_conv2_out);
//pool2_out
aesl_fh.touch(AUTOTB_TVIN_pool2_out);
aesl_fh.touch(AUTOTB_TVOUT_pool2_out);
//flat_out
aesl_fh.touch(AUTOTB_TVIN_flat_out);
aesl_fh.touch(AUTOTB_TVOUT_flat_out);
//fc1_out
aesl_fh.touch(AUTOTB_TVIN_fc1_out);
aesl_fh.touch(AUTOTB_TVOUT_fc1_out);
CodeState = DUMP_INPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_image) {
    for (int j = 0, e = 784; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_image)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_conv1_out) {
    for (int j = 0, e = 4704; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_conv1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_pool1_out) {
    for (int j = 0, e = 1176; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_pool1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_conv2_out) {
    for (int j = 0, e = 1600; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_conv2_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_pool2_out) {
    for (int j = 0, e = 400; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_pool2_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_flat_out) {
    for (int j = 0, e = 400; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_flat_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_fc1_out) {
    for (int j = 0, e = 120; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_fc1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(9184, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
// print image Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_image, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_image, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.image_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_image, __xlx_sprintf_buffer.data());
}
// print conv1_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_conv1_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_conv1_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.conv1_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_conv1_out, __xlx_sprintf_buffer.data());
}
// print pool1_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pool1_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_pool1_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.pool1_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pool1_out, __xlx_sprintf_buffer.data());
}
// print conv2_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_conv2_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_conv2_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.conv2_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_conv2_out, __xlx_sprintf_buffer.data());
}
// print pool2_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pool2_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_pool2_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.pool2_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pool2_out, __xlx_sprintf_buffer.data());
}
// print flat_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_flat_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_flat_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.flat_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_flat_out, __xlx_sprintf_buffer.data());
}
// print fc1_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fc1_out, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fc1_out, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.fc1_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fc1_out, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
lenet_top_hw_stub(__xlx_apatb_param_image, __xlx_apatb_param_conv1_out, __xlx_apatb_param_pool1_out, __xlx_apatb_param_conv2_out, __xlx_apatb_param_pool2_out, __xlx_apatb_param_flat_out, __xlx_apatb_param_fc1_out);
CodeState = DUMP_OUTPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_image) {
    for (int j = 0, e = 784; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_image)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_conv1_out) {
    for (int j = 0, e = 4704; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_conv1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_pool1_out) {
    for (int j = 0, e = 1176; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_pool1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_conv2_out) {
    for (int j = 0, e = 1600; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_conv2_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_pool2_out) {
    for (int j = 0, e = 400; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_pool2_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_flat_out) {
    for (int j = 0, e = 400; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_flat_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  if (__xlx_apatb_param_fc1_out) {
    for (int j = 0, e = 120; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_fc1_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(9184, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
