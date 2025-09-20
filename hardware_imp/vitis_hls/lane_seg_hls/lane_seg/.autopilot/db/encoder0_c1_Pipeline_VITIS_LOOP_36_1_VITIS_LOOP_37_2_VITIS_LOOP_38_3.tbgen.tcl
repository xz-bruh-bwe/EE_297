set moduleName encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem_in int 32 regular {axi_master 0}  }
	{ sext_ln36 int 62 regular  }
	{ padded float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_1 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_2 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_3 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_4 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_5 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_6 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_7 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_8 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_9 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_10 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_11 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_12 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_13 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_14 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_15 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_16 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_17 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_18 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_19 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_20 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_21 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_22 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_23 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_24 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_25 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ padded_26 float 32 regular {array 5776 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "gmem_in", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "image_r","offset": { "type": "dynamic","port_name": "image_r","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln36", "interface" : "wire", "bitwidth" : 62, "direction" : "READONLY"} , 
 	{ "Name" : "padded", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_16", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_17", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_18", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_19", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_20", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_21", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_22", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_23", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_24", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_25", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "padded_26", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 161
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_in_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_in_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_in_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_in_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_in_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_in_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_in_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_in_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_in_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_in_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_in_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_in_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_gmem_in_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_in_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_in_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_in_BUSER sc_in sc_lv 1 signal 0 } 
	{ sext_ln36 sc_in sc_lv 62 signal 1 } 
	{ padded_address0 sc_out sc_lv 13 signal 2 } 
	{ padded_ce0 sc_out sc_logic 1 signal 2 } 
	{ padded_we0 sc_out sc_logic 1 signal 2 } 
	{ padded_d0 sc_out sc_lv 32 signal 2 } 
	{ padded_1_address0 sc_out sc_lv 13 signal 3 } 
	{ padded_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ padded_1_we0 sc_out sc_logic 1 signal 3 } 
	{ padded_1_d0 sc_out sc_lv 32 signal 3 } 
	{ padded_2_address0 sc_out sc_lv 13 signal 4 } 
	{ padded_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ padded_2_we0 sc_out sc_logic 1 signal 4 } 
	{ padded_2_d0 sc_out sc_lv 32 signal 4 } 
	{ padded_3_address0 sc_out sc_lv 13 signal 5 } 
	{ padded_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ padded_3_we0 sc_out sc_logic 1 signal 5 } 
	{ padded_3_d0 sc_out sc_lv 32 signal 5 } 
	{ padded_4_address0 sc_out sc_lv 13 signal 6 } 
	{ padded_4_ce0 sc_out sc_logic 1 signal 6 } 
	{ padded_4_we0 sc_out sc_logic 1 signal 6 } 
	{ padded_4_d0 sc_out sc_lv 32 signal 6 } 
	{ padded_5_address0 sc_out sc_lv 13 signal 7 } 
	{ padded_5_ce0 sc_out sc_logic 1 signal 7 } 
	{ padded_5_we0 sc_out sc_logic 1 signal 7 } 
	{ padded_5_d0 sc_out sc_lv 32 signal 7 } 
	{ padded_6_address0 sc_out sc_lv 13 signal 8 } 
	{ padded_6_ce0 sc_out sc_logic 1 signal 8 } 
	{ padded_6_we0 sc_out sc_logic 1 signal 8 } 
	{ padded_6_d0 sc_out sc_lv 32 signal 8 } 
	{ padded_7_address0 sc_out sc_lv 13 signal 9 } 
	{ padded_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ padded_7_we0 sc_out sc_logic 1 signal 9 } 
	{ padded_7_d0 sc_out sc_lv 32 signal 9 } 
	{ padded_8_address0 sc_out sc_lv 13 signal 10 } 
	{ padded_8_ce0 sc_out sc_logic 1 signal 10 } 
	{ padded_8_we0 sc_out sc_logic 1 signal 10 } 
	{ padded_8_d0 sc_out sc_lv 32 signal 10 } 
	{ padded_9_address0 sc_out sc_lv 13 signal 11 } 
	{ padded_9_ce0 sc_out sc_logic 1 signal 11 } 
	{ padded_9_we0 sc_out sc_logic 1 signal 11 } 
	{ padded_9_d0 sc_out sc_lv 32 signal 11 } 
	{ padded_10_address0 sc_out sc_lv 13 signal 12 } 
	{ padded_10_ce0 sc_out sc_logic 1 signal 12 } 
	{ padded_10_we0 sc_out sc_logic 1 signal 12 } 
	{ padded_10_d0 sc_out sc_lv 32 signal 12 } 
	{ padded_11_address0 sc_out sc_lv 13 signal 13 } 
	{ padded_11_ce0 sc_out sc_logic 1 signal 13 } 
	{ padded_11_we0 sc_out sc_logic 1 signal 13 } 
	{ padded_11_d0 sc_out sc_lv 32 signal 13 } 
	{ padded_12_address0 sc_out sc_lv 13 signal 14 } 
	{ padded_12_ce0 sc_out sc_logic 1 signal 14 } 
	{ padded_12_we0 sc_out sc_logic 1 signal 14 } 
	{ padded_12_d0 sc_out sc_lv 32 signal 14 } 
	{ padded_13_address0 sc_out sc_lv 13 signal 15 } 
	{ padded_13_ce0 sc_out sc_logic 1 signal 15 } 
	{ padded_13_we0 sc_out sc_logic 1 signal 15 } 
	{ padded_13_d0 sc_out sc_lv 32 signal 15 } 
	{ padded_14_address0 sc_out sc_lv 13 signal 16 } 
	{ padded_14_ce0 sc_out sc_logic 1 signal 16 } 
	{ padded_14_we0 sc_out sc_logic 1 signal 16 } 
	{ padded_14_d0 sc_out sc_lv 32 signal 16 } 
	{ padded_15_address0 sc_out sc_lv 13 signal 17 } 
	{ padded_15_ce0 sc_out sc_logic 1 signal 17 } 
	{ padded_15_we0 sc_out sc_logic 1 signal 17 } 
	{ padded_15_d0 sc_out sc_lv 32 signal 17 } 
	{ padded_16_address0 sc_out sc_lv 13 signal 18 } 
	{ padded_16_ce0 sc_out sc_logic 1 signal 18 } 
	{ padded_16_we0 sc_out sc_logic 1 signal 18 } 
	{ padded_16_d0 sc_out sc_lv 32 signal 18 } 
	{ padded_17_address0 sc_out sc_lv 13 signal 19 } 
	{ padded_17_ce0 sc_out sc_logic 1 signal 19 } 
	{ padded_17_we0 sc_out sc_logic 1 signal 19 } 
	{ padded_17_d0 sc_out sc_lv 32 signal 19 } 
	{ padded_18_address0 sc_out sc_lv 13 signal 20 } 
	{ padded_18_ce0 sc_out sc_logic 1 signal 20 } 
	{ padded_18_we0 sc_out sc_logic 1 signal 20 } 
	{ padded_18_d0 sc_out sc_lv 32 signal 20 } 
	{ padded_19_address0 sc_out sc_lv 13 signal 21 } 
	{ padded_19_ce0 sc_out sc_logic 1 signal 21 } 
	{ padded_19_we0 sc_out sc_logic 1 signal 21 } 
	{ padded_19_d0 sc_out sc_lv 32 signal 21 } 
	{ padded_20_address0 sc_out sc_lv 13 signal 22 } 
	{ padded_20_ce0 sc_out sc_logic 1 signal 22 } 
	{ padded_20_we0 sc_out sc_logic 1 signal 22 } 
	{ padded_20_d0 sc_out sc_lv 32 signal 22 } 
	{ padded_21_address0 sc_out sc_lv 13 signal 23 } 
	{ padded_21_ce0 sc_out sc_logic 1 signal 23 } 
	{ padded_21_we0 sc_out sc_logic 1 signal 23 } 
	{ padded_21_d0 sc_out sc_lv 32 signal 23 } 
	{ padded_22_address0 sc_out sc_lv 13 signal 24 } 
	{ padded_22_ce0 sc_out sc_logic 1 signal 24 } 
	{ padded_22_we0 sc_out sc_logic 1 signal 24 } 
	{ padded_22_d0 sc_out sc_lv 32 signal 24 } 
	{ padded_23_address0 sc_out sc_lv 13 signal 25 } 
	{ padded_23_ce0 sc_out sc_logic 1 signal 25 } 
	{ padded_23_we0 sc_out sc_logic 1 signal 25 } 
	{ padded_23_d0 sc_out sc_lv 32 signal 25 } 
	{ padded_24_address0 sc_out sc_lv 13 signal 26 } 
	{ padded_24_ce0 sc_out sc_logic 1 signal 26 } 
	{ padded_24_we0 sc_out sc_logic 1 signal 26 } 
	{ padded_24_d0 sc_out sc_lv 32 signal 26 } 
	{ padded_25_address0 sc_out sc_lv 13 signal 27 } 
	{ padded_25_ce0 sc_out sc_logic 1 signal 27 } 
	{ padded_25_we0 sc_out sc_logic 1 signal 27 } 
	{ padded_25_d0 sc_out sc_lv 32 signal 27 } 
	{ padded_26_address0 sc_out sc_lv 13 signal 28 } 
	{ padded_26_ce0 sc_out sc_logic 1 signal 28 } 
	{ padded_26_we0 sc_out sc_logic 1 signal 28 } 
	{ padded_26_d0 sc_out sc_lv 32 signal 28 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_in_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_in_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_in_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_in_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_in_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_in_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_in_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_in_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_in_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_in_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_in_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_in_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_in_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_in_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_in_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_in_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_in", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_in_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_in_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_in_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_in_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_in_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_in_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_in_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_in_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_in_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_in_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_in_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_in_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_in_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_in_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_in_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_in_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_in_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_in_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_in_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_in_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_in", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_in_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_in_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_in_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem_in", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_in_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_in_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_in_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_in_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_in_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_in", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_in_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_in_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_in", "role": "BUSER" }} , 
 	{ "name": "sext_ln36", "direction": "in", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "sext_ln36", "role": "default" }} , 
 	{ "name": "padded_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded", "role": "address0" }} , 
 	{ "name": "padded_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded", "role": "ce0" }} , 
 	{ "name": "padded_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded", "role": "we0" }} , 
 	{ "name": "padded_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded", "role": "d0" }} , 
 	{ "name": "padded_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_1", "role": "address0" }} , 
 	{ "name": "padded_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_1", "role": "ce0" }} , 
 	{ "name": "padded_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_1", "role": "we0" }} , 
 	{ "name": "padded_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_1", "role": "d0" }} , 
 	{ "name": "padded_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_2", "role": "address0" }} , 
 	{ "name": "padded_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_2", "role": "ce0" }} , 
 	{ "name": "padded_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_2", "role": "we0" }} , 
 	{ "name": "padded_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_2", "role": "d0" }} , 
 	{ "name": "padded_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_3", "role": "address0" }} , 
 	{ "name": "padded_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_3", "role": "ce0" }} , 
 	{ "name": "padded_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_3", "role": "we0" }} , 
 	{ "name": "padded_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_3", "role": "d0" }} , 
 	{ "name": "padded_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_4", "role": "address0" }} , 
 	{ "name": "padded_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_4", "role": "ce0" }} , 
 	{ "name": "padded_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_4", "role": "we0" }} , 
 	{ "name": "padded_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_4", "role": "d0" }} , 
 	{ "name": "padded_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_5", "role": "address0" }} , 
 	{ "name": "padded_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_5", "role": "ce0" }} , 
 	{ "name": "padded_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_5", "role": "we0" }} , 
 	{ "name": "padded_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_5", "role": "d0" }} , 
 	{ "name": "padded_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_6", "role": "address0" }} , 
 	{ "name": "padded_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_6", "role": "ce0" }} , 
 	{ "name": "padded_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_6", "role": "we0" }} , 
 	{ "name": "padded_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_6", "role": "d0" }} , 
 	{ "name": "padded_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_7", "role": "address0" }} , 
 	{ "name": "padded_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_7", "role": "ce0" }} , 
 	{ "name": "padded_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_7", "role": "we0" }} , 
 	{ "name": "padded_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_7", "role": "d0" }} , 
 	{ "name": "padded_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_8", "role": "address0" }} , 
 	{ "name": "padded_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_8", "role": "ce0" }} , 
 	{ "name": "padded_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_8", "role": "we0" }} , 
 	{ "name": "padded_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_8", "role": "d0" }} , 
 	{ "name": "padded_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_9", "role": "address0" }} , 
 	{ "name": "padded_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_9", "role": "ce0" }} , 
 	{ "name": "padded_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_9", "role": "we0" }} , 
 	{ "name": "padded_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_9", "role": "d0" }} , 
 	{ "name": "padded_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_10", "role": "address0" }} , 
 	{ "name": "padded_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_10", "role": "ce0" }} , 
 	{ "name": "padded_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_10", "role": "we0" }} , 
 	{ "name": "padded_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_10", "role": "d0" }} , 
 	{ "name": "padded_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_11", "role": "address0" }} , 
 	{ "name": "padded_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_11", "role": "ce0" }} , 
 	{ "name": "padded_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_11", "role": "we0" }} , 
 	{ "name": "padded_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_11", "role": "d0" }} , 
 	{ "name": "padded_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_12", "role": "address0" }} , 
 	{ "name": "padded_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_12", "role": "ce0" }} , 
 	{ "name": "padded_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_12", "role": "we0" }} , 
 	{ "name": "padded_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_12", "role": "d0" }} , 
 	{ "name": "padded_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_13", "role": "address0" }} , 
 	{ "name": "padded_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_13", "role": "ce0" }} , 
 	{ "name": "padded_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_13", "role": "we0" }} , 
 	{ "name": "padded_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_13", "role": "d0" }} , 
 	{ "name": "padded_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_14", "role": "address0" }} , 
 	{ "name": "padded_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_14", "role": "ce0" }} , 
 	{ "name": "padded_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_14", "role": "we0" }} , 
 	{ "name": "padded_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_14", "role": "d0" }} , 
 	{ "name": "padded_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_15", "role": "address0" }} , 
 	{ "name": "padded_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_15", "role": "ce0" }} , 
 	{ "name": "padded_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_15", "role": "we0" }} , 
 	{ "name": "padded_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_15", "role": "d0" }} , 
 	{ "name": "padded_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_16", "role": "address0" }} , 
 	{ "name": "padded_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_16", "role": "ce0" }} , 
 	{ "name": "padded_16_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_16", "role": "we0" }} , 
 	{ "name": "padded_16_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_16", "role": "d0" }} , 
 	{ "name": "padded_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_17", "role": "address0" }} , 
 	{ "name": "padded_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_17", "role": "ce0" }} , 
 	{ "name": "padded_17_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_17", "role": "we0" }} , 
 	{ "name": "padded_17_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_17", "role": "d0" }} , 
 	{ "name": "padded_18_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_18", "role": "address0" }} , 
 	{ "name": "padded_18_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_18", "role": "ce0" }} , 
 	{ "name": "padded_18_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_18", "role": "we0" }} , 
 	{ "name": "padded_18_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_18", "role": "d0" }} , 
 	{ "name": "padded_19_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_19", "role": "address0" }} , 
 	{ "name": "padded_19_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_19", "role": "ce0" }} , 
 	{ "name": "padded_19_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_19", "role": "we0" }} , 
 	{ "name": "padded_19_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_19", "role": "d0" }} , 
 	{ "name": "padded_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_20", "role": "address0" }} , 
 	{ "name": "padded_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_20", "role": "ce0" }} , 
 	{ "name": "padded_20_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_20", "role": "we0" }} , 
 	{ "name": "padded_20_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_20", "role": "d0" }} , 
 	{ "name": "padded_21_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_21", "role": "address0" }} , 
 	{ "name": "padded_21_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_21", "role": "ce0" }} , 
 	{ "name": "padded_21_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_21", "role": "we0" }} , 
 	{ "name": "padded_21_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_21", "role": "d0" }} , 
 	{ "name": "padded_22_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_22", "role": "address0" }} , 
 	{ "name": "padded_22_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_22", "role": "ce0" }} , 
 	{ "name": "padded_22_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_22", "role": "we0" }} , 
 	{ "name": "padded_22_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_22", "role": "d0" }} , 
 	{ "name": "padded_23_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_23", "role": "address0" }} , 
 	{ "name": "padded_23_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_23", "role": "ce0" }} , 
 	{ "name": "padded_23_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_23", "role": "we0" }} , 
 	{ "name": "padded_23_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_23", "role": "d0" }} , 
 	{ "name": "padded_24_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_24", "role": "address0" }} , 
 	{ "name": "padded_24_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_24", "role": "ce0" }} , 
 	{ "name": "padded_24_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_24", "role": "we0" }} , 
 	{ "name": "padded_24_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_24", "role": "d0" }} , 
 	{ "name": "padded_25_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_25", "role": "address0" }} , 
 	{ "name": "padded_25_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_25", "role": "ce0" }} , 
 	{ "name": "padded_25_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_25", "role": "we0" }} , 
 	{ "name": "padded_25_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_25", "role": "d0" }} , 
 	{ "name": "padded_26_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "padded_26", "role": "address0" }} , 
 	{ "name": "padded_26_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_26", "role": "ce0" }} , 
 	{ "name": "padded_26_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "padded_26", "role": "we0" }} , 
 	{ "name": "padded_26_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "padded_26", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "150541", "EstimateLatencyMax" : "150541",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem_in", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_in_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln36", "Type" : "None", "Direction" : "I"},
			{"Name" : "padded", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_18", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_19", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_20", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_21", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_22", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_23", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_24", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_25", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "padded_26", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_3ns_2_12_1_U36", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U37", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_3ns_2_12_1_U38", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_3ns_2_12_1_U39", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U40", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U41", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_7ns_7ns_7ns_13_4_1_U42", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3 {
		gmem_in {Type I LastRead 11 FirstWrite -1}
		sext_ln36 {Type I LastRead 0 FirstWrite -1}
		padded {Type O LastRead -1 FirstWrite 12}
		padded_1 {Type O LastRead -1 FirstWrite 12}
		padded_2 {Type O LastRead -1 FirstWrite 12}
		padded_3 {Type O LastRead -1 FirstWrite 12}
		padded_4 {Type O LastRead -1 FirstWrite 12}
		padded_5 {Type O LastRead -1 FirstWrite 12}
		padded_6 {Type O LastRead -1 FirstWrite 12}
		padded_7 {Type O LastRead -1 FirstWrite 12}
		padded_8 {Type O LastRead -1 FirstWrite 12}
		padded_9 {Type O LastRead -1 FirstWrite 12}
		padded_10 {Type O LastRead -1 FirstWrite 12}
		padded_11 {Type O LastRead -1 FirstWrite 12}
		padded_12 {Type O LastRead -1 FirstWrite 12}
		padded_13 {Type O LastRead -1 FirstWrite 12}
		padded_14 {Type O LastRead -1 FirstWrite 12}
		padded_15 {Type O LastRead -1 FirstWrite 12}
		padded_16 {Type O LastRead -1 FirstWrite 12}
		padded_17 {Type O LastRead -1 FirstWrite 12}
		padded_18 {Type O LastRead -1 FirstWrite 12}
		padded_19 {Type O LastRead -1 FirstWrite 12}
		padded_20 {Type O LastRead -1 FirstWrite 12}
		padded_21 {Type O LastRead -1 FirstWrite 12}
		padded_22 {Type O LastRead -1 FirstWrite 12}
		padded_23 {Type O LastRead -1 FirstWrite 12}
		padded_24 {Type O LastRead -1 FirstWrite 12}
		padded_25 {Type O LastRead -1 FirstWrite 12}
		padded_26 {Type O LastRead -1 FirstWrite 12}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "150541", "Max" : "150541"}
	, {"Name" : "Interval", "Min" : "150541", "Max" : "150541"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem_in_AWVALID VALID 1 1 }  { m_axi_gmem_in_AWREADY READY 0 1 }  { m_axi_gmem_in_AWADDR ADDR 1 64 }  { m_axi_gmem_in_AWID ID 1 1 }  { m_axi_gmem_in_AWLEN SIZE 1 32 }  { m_axi_gmem_in_AWSIZE BURST 1 3 }  { m_axi_gmem_in_AWBURST LOCK 1 2 }  { m_axi_gmem_in_AWLOCK CACHE 1 2 }  { m_axi_gmem_in_AWCACHE PROT 1 4 }  { m_axi_gmem_in_AWPROT QOS 1 3 }  { m_axi_gmem_in_AWQOS REGION 1 4 }  { m_axi_gmem_in_AWREGION USER 1 4 }  { m_axi_gmem_in_AWUSER DATA 1 1 }  { m_axi_gmem_in_WVALID VALID 1 1 }  { m_axi_gmem_in_WREADY READY 0 1 }  { m_axi_gmem_in_WDATA FIFONUM 1 32 }  { m_axi_gmem_in_WSTRB STRB 1 4 }  { m_axi_gmem_in_WLAST LAST 1 1 }  { m_axi_gmem_in_WID ID 1 1 }  { m_axi_gmem_in_WUSER DATA 1 1 }  { m_axi_gmem_in_ARVALID VALID 1 1 }  { m_axi_gmem_in_ARREADY READY 0 1 }  { m_axi_gmem_in_ARADDR ADDR 1 64 }  { m_axi_gmem_in_ARID ID 1 1 }  { m_axi_gmem_in_ARLEN SIZE 1 32 }  { m_axi_gmem_in_ARSIZE BURST 1 3 }  { m_axi_gmem_in_ARBURST LOCK 1 2 }  { m_axi_gmem_in_ARLOCK CACHE 1 2 }  { m_axi_gmem_in_ARCACHE PROT 1 4 }  { m_axi_gmem_in_ARPROT QOS 1 3 }  { m_axi_gmem_in_ARQOS REGION 1 4 }  { m_axi_gmem_in_ARREGION USER 1 4 }  { m_axi_gmem_in_ARUSER DATA 1 1 }  { m_axi_gmem_in_RVALID VALID 0 1 }  { m_axi_gmem_in_RREADY READY 1 1 }  { m_axi_gmem_in_RDATA FIFONUM 0 32 }  { m_axi_gmem_in_RLAST LAST 0 1 }  { m_axi_gmem_in_RID ID 0 1 }  { m_axi_gmem_in_RFIFONUM LEN 0 9 }  { m_axi_gmem_in_RUSER DATA 0 1 }  { m_axi_gmem_in_RRESP RESP 0 2 }  { m_axi_gmem_in_BVALID VALID 0 1 }  { m_axi_gmem_in_BREADY READY 1 1 }  { m_axi_gmem_in_BRESP RESP 0 2 }  { m_axi_gmem_in_BID ID 0 1 }  { m_axi_gmem_in_BUSER DATA 0 1 } } }
	sext_ln36 { ap_none {  { sext_ln36 in_data 0 62 } } }
	padded { ap_memory {  { padded_address0 mem_address 1 13 }  { padded_ce0 mem_ce 1 1 }  { padded_we0 mem_we 1 1 }  { padded_d0 mem_din 1 32 } } }
	padded_1 { ap_memory {  { padded_1_address0 mem_address 1 13 }  { padded_1_ce0 mem_ce 1 1 }  { padded_1_we0 mem_we 1 1 }  { padded_1_d0 mem_din 1 32 } } }
	padded_2 { ap_memory {  { padded_2_address0 mem_address 1 13 }  { padded_2_ce0 mem_ce 1 1 }  { padded_2_we0 mem_we 1 1 }  { padded_2_d0 mem_din 1 32 } } }
	padded_3 { ap_memory {  { padded_3_address0 mem_address 1 13 }  { padded_3_ce0 mem_ce 1 1 }  { padded_3_we0 mem_we 1 1 }  { padded_3_d0 mem_din 1 32 } } }
	padded_4 { ap_memory {  { padded_4_address0 mem_address 1 13 }  { padded_4_ce0 mem_ce 1 1 }  { padded_4_we0 mem_we 1 1 }  { padded_4_d0 mem_din 1 32 } } }
	padded_5 { ap_memory {  { padded_5_address0 mem_address 1 13 }  { padded_5_ce0 mem_ce 1 1 }  { padded_5_we0 mem_we 1 1 }  { padded_5_d0 mem_din 1 32 } } }
	padded_6 { ap_memory {  { padded_6_address0 mem_address 1 13 }  { padded_6_ce0 mem_ce 1 1 }  { padded_6_we0 mem_we 1 1 }  { padded_6_d0 mem_din 1 32 } } }
	padded_7 { ap_memory {  { padded_7_address0 mem_address 1 13 }  { padded_7_ce0 mem_ce 1 1 }  { padded_7_we0 mem_we 1 1 }  { padded_7_d0 mem_din 1 32 } } }
	padded_8 { ap_memory {  { padded_8_address0 mem_address 1 13 }  { padded_8_ce0 mem_ce 1 1 }  { padded_8_we0 mem_we 1 1 }  { padded_8_d0 mem_din 1 32 } } }
	padded_9 { ap_memory {  { padded_9_address0 mem_address 1 13 }  { padded_9_ce0 mem_ce 1 1 }  { padded_9_we0 mem_we 1 1 }  { padded_9_d0 mem_din 1 32 } } }
	padded_10 { ap_memory {  { padded_10_address0 mem_address 1 13 }  { padded_10_ce0 mem_ce 1 1 }  { padded_10_we0 mem_we 1 1 }  { padded_10_d0 mem_din 1 32 } } }
	padded_11 { ap_memory {  { padded_11_address0 mem_address 1 13 }  { padded_11_ce0 mem_ce 1 1 }  { padded_11_we0 mem_we 1 1 }  { padded_11_d0 mem_din 1 32 } } }
	padded_12 { ap_memory {  { padded_12_address0 mem_address 1 13 }  { padded_12_ce0 mem_ce 1 1 }  { padded_12_we0 mem_we 1 1 }  { padded_12_d0 mem_din 1 32 } } }
	padded_13 { ap_memory {  { padded_13_address0 mem_address 1 13 }  { padded_13_ce0 mem_ce 1 1 }  { padded_13_we0 mem_we 1 1 }  { padded_13_d0 mem_din 1 32 } } }
	padded_14 { ap_memory {  { padded_14_address0 mem_address 1 13 }  { padded_14_ce0 mem_ce 1 1 }  { padded_14_we0 mem_we 1 1 }  { padded_14_d0 mem_din 1 32 } } }
	padded_15 { ap_memory {  { padded_15_address0 mem_address 1 13 }  { padded_15_ce0 mem_ce 1 1 }  { padded_15_we0 mem_we 1 1 }  { padded_15_d0 mem_din 1 32 } } }
	padded_16 { ap_memory {  { padded_16_address0 mem_address 1 13 }  { padded_16_ce0 mem_ce 1 1 }  { padded_16_we0 mem_we 1 1 }  { padded_16_d0 mem_din 1 32 } } }
	padded_17 { ap_memory {  { padded_17_address0 mem_address 1 13 }  { padded_17_ce0 mem_ce 1 1 }  { padded_17_we0 mem_we 1 1 }  { padded_17_d0 mem_din 1 32 } } }
	padded_18 { ap_memory {  { padded_18_address0 mem_address 1 13 }  { padded_18_ce0 mem_ce 1 1 }  { padded_18_we0 mem_we 1 1 }  { padded_18_d0 mem_din 1 32 } } }
	padded_19 { ap_memory {  { padded_19_address0 mem_address 1 13 }  { padded_19_ce0 mem_ce 1 1 }  { padded_19_we0 mem_we 1 1 }  { padded_19_d0 mem_din 1 32 } } }
	padded_20 { ap_memory {  { padded_20_address0 mem_address 1 13 }  { padded_20_ce0 mem_ce 1 1 }  { padded_20_we0 mem_we 1 1 }  { padded_20_d0 mem_din 1 32 } } }
	padded_21 { ap_memory {  { padded_21_address0 mem_address 1 13 }  { padded_21_ce0 mem_ce 1 1 }  { padded_21_we0 mem_we 1 1 }  { padded_21_d0 mem_din 1 32 } } }
	padded_22 { ap_memory {  { padded_22_address0 mem_address 1 13 }  { padded_22_ce0 mem_ce 1 1 }  { padded_22_we0 mem_we 1 1 }  { padded_22_d0 mem_din 1 32 } } }
	padded_23 { ap_memory {  { padded_23_address0 mem_address 1 13 }  { padded_23_ce0 mem_ce 1 1 }  { padded_23_we0 mem_we 1 1 }  { padded_23_d0 mem_din 1 32 } } }
	padded_24 { ap_memory {  { padded_24_address0 mem_address 1 13 }  { padded_24_ce0 mem_ce 1 1 }  { padded_24_we0 mem_we 1 1 }  { padded_24_d0 mem_din 1 32 } } }
	padded_25 { ap_memory {  { padded_25_address0 mem_address 1 13 }  { padded_25_ce0 mem_ce 1 1 }  { padded_25_we0 mem_we 1 1 }  { padded_25_d0 mem_din 1 32 } } }
	padded_26 { ap_memory {  { padded_26_address0 mem_address 1 13 }  { padded_26_ce0 mem_ce 1 1 }  { padded_26_we0 mem_we 1 1 }  { padded_26_d0 mem_din 1 32 } } }
}
