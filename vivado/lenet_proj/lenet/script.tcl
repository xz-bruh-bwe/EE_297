############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lenet_proj
set_top lenet_top
add_files ../ML_PATH_EE297/EE297_env/projects/weights/conv1_biases.h
add_files ../ML_PATH_EE297/EE297_env/projects/weights/conv1_weights.h
add_files ../ML_PATH_EE297/EE297_env/projects/weights/conv2_biases.h
add_files ../ML_PATH_EE297/EE297_env/projects/weights/conv2_weights.h
add_files lenet_proj/img_5.txt
add_files lenet_proj/lenet_support.cpp
add_files lenet_proj/lenet_top.cpp
add_files lenet_proj/lenet_top.h
add_files -tb lenet_proj/lenet_top_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "lenet" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 12.6 -name default
source "./lenet_proj/lenet/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
