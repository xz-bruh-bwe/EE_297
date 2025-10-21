vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_21
vlib questa_lib/msim/processing_system7_vip_v1_0_23
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_37
vlib questa_lib/msim/xlconstant_v1_1_10
vlib questa_lib/msim/generic_baseblocks_v2_1_2
vlib questa_lib/msim/axi_register_slice_v2_1_35
vlib questa_lib/msim/fifo_generator_v13_2_13
vlib questa_lib/msim/axi_data_fifo_v2_1_35
vlib questa_lib/msim/axi_crossbar_v2_1_37
vlib questa_lib/msim/xbip_utils_v3_0_14
vlib questa_lib/msim/axi_utils_v2_0_10
vlib questa_lib/msim/xbip_pipe_v3_0_10
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vlib questa_lib/msim/mult_gen_v12_0_23
vlib questa_lib/msim/floating_point_v7_1_20
vlib questa_lib/msim/axi_protocol_converter_v2_1_36
vlib questa_lib/msim/axi_clock_converter_v2_1_34
vlib questa_lib/msim/blk_mem_gen_v8_4_11
vlib questa_lib/msim/axi_dwidth_converter_v2_1_36

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_21 questa_lib/msim/axi_vip_v1_1_21
vmap processing_system7_vip_v1_0_23 questa_lib/msim/processing_system7_vip_v1_0_23
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 questa_lib/msim/axi_gpio_v2_0_37
vmap xlconstant_v1_1_10 questa_lib/msim/xlconstant_v1_1_10
vmap generic_baseblocks_v2_1_2 questa_lib/msim/generic_baseblocks_v2_1_2
vmap axi_register_slice_v2_1_35 questa_lib/msim/axi_register_slice_v2_1_35
vmap fifo_generator_v13_2_13 questa_lib/msim/fifo_generator_v13_2_13
vmap axi_data_fifo_v2_1_35 questa_lib/msim/axi_data_fifo_v2_1_35
vmap axi_crossbar_v2_1_37 questa_lib/msim/axi_crossbar_v2_1_37
vmap xbip_utils_v3_0_14 questa_lib/msim/xbip_utils_v3_0_14
vmap axi_utils_v2_0_10 questa_lib/msim/axi_utils_v2_0_10
vmap xbip_pipe_v3_0_10 questa_lib/msim/xbip_pipe_v3_0_10
vmap xbip_dsp48_wrapper_v3_0_7 questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vmap mult_gen_v12_0_23 questa_lib/msim/mult_gen_v12_0_23
vmap floating_point_v7_1_20 questa_lib/msim/floating_point_v7_1_20
vmap axi_protocol_converter_v2_1_36 questa_lib/msim/axi_protocol_converter_v2_1_36
vmap axi_clock_converter_v2_1_34 questa_lib/msim/axi_clock_converter_v2_1_34
vmap blk_mem_gen_v8_4_11 questa_lib/msim/blk_mem_gen_v8_4_11
vmap axi_dwidth_converter_v2_1_36 questa_lib/msim/axi_dwidth_converter_v2_1_36

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"Z:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"Z:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"Z:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_21  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/f16f/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_23  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_processing_system7_0_1/sim/lenet_bd_processing_system7_0_1.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/lenet_bd/ip/lenet_bd_rst_ps7_0_77M_0/sim/lenet_bd_rst_ps7_0_77M_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/lenet_bd/ip/lenet_bd_axi_gpio_0_0/sim/lenet_bd_axi_gpio_0_0.vhd" \

vlog -work xlconstant_v1_1_10  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_xlconstant_0_0/sim/lenet_bd_xlconstant_0_0.v" \

vlog -work generic_baseblocks_v2_1_2  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_35  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_13  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/dc46/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_13  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_13  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_35  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/4846/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_37  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a1a7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_interconnect_0_imp_xbar_0/sim/lenet_bd_axi_interconnect_0_imp_xbar_0.v" \
"../../../bd/lenet_bd/sim/lenet_bd.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_xbar_0/sim/lenet_bd_axi_ic_data_imp_xbar_0.v" \

