############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lenet_proj_fp16
set_top lenet_top
add_files lenet_proj_fp16/sup16.cpp
add_files lenet_proj_fp16/tb16.cpp
add_files lenet_proj_fp16/top16.cpp
add_files lenet_proj_fp16/top16.h
open_solution "lenet_top_fp16" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 12.6 -name default
#source "./lenet_proj_fp16/lenet_top_fp16/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
