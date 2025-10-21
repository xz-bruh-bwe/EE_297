transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+lenet_bd  -L xil_defaultlib -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_21 -L processing_system7_vip_v1_0_23 -L proc_sys_reset_v5_0_17 -L axi_lite_ipif_v3_0_4 -L interrupt_control_v3_1_5 -L axi_gpio_v2_0_37 -L xlconstant_v1_1_10 -L generic_baseblocks_v2_1_2 -L axi_register_slice_v2_1_35 -L fifo_generator_v13_2_13 -L axi_data_fifo_v2_1_35 -L axi_crossbar_v2_1_37 -L xbip_utils_v3_0_14 -L axi_utils_v2_0_10 -L xbip_pipe_v3_0_10 -L xbip_dsp48_wrapper_v3_0_7 -L mult_gen_v12_0_23 -L floating_point_v7_1_20 -L axi_protocol_converter_v2_1_36 -L axi_clock_converter_v2_1_34 -L blk_mem_gen_v8_4_11 -L axi_dwidth_converter_v2_1_36 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.lenet_bd xil_defaultlib.glbl

do {lenet_bd.udo}

run 1000ns

endsim

quit -force
