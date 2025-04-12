############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lenet_proj
set_top lenet_top
add_files lenet_proj/lenet_support.cpp
add_files lenet_proj/lenet_top.cpp
add_files lenet_proj/lenet_top.h
add_files -tb lenet_proj/lenet_top_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "lenet" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 12.6 -name default
config_export -format ip_catalog -output C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_top.zip -rtl verilog
source "./lenet_proj/lenet/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog -output Z:/export/lenet_top.zip
