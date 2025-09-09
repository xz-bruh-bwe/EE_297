// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
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
// 0x70 : Data signal of prediction_reg
//        bit 31~0 - prediction_reg[31:0] (Read)
// 0x74 : Control signal of prediction_reg
//        bit 0  - prediction_reg_ap_vld (Read/COR)
//        others - reserved
// 0x80 : Data signal of ctrl
//        bit 31~0 - ctrl[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of status_i
//        bit 31~0 - status_i[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of status_o
//        bit 31~0 - status_o[31:0] (Read)
// 0x94 : Control signal of status_o
//        bit 0  - status_o_ap_vld (Read/COR)
//        others - reserved
// 0x98 : Data signal of magic
//        bit 31~0 - magic[31:0] (Read)
// 0x9c : Control signal of magic
//        bit 0  - magic_ap_vld (Read/COR)
//        others - reserved
// 0xa8 : Data signal of bytes_rd
//        bit 31~0 - bytes_rd[31:0] (Read)
// 0xac : Control signal of bytes_rd
//        bit 0  - bytes_rd_ap_vld (Read/COR)
//        others - reserved
// 0xb8 : Data signal of bytes_wr
//        bit 31~0 - bytes_wr[31:0] (Read)
// 0xbc : Control signal of bytes_wr
//        bit 0  - bytes_wr_ap_vld (Read/COR)
//        others - reserved
// 0xc8 : Data signal of cycle_count
//        bit 31~0 - cycle_count[31:0] (Read)
// 0xcc : Control signal of cycle_count
//        bit 0  - cycle_count_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTOP_CONTROL_ADDR_AP_CTRL             0x00
#define XTOP_CONTROL_ADDR_GIE                 0x04
#define XTOP_CONTROL_ADDR_IER                 0x08
#define XTOP_CONTROL_ADDR_ISR                 0x0c
#define XTOP_CONTROL_ADDR_IMAGE_R_DATA        0x10
#define XTOP_CONTROL_BITS_IMAGE_R_DATA        64
#define XTOP_CONTROL_ADDR_CONV1_OUT_DATA      0x1c
#define XTOP_CONTROL_BITS_CONV1_OUT_DATA      64
#define XTOP_CONTROL_ADDR_POOL1_OUT_DATA      0x28
#define XTOP_CONTROL_BITS_POOL1_OUT_DATA      64
#define XTOP_CONTROL_ADDR_CONV2_OUT_DATA      0x34
#define XTOP_CONTROL_BITS_CONV2_OUT_DATA      64
#define XTOP_CONTROL_ADDR_POOL2_OUT_DATA      0x40
#define XTOP_CONTROL_BITS_POOL2_OUT_DATA      64
#define XTOP_CONTROL_ADDR_FLAT_OUT_DATA       0x4c
#define XTOP_CONTROL_BITS_FLAT_OUT_DATA       64
#define XTOP_CONTROL_ADDR_FC1_OUT_DATA        0x58
#define XTOP_CONTROL_BITS_FC1_OUT_DATA        64
#define XTOP_CONTROL_ADDR_FC2_OUT_DATA        0x64
#define XTOP_CONTROL_BITS_FC2_OUT_DATA        64
#define XTOP_CONTROL_ADDR_PREDICTION_REG_DATA 0x70
#define XTOP_CONTROL_BITS_PREDICTION_REG_DATA 32
#define XTOP_CONTROL_ADDR_PREDICTION_REG_CTRL 0x74
#define XTOP_CONTROL_ADDR_CTRL_DATA           0x80
#define XTOP_CONTROL_BITS_CTRL_DATA           32
#define XTOP_CONTROL_ADDR_STATUS_I_DATA       0x88
#define XTOP_CONTROL_BITS_STATUS_I_DATA       32
#define XTOP_CONTROL_ADDR_STATUS_O_DATA       0x90
#define XTOP_CONTROL_BITS_STATUS_O_DATA       32
#define XTOP_CONTROL_ADDR_STATUS_O_CTRL       0x94
#define XTOP_CONTROL_ADDR_MAGIC_DATA          0x98
#define XTOP_CONTROL_BITS_MAGIC_DATA          32
#define XTOP_CONTROL_ADDR_MAGIC_CTRL          0x9c
#define XTOP_CONTROL_ADDR_BYTES_RD_DATA       0xa8
#define XTOP_CONTROL_BITS_BYTES_RD_DATA       32
#define XTOP_CONTROL_ADDR_BYTES_RD_CTRL       0xac
#define XTOP_CONTROL_ADDR_BYTES_WR_DATA       0xb8
#define XTOP_CONTROL_BITS_BYTES_WR_DATA       32
#define XTOP_CONTROL_ADDR_BYTES_WR_CTRL       0xbc
#define XTOP_CONTROL_ADDR_CYCLE_COUNT_DATA    0xc8
#define XTOP_CONTROL_BITS_CYCLE_COUNT_DATA    32
#define XTOP_CONTROL_ADDR_CYCLE_COUNT_CTRL    0xcc

