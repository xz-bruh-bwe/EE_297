vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_14
vlib questa_lib/msim/processing_system7_vip_v1_0_16
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/axi_utils_v2_0_6
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_18
vlib questa_lib/msim/floating_point_v7_1_15
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_28
vlib questa_lib/msim/fifo_generator_v13_2_8
vlib questa_lib/msim/axi_data_fifo_v2_1_27
vlib questa_lib/msim/axi_crossbar_v2_1_29
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_30
vlib questa_lib/msim/xlconstant_v1_1_7
vlib questa_lib/msim/axi_protocol_converter_v2_1_28
vlib questa_lib/msim/axi_clock_converter_v2_1_27
vlib questa_lib/msim/blk_mem_gen_v8_4_6
vlib questa_lib/msim/axi_dwidth_converter_v2_1_28

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_14 questa_lib/msim/axi_vip_v1_1_14
vmap processing_system7_vip_v1_0_16 questa_lib/msim/processing_system7_vip_v1_0_16
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 questa_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_18 questa_lib/msim/mult_gen_v12_0_18
vmap floating_point_v7_1_15 questa_lib/msim/floating_point_v7_1_15
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_28 questa_lib/msim/axi_register_slice_v2_1_28
vmap fifo_generator_v13_2_8 questa_lib/msim/fifo_generator_v13_2_8
vmap axi_data_fifo_v2_1_27 questa_lib/msim/axi_data_fifo_v2_1_27
vmap axi_crossbar_v2_1_29 questa_lib/msim/axi_crossbar_v2_1_29
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_30 questa_lib/msim/axi_gpio_v2_0_30
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7
vmap axi_protocol_converter_v2_1_28 questa_lib/msim/axi_protocol_converter_v2_1_28
vmap axi_clock_converter_v2_1_27 questa_lib/msim/axi_clock_converter_v2_1_27
vmap blk_mem_gen_v8_4_6 questa_lib/msim/blk_mem_gen_v8_4_6
vmap axi_dwidth_converter_v2_1_28 questa_lib/msim/axi_dwidth_converter_v2_1_28

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_14 -L processing_system7_vip_v1_0_16 -L xilinx_vip "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_14 -L processing_system7_vip_v1_0_16 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"Z:/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"Z:/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"Z:/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_14  -incr -mfcu  -sv -L axi_vip_v1_1_14 -L processing_system7_vip_v1_0_16 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ed63/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_16  -incr -mfcu  -sv -L axi_vip_v1_1_14 -L processing_system7_vip_v1_0_16 -L xilinx_vip "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_processing_system7_0_0/sim/lenet_bd_processing_system7_0_0.v" \

vcom -work xbip_utils_v3_0_10  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/5a54/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_18  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ab19/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_15  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/22f8/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_15  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/22f8/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_padded_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_22_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_biases_ROM_Aem.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_0bkb.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_1cud.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_2dEe.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_3eOg.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_4fYi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_0g8j.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_1hbi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_2ibs.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_3jbC.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_4kbM.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_0lbW.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_1mb6.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_2ncg.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_3ocq.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_4pcA.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_0qcK.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_1rcU.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_2sc4.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_3tde.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_4udo.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_0vdy.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_1wdI.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_2xdS.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_3yd2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_4zec.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c2_conv2_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c2_Pipeline_VITIS_LOOP_89_4_VITIS_LOOP_90_5_VITIS_LOOP_91_6.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_c2_Pipeline_VITIS_LOOP_89_4_VITIS_LOOP_90_5_VITIS_LOOP_91_6_conv2_weights_ROMBew.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_control_s_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_f1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_f1_Pipeline_VITIS_LOOP_138_1_VITIS_LOOP_139_2_VITIS_LOOP_140_3.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fadd_32ns_32ns_32_5_full_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc3_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_91_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_91_2_fc2_weights_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_120_84_s.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_120_84_s_fc2_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_91_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_91_2_fc1_weights_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_400_120_s.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fc_400_120_s_fc1_biases_ROM_AUTO_1R.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_flow_control_loop_pipe_sequential_init.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_gmem_in_m_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_gmem_out_m_axi.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_logits_RAM_AUTO_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_m1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_m2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_mac_muladd_4ns_9ns_10s_14_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_mac_muladd_5ns_10ns_11s_16_4_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_mul_5ns_11ns_15_1_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_mux_4_2_32_1_1.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_0_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_1_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_2_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_3_RAM_1P_LUTRAM_1R1W.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top_top_Pipeline_VITIS_LOOP_198_3.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/verilog/top.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/ip/top_fcmp_32ns_32ns_1_2_no_dsp_1_ip.v" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a04a/hdl/ip/top_fmul_32ns_32ns_32_4_max_dsp_1_ip.v" \
"../../../bd/lenet_bd/ip/lenet_bd_top_0_0/sim/lenet_bd_top_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_28  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/87d1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_8  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/c97d/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_8  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/c97d/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_8  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/c97d/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_27  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/fab7/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_29  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/f8f3/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_xbar_0/sim/lenet_bd_xbar_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_xbar_2/sim/lenet_bd_xbar_2.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/lenet_bd/ip/lenet_bd_proc_sys_reset_0_0/sim/lenet_bd_proc_sys_reset_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_30  -93  \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/18b7/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/lenet_bd/ip/lenet_bd_axi_gpio_0_0/sim/lenet_bd_axi_gpio_0_0.vhd" \

vlog -work xlconstant_v1_1_7  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/b0f2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_xlconstant_0_0/sim/lenet_bd_xlconstant_0_0.v" \
"../../../bd/lenet_bd/sim/lenet_bd.v" \
"../../../bd/lenet_bd/ip/lenet_bd_s00_regslice_0/sim/lenet_bd_s00_regslice_0.v" \

vlog -work axi_protocol_converter_v2_1_28  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/8c02/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/29db/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_6  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/bb55/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_28  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/08ae/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/ec67/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ipshared/aed8/hdl" "+incdir+../../../../lenet_zynq.gen/sources_1/bd/lenet_bd/ip/lenet_bd_top_0_0/drivers/top_v1_0/src" "+incdir+Z:/Xilinx/Vivado/2023.1/data/xilinx_vip/include" \
"../../../bd/lenet_bd/ip/lenet_bd_auto_us_0/sim/lenet_bd_auto_us_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_s01_regslice_0/sim/lenet_bd_s01_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_auto_us_1/sim/lenet_bd_auto_us_1.v" \
"../../../bd/lenet_bd/ip/lenet_bd_m00_regslice_0/sim/lenet_bd_m00_regslice_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_auto_pc_0/sim/lenet_bd_auto_pc_0.v" \
"../../../bd/lenet_bd/ip/lenet_bd_auto_pc_1/sim/lenet_bd_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

