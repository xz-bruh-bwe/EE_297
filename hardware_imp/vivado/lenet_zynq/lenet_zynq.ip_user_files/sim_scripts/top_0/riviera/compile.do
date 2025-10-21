transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vivado/lenet_zynq/lenet_zynq.cache/compile_simlib/riviera}
vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_dsp48_multadd_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_18
vlib riviera/floating_point_v7_1_15
vlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_10 -93  -incr \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93  -incr \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93  -incr \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93  -incr \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_18 -93  -incr \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_15 -93  -incr \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_15  -incr -v2k5 "+incdir+../../../../lenet_zynq.gen/sources_1/ip/top_0/drivers/top_v1_0/src" -l xbip_utils_v3_0_10 -l axi_utils_v2_0_6 -l xbip_pipe_v3_0_6 -l xbip_dsp48_wrapper_v3_0_4 -l xbip_dsp48_addsub_v3_0_6 -l xbip_dsp48_multadd_v3_0_6 -l xbip_bram18k_v3_0_6 -l mult_gen_v12_0_18 -l floating_point_v7_1_15 -l xil_defaultlib \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../lenet_zynq.gen/sources_1/ip/top_0/drivers/top_v1_0/src" -l xbip_utils_v3_0_10 -l axi_utils_v2_0_6 -l xbip_pipe_v3_0_6 -l xbip_dsp48_wrapper_v3_0_4 -l xbip_dsp48_addsub_v3_0_6 -l xbip_dsp48_multadd_v3_0_6 -l xbip_bram18k_v3_0_6 -l mult_gen_v12_0_18 -l floating_point_v7_1_15 -l xil_defaultlib \
"../../../ipstatic/hdl/verilog/top_c1.v" \
"../../../ipstatic/hdl/verilog/top_c1_padded_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_1.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_22_2.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_biases_ROM_Aem.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_0bkb.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_1cud.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_2dEe.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_3eOg.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_0_4fYi.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_0g8j.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_1hbi.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_2ibs.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_3jbC.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_1_4kbM.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_0lbW.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_1mb6.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_2ncg.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_3ocq.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_2_4pcA.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_0qcK.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_1rcU.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_2sc4.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_3tde.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_3_4udo.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_0vdy.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_1wdI.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_2xdS.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_3yd2.v" \
"../../../ipstatic/hdl/verilog/top_c1_Pipeline_VITIS_LOOP_28_3_VITIS_LOOP_29_4_VITIS_LOOP_30_5_conv1_weights_4_4zec.v" \
"../../../ipstatic/hdl/verilog/top_c2.v" \
"../../../ipstatic/hdl/verilog/top_c2_conv2_biases_ROM_AUTO_1R.v" \
"../../../ipstatic/hdl/verilog/top_c2_Pipeline_VITIS_LOOP_89_4_VITIS_LOOP_90_5_VITIS_LOOP_91_6.v" \
"../../../ipstatic/hdl/verilog/top_c2_Pipeline_VITIS_LOOP_89_4_VITIS_LOOP_90_5_VITIS_LOOP_91_6_conv2_weights_ROMBew.v" \
"../../../ipstatic/hdl/verilog/top_control_s_axi.v" \
"../../../ipstatic/hdl/verilog/top_f1.v" \
"../../../ipstatic/hdl/verilog/top_f1_Pipeline_VITIS_LOOP_138_1_VITIS_LOOP_139_2_VITIS_LOOP_140_3.v" \
"../../../ipstatic/hdl/verilog/top_fadd_32ns_32ns_32_5_full_dsp_1.v" \
"../../../ipstatic/hdl/verilog/top_fc3_biases_ROM_AUTO_1R.v" \
"../../../ipstatic/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_91_2.v" \
"../../../ipstatic/hdl/verilog/top_fc_120_84_Pipeline_VITIS_LOOP_91_2_fc2_weights_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_fc_120_84_s.v" \
"../../../ipstatic/hdl/verilog/top_fc_120_84_s_fc2_biases_ROM_AUTO_1R.v" \
"../../../ipstatic/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_91_2.v" \
"../../../ipstatic/hdl/verilog/top_fc_400_120_Pipeline_VITIS_LOOP_91_2_fc1_weights_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_fc_400_120_s.v" \
"../../../ipstatic/hdl/verilog/top_fc_400_120_s_fc1_biases_ROM_AUTO_1R.v" \
"../../../ipstatic/hdl/verilog/top_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../ipstatic/hdl/verilog/top_flow_control_loop_pipe_sequential_init.v" \
"../../../ipstatic/hdl/verilog/top_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../ipstatic/hdl/verilog/top_gmem_in_m_axi.v" \
"../../../ipstatic/hdl/verilog/top_gmem_out_m_axi.v" \
"../../../ipstatic/hdl/verilog/top_logits_RAM_AUTO_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_m1.v" \
"../../../ipstatic/hdl/verilog/top_m2.v" \
"../../../ipstatic/hdl/verilog/top_mac_muladd_4ns_9ns_10s_14_4_1.v" \
"../../../ipstatic/hdl/verilog/top_mac_muladd_5ns_10ns_11s_16_4_1.v" \
"../../../ipstatic/hdl/verilog/top_mul_5ns_11ns_15_1_1.v" \
"../../../ipstatic/hdl/verilog/top_mux_4_2_32_1_1.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_0_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_1_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_2_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_191_2_fc3_weights_3_RAM_1P_LUTRAM_1R1W.v" \
"../../../ipstatic/hdl/verilog/top_top_Pipeline_VITIS_LOOP_198_3.v" \
"../../../ipstatic/hdl/verilog/top.v" \
"../../../ipstatic/hdl/ip/top_fadd_32ns_32ns_32_5_full_dsp_1_ip.v" \
"../../../ipstatic/hdl/ip/top_fcmp_32ns_32ns_1_2_no_dsp_1_ip.v" \
"../../../ipstatic/hdl/ip/top_fmul_32ns_32ns_32_4_max_dsp_1_ip.v" \
"../../../../lenet_zynq.gen/sources_1/ip/top_0/sim/top_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

