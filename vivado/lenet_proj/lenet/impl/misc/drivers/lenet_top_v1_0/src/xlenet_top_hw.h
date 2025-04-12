// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of image_r
//        bit 31~0 - image_r[31:0] (Read/Write)
// 0x14 : Data signal of image_r
//        bit 31~0 - image_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of conv1_out
//        bit 31~0 - conv1_out[31:0] (Read/Write)
// 0x20 : Data signal of conv1_out
//        bit 31~0 - conv1_out[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of pool1_out
//        bit 31~0 - pool1_out[31:0] (Read/Write)
// 0x2c : Data signal of pool1_out
//        bit 31~0 - pool1_out[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of conv2_out
//        bit 31~0 - conv2_out[31:0] (Read/Write)
// 0x38 : Data signal of conv2_out
//        bit 31~0 - conv2_out[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of pool2_out
//        bit 31~0 - pool2_out[31:0] (Read/Write)
// 0x44 : Data signal of pool2_out
//        bit 31~0 - pool2_out[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of flat_out
//        bit 31~0 - flat_out[31:0] (Read/Write)
// 0x50 : Data signal of flat_out
//        bit 31~0 - flat_out[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of fc1_out
//        bit 31~0 - fc1_out[31:0] (Read/Write)
// 0x5c : Data signal of fc1_out
//        bit 31~0 - fc1_out[63:32] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of fc2_out
//        bit 31~0 - fc2_out[31:0] (Read/Write)
// 0x68 : Data signal of fc2_out
//        bit 31~0 - fc2_out[63:32] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of prediction
//        bit 31~0 - prediction[31:0] (Read/Write)
// 0x74 : Data signal of prediction
//        bit 31~0 - prediction[63:32] (Read/Write)
// 0x78 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XLENET_TOP_CONTROL_ADDR_AP_CTRL         0x00
#define XLENET_TOP_CONTROL_ADDR_GIE             0x04
#define XLENET_TOP_CONTROL_ADDR_IER             0x08
#define XLENET_TOP_CONTROL_ADDR_ISR             0x0c
#define XLENET_TOP_CONTROL_ADDR_IMAGE_R_DATA    0x10
#define XLENET_TOP_CONTROL_BITS_IMAGE_R_DATA    64
#define XLENET_TOP_CONTROL_ADDR_CONV1_OUT_DATA  0x1c
#define XLENET_TOP_CONTROL_BITS_CONV1_OUT_DATA  64
#define XLENET_TOP_CONTROL_ADDR_POOL1_OUT_DATA  0x28
#define XLENET_TOP_CONTROL_BITS_POOL1_OUT_DATA  64
#define XLENET_TOP_CONTROL_ADDR_CONV2_OUT_DATA  0x34
#define XLENET_TOP_CONTROL_BITS_CONV2_OUT_DATA  64
#define XLENET_TOP_CONTROL_ADDR_POOL2_OUT_DATA  0x40
#define XLENET_TOP_CONTROL_BITS_POOL2_OUT_DATA  64
#define XLENET_TOP_CONTROL_ADDR_FLAT_OUT_DATA   0x4c
#define XLENET_TOP_CONTROL_BITS_FLAT_OUT_DATA   64
#define XLENET_TOP_CONTROL_ADDR_FC1_OUT_DATA    0x58
#define XLENET_TOP_CONTROL_BITS_FC1_OUT_DATA    64
#define XLENET_TOP_CONTROL_ADDR_FC2_OUT_DATA    0x64
#define XLENET_TOP_CONTROL_BITS_FC2_OUT_DATA    64
#define XLENET_TOP_CONTROL_ADDR_PREDICTION_DATA 0x70
#define XLENET_TOP_CONTROL_BITS_PREDICTION_DATA 64

