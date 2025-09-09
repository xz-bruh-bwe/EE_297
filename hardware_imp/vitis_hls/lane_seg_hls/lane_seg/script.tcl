############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project lane_seg_hls
set_top lane_seg_top
add_files lane_seg_hls/lane_seg_support.cpp
add_files lane_seg_hls/lane_seg_top.cpp
add_files lane_seg_hls/lane_seg_top.h
add_files -tb lane_seg_hls/lane_seg_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "lane_seg" -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 15 -name default
source "./lane_seg_hls/lane_seg/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
