set moduleName lenet_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {lenet_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem int 32 regular {axi_master 2}  }
	{ image_r int 64 regular {axi_slave 0}  }
	{ conv1_out int 64 regular {axi_slave 0}  }
	{ pool1_out int 64 regular {axi_slave 0}  }
	{ conv2_out int 64 regular {axi_slave 0}  }
	{ pool2_out int 64 regular {axi_slave 0}  }
	{ flat_out int 64 regular {axi_slave 0}  }
	{ fc1_out int 64 regular {axi_slave 0}  }
	{ fc2_out int 64 regular {axi_slave 0}  }
	{ prediction int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "image","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "image_r","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 783,"step" : 1}]},{"cName": "conv1_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "conv1_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 4703,"step" : 1}]},{"cName": "pool1_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "pool1_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 1175,"step" : 1}]},{"cName": "conv2_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "conv2_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 1599,"step" : 1}]},{"cName": "pool2_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "pool2_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 399,"step" : 1}]},{"cName": "flat_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "flat_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 399,"step" : 1}]},{"cName": "fc1_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "fc1_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 119,"step" : 1}]},{"cName": "fc2_out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "fc2_out","bundle": "control"},"direction": "READWRITE","cArray": [{"low" : 0,"up" : 83,"step" : 1}]},{"cName": "prediction","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "prediction","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "image_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "conv1_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "pool1_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "conv2_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "pool2_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":75}} , 
 	{ "Name" : "flat_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":76}, "offset_end" : {"in":87}} , 
 	{ "Name" : "fc1_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":99}} , 
 	{ "Name" : "fc2_out", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":100}, "offset_end" : {"in":111}} , 
 	{ "Name" : "prediction", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":112}, "offset_end" : {"in":123}} ]}
# RTL Port declarations: 
set portNum 65
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 0 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"lenet_top","role":"start","value":"0","valid_bit":"0"},{"name":"lenet_top","role":"continue","value":"0","valid_bit":"4"},{"name":"lenet_top","role":"auto_start","value":"0","valid_bit":"7"},{"name":"image_r","role":"data","value":"16"},{"name":"conv1_out","role":"data","value":"28"},{"name":"pool1_out","role":"data","value":"40"},{"name":"conv2_out","role":"data","value":"52"},{"name":"pool2_out","role":"data","value":"64"},{"name":"flat_out","role":"data","value":"76"},{"name":"fc1_out","role":"data","value":"88"},{"name":"fc2_out","role":"data","value":"100"},{"name":"prediction","role":"data","value":"112"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"lenet_top","role":"start","value":"0","valid_bit":"0"},{"name":"lenet_top","role":"done","value":"0","valid_bit":"1"},{"name":"lenet_top","role":"idle","value":"0","valid_bit":"2"},{"name":"lenet_top","role":"ready","value":"0","valid_bit":"3"},{"name":"lenet_top","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "12", "86", "94", "96", "103", "109", "115"],
		"CDFG" : "lenet_top",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1672456", "EstimateLatencyMax" : "1672456",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state16", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fc3_layer_fu_206"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv2d_layer_fu_222"},
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_maxpool_layer_fu_284"},
			{"State" : "ap_ST_fsm_state8", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_maxpool2_layer_fu_292"},
			{"State" : "ap_ST_fsm_state6", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_conv2d_6to16_layer_fu_300"},
			{"State" : "ap_ST_fsm_state14", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fc_layer_120_84_s_fu_312"},
			{"State" : "ap_ST_fsm_state12", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fc_layer_400_120_s_fu_324"},
			{"State" : "ap_ST_fsm_state10", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_flatten_layer_fu_336"}],
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_fc_layer_400_120_s_fu_324", "Port" : "gmem"},
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "gmem"},
					{"ID" : "86", "SubInstance" : "grp_maxpool_layer_fu_284", "Port" : "gmem"},
					{"ID" : "96", "SubInstance" : "grp_conv2d_6to16_layer_fu_300", "Port" : "gmem"},
					{"ID" : "115", "SubInstance" : "grp_flatten_layer_fu_336", "Port" : "gmem"},
					{"ID" : "103", "SubInstance" : "grp_fc_layer_120_84_s_fu_312", "Port" : "gmem"},
					{"ID" : "94", "SubInstance" : "grp_maxpool2_layer_fu_292", "Port" : "gmem"},
					{"ID" : "3", "SubInstance" : "grp_fc3_layer_fu_206", "Port" : "gmem"}]},
			{"Name" : "image_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv1_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "pool1_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv2_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "pool2_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "flat_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "fc1_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "fc2_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "prediction", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv1_biases", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_biases"}]},
			{"Name" : "conv1_weights_0_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_0_0_0"}]},
			{"Name" : "conv1_weights_0_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_0_1_0"}]},
			{"Name" : "conv1_weights_0_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_0_2_0"}]},
			{"Name" : "conv1_weights_0_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_0_3_0"}]},
			{"Name" : "conv1_weights_0_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_0_4_0"}]},
			{"Name" : "conv1_weights_1_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_1_0_0"}]},
			{"Name" : "conv1_weights_1_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_1_1_0"}]},
			{"Name" : "conv1_weights_1_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_1_2_0"}]},
			{"Name" : "conv1_weights_1_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_1_3_0"}]},
			{"Name" : "conv1_weights_1_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_1_4_0"}]},
			{"Name" : "conv1_weights_2_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_2_0_0"}]},
			{"Name" : "conv1_weights_2_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_2_1_0"}]},
			{"Name" : "conv1_weights_2_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_2_2_0"}]},
			{"Name" : "conv1_weights_2_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_2_3_0"}]},
			{"Name" : "conv1_weights_2_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_2_4_0"}]},
			{"Name" : "conv1_weights_3_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_3_0_0"}]},
			{"Name" : "conv1_weights_3_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_3_1_0"}]},
			{"Name" : "conv1_weights_3_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_3_2_0"}]},
			{"Name" : "conv1_weights_3_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_3_3_0"}]},
			{"Name" : "conv1_weights_3_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_3_4_0"}]},
			{"Name" : "conv1_weights_4_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_4_0_0"}]},
			{"Name" : "conv1_weights_4_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_4_1_0"}]},
			{"Name" : "conv1_weights_4_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_4_2_0"}]},
			{"Name" : "conv1_weights_4_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_4_3_0"}]},
			{"Name" : "conv1_weights_4_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_conv2d_layer_fu_222", "Port" : "conv1_weights_4_4_0"}]},
			{"Name" : "conv2_weights", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "96", "SubInstance" : "grp_conv2d_6to16_layer_fu_300", "Port" : "conv2_weights"}]},
			{"Name" : "conv2_biases", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "96", "SubInstance" : "grp_conv2d_6to16_layer_fu_300", "Port" : "conv2_biases"}]},
			{"Name" : "fc1_biases", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_fc_layer_400_120_s_fu_324", "Port" : "fc1_biases"}]},
			{"Name" : "fc1_weights", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "grp_fc_layer_400_120_s_fu_324", "Port" : "fc1_weights"}]},
			{"Name" : "fc2_biases", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "103", "SubInstance" : "grp_fc_layer_120_84_s_fu_312", "Port" : "fc2_biases"}]},
			{"Name" : "fc2_weights", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "103", "SubInstance" : "grp_fc_layer_120_84_s_fu_312", "Port" : "fc2_weights"}]},
			{"Name" : "fc3_biases", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fc3_layer_fu_206", "Port" : "fc3_biases"}]},
			{"Name" : "fc3_weights_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fc3_layer_fu_206", "Port" : "fc3_weights_0"}]},
			{"Name" : "fc3_weights_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fc3_layer_fu_206", "Port" : "fc3_weights_1"}]},
			{"Name" : "fc3_weights_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_fc3_layer_fu_206", "Port" : "fc3_weights_2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9", "10", "11"],
		"CDFG" : "fc3_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1219", "EstimateLatencyMax" : "1219",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "fc3_input", "Type" : "None", "Direction" : "I"},
			{"Name" : "predicted_class", "Type" : "None", "Direction" : "I"},
			{"Name" : "fc3_biases", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fc3_weights_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fc3_weights_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fc3_weights_2", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fc3_biases_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fc3_weights_0_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fc3_weights_1_U", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fc3_weights_2_U", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.logits_U", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fadd_32ns_32ns_32_5_full_dsp_1_U113", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fmul_32ns_32ns_32_4_max_dsp_1_U114", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc3_layer_fu_206.fcmp_32ns_32ns_1_2_no_dsp_1_U115", "Parent" : "3"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222", "Parent" : "0", "Child" : ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85"],
		"CDFG" : "conv2d_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "119549", "EstimateLatencyMax" : "119549",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv1_biases", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_0_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_0_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_0_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_0_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_0_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_1_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_1_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_1_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_1_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_1_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_2_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_2_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_2_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_2_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_2_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_3_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_3_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_3_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_3_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_3_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_4_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_4_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_4_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_4_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv1_weights_4_4_0", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_biases_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_0_0_0_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_0_1_0_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_0_2_0_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_0_3_0_U", "Parent" : "12"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_0_4_0_U", "Parent" : "12"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_1_0_0_U", "Parent" : "12"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_1_1_0_U", "Parent" : "12"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_1_2_0_U", "Parent" : "12"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_1_3_0_U", "Parent" : "12"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_1_4_0_U", "Parent" : "12"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_2_0_0_U", "Parent" : "12"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_2_1_0_U", "Parent" : "12"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_2_2_0_U", "Parent" : "12"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_2_3_0_U", "Parent" : "12"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_2_4_0_U", "Parent" : "12"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_3_0_0_U", "Parent" : "12"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_3_1_0_U", "Parent" : "12"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_3_2_0_U", "Parent" : "12"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_3_3_0_U", "Parent" : "12"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_3_4_0_U", "Parent" : "12"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_4_0_0_U", "Parent" : "12"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_4_1_0_U", "Parent" : "12"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_4_2_0_U", "Parent" : "12"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_4_3_0_U", "Parent" : "12"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.conv1_weights_4_4_0_U", "Parent" : "12"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_0_0_U", "Parent" : "12"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_0_1_U", "Parent" : "12"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_0_2_U", "Parent" : "12"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_0_3_U", "Parent" : "12"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_1_0_U", "Parent" : "12"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_1_1_U", "Parent" : "12"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_1_2_U", "Parent" : "12"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_1_3_U", "Parent" : "12"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_2_0_U", "Parent" : "12"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_2_1_U", "Parent" : "12"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_2_2_U", "Parent" : "12"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_2_3_U", "Parent" : "12"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_3_0_U", "Parent" : "12"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_3_1_U", "Parent" : "12"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_3_2_U", "Parent" : "12"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.padded_3_3_U", "Parent" : "12"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "12"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "12"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.fmul_32ns_32ns_32_4_max_dsp_1_U3", "Parent" : "12"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.fcmp_32ns_32ns_1_2_no_dsp_1_U4", "Parent" : "12"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U5", "Parent" : "12"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U6", "Parent" : "12"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U7", "Parent" : "12"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U8", "Parent" : "12"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U9", "Parent" : "12"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U10", "Parent" : "12"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U11", "Parent" : "12"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U12", "Parent" : "12"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U13", "Parent" : "12"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U14", "Parent" : "12"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U15", "Parent" : "12"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U16", "Parent" : "12"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U17", "Parent" : "12"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U18", "Parent" : "12"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U19", "Parent" : "12"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U20", "Parent" : "12"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U21", "Parent" : "12"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U22", "Parent" : "12"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U23", "Parent" : "12"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U24", "Parent" : "12"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U25", "Parent" : "12"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U26", "Parent" : "12"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U27", "Parent" : "12"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U28", "Parent" : "12"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mux_165_32_1_1_U29", "Parent" : "12"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mul_mul_11ns_5ns_15_4_1_U30", "Parent" : "12"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_layer_fu_222.mul_mul_11ns_5ns_15_4_1_U31", "Parent" : "12"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284", "Parent" : "0", "Child" : ["87", "88", "89", "90", "91", "92", "93"],
		"CDFG" : "maxpool_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4729", "EstimateLatencyMax" : "4729",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.fcmp_32ns_32ns_1_2_no_dsp_1_U67", "Parent" : "86"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_4ns_10ns_13_1_1_U68", "Parent" : "86"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_10ns_4ns_13_1_1_U69", "Parent" : "86"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_mul_5ns_11ns_15_4_1_U70", "Parent" : "86"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_mul_11ns_5ns_15_4_1_U71", "Parent" : "86"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_mul_5ns_11ns_15_4_1_U72", "Parent" : "86"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool_layer_fu_284.mul_mul_11ns_5ns_15_4_1_U73", "Parent" : "86"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_maxpool2_layer_fu_292", "Parent" : "0", "Child" : ["95"],
		"CDFG" : "maxpool2_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1622", "EstimateLatencyMax" : "1622",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_maxpool2_layer_fu_292.fcmp_32ns_32ns_1_2_no_dsp_1_U90", "Parent" : "94"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300", "Parent" : "0", "Child" : ["97", "98", "99", "100", "101", "102"],
		"CDFG" : "conv2d_6to16_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1249601", "EstimateLatencyMax" : "1249601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv2_weights", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv2_biases", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.conv2_weights_U", "Parent" : "96"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.conv2_biases_U", "Parent" : "96"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.fadd_32ns_32ns_32_5_full_dsp_1_U80", "Parent" : "96"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.fmul_32ns_32ns_32_4_max_dsp_1_U81", "Parent" : "96"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.fcmp_32ns_32ns_1_2_no_dsp_1_U82", "Parent" : "96"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_6to16_layer_fu_300.mac_muladd_10ns_4ns_10s_14_4_1_U83", "Parent" : "96"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312", "Parent" : "0", "Child" : ["104", "105", "106", "107", "108"],
		"CDFG" : "fc_layer_120_84_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "52422", "EstimateLatencyMax" : "52422",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "fc2_biases", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fc2_weights", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312.fc2_biases_U", "Parent" : "103"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312.fc2_weights_U", "Parent" : "103"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312.fadd_32ns_32ns_32_5_full_dsp_1_U105", "Parent" : "103"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312.fmul_32ns_32ns_32_4_max_dsp_1_U106", "Parent" : "103"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_120_84_s_fu_312.fcmp_32ns_32ns_1_2_no_dsp_1_U107", "Parent" : "103"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324", "Parent" : "0", "Child" : ["110", "111", "112", "113", "114"],
		"CDFG" : "fc_layer_400_120_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "242886", "EstimateLatencyMax" : "242886",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "fc1_biases", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fc1_weights", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324.fc1_biases_U", "Parent" : "109"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324.fc1_weights_U", "Parent" : "109"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324.fadd_32ns_32ns_32_5_full_dsp_1_U97", "Parent" : "109"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324.fmul_32ns_32ns_32_4_max_dsp_1_U98", "Parent" : "109"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fc_layer_400_120_s_fu_324.fcmp_32ns_32ns_1_2_no_dsp_1_U99", "Parent" : "109"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_flatten_layer_fu_336", "Parent" : "0",
		"CDFG" : "flatten_layer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "413", "EstimateLatencyMax" : "413",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	lenet_top {
		gmem {Type IO LastRead 152 FirstWrite 7}
		image_r {Type I LastRead 0 FirstWrite -1}
		conv1_out {Type I LastRead 0 FirstWrite -1}
		pool1_out {Type I LastRead 0 FirstWrite -1}
		conv2_out {Type I LastRead 0 FirstWrite -1}
		pool2_out {Type I LastRead 0 FirstWrite -1}
		flat_out {Type I LastRead 0 FirstWrite -1}
		fc1_out {Type I LastRead 0 FirstWrite -1}
		fc2_out {Type I LastRead 0 FirstWrite -1}
		prediction {Type I LastRead 0 FirstWrite -1}
		conv1_biases {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_4_0 {Type I LastRead -1 FirstWrite -1}
		conv2_weights {Type I LastRead -1 FirstWrite -1}
		conv2_biases {Type I LastRead -1 FirstWrite -1}
		fc1_biases {Type I LastRead -1 FirstWrite -1}
		fc1_weights {Type I LastRead -1 FirstWrite -1}
		fc2_biases {Type I LastRead -1 FirstWrite -1}
		fc2_weights {Type I LastRead -1 FirstWrite -1}
		fc3_biases {Type I LastRead -1 FirstWrite -1}
		fc3_weights_0 {Type I LastRead -1 FirstWrite -1}
		fc3_weights_1 {Type I LastRead -1 FirstWrite -1}
		fc3_weights_2 {Type I LastRead -1 FirstWrite -1}}
	fc3_layer {
		gmem {Type IO LastRead 92 FirstWrite 7}
		fc3_input {Type I LastRead 0 FirstWrite -1}
		predicted_class {Type I LastRead 0 FirstWrite -1}
		fc3_biases {Type I LastRead -1 FirstWrite -1}
		fc3_weights_0 {Type I LastRead -1 FirstWrite -1}
		fc3_weights_1 {Type I LastRead -1 FirstWrite -1}
		fc3_weights_2 {Type I LastRead -1 FirstWrite -1}}
	conv2d_layer {
		gmem {Type IO LastRead 152 FirstWrite 151}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}
		conv1_biases {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_0_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_1_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_2_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_3_4_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_0_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_1_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_2_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_3_0 {Type I LastRead -1 FirstWrite -1}
		conv1_weights_4_4_0 {Type I LastRead -1 FirstWrite -1}}
	maxpool_layer {
		gmem {Type IO LastRead 24 FirstWrite 23}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}}
	maxpool2_layer {
		gmem {Type IO LastRead 21 FirstWrite 20}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}}
	conv2d_6to16_layer {
		gmem {Type IO LastRead 15 FirstWrite 11}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}
		conv2_weights {Type I LastRead -1 FirstWrite -1}
		conv2_biases {Type I LastRead -1 FirstWrite -1}}
	fc_layer_120_84_s {
		gmem {Type IO LastRead 10 FirstWrite 28}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}
		fc2_biases {Type I LastRead -1 FirstWrite -1}
		fc2_weights {Type I LastRead -1 FirstWrite -1}}
	fc_layer_400_120_s {
		gmem {Type IO LastRead 10 FirstWrite 28}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}
		fc1_biases {Type I LastRead -1 FirstWrite -1}
		fc1_weights {Type I LastRead -1 FirstWrite -1}}
	flatten_layer {
		gmem {Type IO LastRead 9 FirstWrite 9}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 6 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1672456", "Max" : "1672456"}
	, {"Name" : "Interval", "Min" : "1672457", "Max" : "1672457"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN LEN 1 8 }  { m_axi_gmem_AWSIZE SIZE 1 3 }  { m_axi_gmem_AWBURST BURST 1 2 }  { m_axi_gmem_AWLOCK LOCK 1 2 }  { m_axi_gmem_AWCACHE CACHE 1 4 }  { m_axi_gmem_AWPROT PROT 1 3 }  { m_axi_gmem_AWQOS QOS 1 4 }  { m_axi_gmem_AWREGION REGION 1 4 }  { m_axi_gmem_AWUSER USER 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA DATA 1 32 }  { m_axi_gmem_WSTRB STRB 1 4 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER USER 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN LEN 1 8 }  { m_axi_gmem_ARSIZE SIZE 1 3 }  { m_axi_gmem_ARBURST BURST 1 2 }  { m_axi_gmem_ARLOCK LOCK 1 2 }  { m_axi_gmem_ARCACHE CACHE 1 4 }  { m_axi_gmem_ARPROT PROT 1 3 }  { m_axi_gmem_ARQOS QOS 1 4 }  { m_axi_gmem_ARREGION REGION 1 4 }  { m_axi_gmem_ARUSER USER 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA DATA 0 32 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RUSER USER 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ gmem { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