vcom -work xbip_utils_v3_0_14  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_23  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_20  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip/sim/top_fadd_32ns_32ns_32_5_full_dsp_1_ip.vhd" \
"../../../bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fcmp_32ns_32ns_1_2_no_dsp_1_ip/sim/top_fcmp_32ns_32ns_1_2_no_dsp_1_ip.vhd" \
"../../../bd/lenet_bd/ip/lenet_bd_top_0_2/hdl/ip/top_fmul_32ns_32ns_32_4_max_dsp_1_ip/sim/top_fmul_32ns_32ns_32_4_max_dsp_1_ip.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_ama_addmuladd_3ns_4ns_9ns_9ns_13_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_padded_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_22_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_biases_ROM_bkb.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_0cud.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_1dEe.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_2eOg.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_3fYi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_4g8j.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_0hbi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_1ibs.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_2jbC.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_3kbM.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_4lbW.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_0mb6.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_1ncg.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_2ocq.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_3pcA.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_4qcK.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_0rcU.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_1sc4.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_2tde.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_3udo.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_4vdy.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_0wdI.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_1xdS.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_2yd2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_3zec.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_4Aem.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c2_conv2_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_c2_conv2_weights_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_control_s_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_f1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_f1_Pipeline_VITIS_LOOP_138_1_VITIS_LOOP_139_2_VITIS_LOOP_140_3.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fadd_32ns_32ns_32_5_full_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2_fc2_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2_fc2_weights_RAM_1P_LUTRAM_CeG.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_120_84_s.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2_fc1_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_88_1_VITIS_LOOP_91_2_fc1_weights_RAM_1P_LUTRAMBew.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fc_400_120_s.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_flow_control_loop_pipe_sequential_init.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_gmem_in_m_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_gmem_out_m_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_logits_RAM_AUTO_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_m1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_m2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_mac_muladd_7ns_7ns_7ns_14_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_mac_muladd_9ns_4ns_9ns_13_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_mac_muladd_10ns_5ns_10ns_15_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_mul_4ns_6ns_9_1_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_mul_5ns_11ns_15_1_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_sparsemux_9_2_32_1_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2_fc3_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2_fc3_weights_0_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2_fc3_weights_1_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2_fc3_weights_2_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_188_1_VITIS_LOOP_191_2_fc3_weights_3_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_top_Pipeline_VITIS_LOOP_198_3.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top_urem_4ns_3ns_4_8_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/e76e/hdl/verilog/top.v" \
"../../../bd/lenet_bd/ip/lenet_bd_top_0_2/sim/lenet_bd_top_0_2.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_ctrl_imp_s00_regslice_0/sim/lenet_bd_axi_ic_ctrl_imp_s00_regslice_0.v" \

vlog -work axi_protocol_converter_v2_1_36  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/f0b6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_ctrl_imp_auto_pc_0/sim/lenet_bd_axi_ic_ctrl_imp_auto_pc_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_ctrl_imp_m00_regslice_0/sim/lenet_bd_axi_ic_ctrl_imp_m00_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_ctrl_imp_m01_regslice_0/sim/lenet_bd_axi_ic_ctrl_imp_m01_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_s00_regslice_0/sim/lenet_bd_axi_ic_data_imp_s00_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_auto_pc_0/sim/lenet_bd_axi_ic_data_imp_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_34  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/9a28/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_11  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_36  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/db4c/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/6cfa/hdl" "+incdir+Z:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_2/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_auto_us_0/sim/lenet_bd_axi_ic_data_imp_auto_us_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_s01_regslice_0/sim/lenet_bd_axi_ic_data_imp_s01_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_auto_pc_1/sim/lenet_bd_axi_ic_data_imp_auto_pc_1.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_auto_us_1/sim/lenet_bd_axi_ic_data_imp_auto_us_1.v" \
"../../../bd/lenet_bd/ip/lenet_bd_axi_ic_data_imp_m00_regslice_0/sim/lenet_bd_axi_ic_data_imp_m00_regslice_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

