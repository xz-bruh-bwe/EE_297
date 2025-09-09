// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:top:1.0
// IP Revision: 2114245911

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
top_0 your_instance_name (
  .s_axi_control_AWADDR(s_axi_control_AWADDR),        // input wire [7 : 0] s_axi_control_AWADDR
  .s_axi_control_AWVALID(s_axi_control_AWVALID),      // input wire s_axi_control_AWVALID
  .s_axi_control_AWREADY(s_axi_control_AWREADY),      // output wire s_axi_control_AWREADY
  .s_axi_control_WDATA(s_axi_control_WDATA),          // input wire [31 : 0] s_axi_control_WDATA
  .s_axi_control_WSTRB(s_axi_control_WSTRB),          // input wire [3 : 0] s_axi_control_WSTRB
  .s_axi_control_WVALID(s_axi_control_WVALID),        // input wire s_axi_control_WVALID
  .s_axi_control_WREADY(s_axi_control_WREADY),        // output wire s_axi_control_WREADY
  .s_axi_control_BRESP(s_axi_control_BRESP),          // output wire [1 : 0] s_axi_control_BRESP
  .s_axi_control_BVALID(s_axi_control_BVALID),        // output wire s_axi_control_BVALID
  .s_axi_control_BREADY(s_axi_control_BREADY),        // input wire s_axi_control_BREADY
  .s_axi_control_ARADDR(s_axi_control_ARADDR),        // input wire [7 : 0] s_axi_control_ARADDR
  .s_axi_control_ARVALID(s_axi_control_ARVALID),      // input wire s_axi_control_ARVALID
  .s_axi_control_ARREADY(s_axi_control_ARREADY),      // output wire s_axi_control_ARREADY
  .s_axi_control_RDATA(s_axi_control_RDATA),          // output wire [31 : 0] s_axi_control_RDATA
  .s_axi_control_RRESP(s_axi_control_RRESP),          // output wire [1 : 0] s_axi_control_RRESP
  .s_axi_control_RVALID(s_axi_control_RVALID),        // output wire s_axi_control_RVALID
  .s_axi_control_RREADY(s_axi_control_RREADY),        // input wire s_axi_control_RREADY
  .ap_clk(ap_clk),                                    // input wire ap_clk
  .ap_rst_n(ap_rst_n),                                // input wire ap_rst_n
  .interrupt(interrupt),                              // output wire interrupt
  .m_axi_gmem_in_AWID(m_axi_gmem_in_AWID),            // output wire [0 : 0] m_axi_gmem_in_AWID
  .m_axi_gmem_in_AWADDR(m_axi_gmem_in_AWADDR),        // output wire [63 : 0] m_axi_gmem_in_AWADDR
  .m_axi_gmem_in_AWLEN(m_axi_gmem_in_AWLEN),          // output wire [7 : 0] m_axi_gmem_in_AWLEN
  .m_axi_gmem_in_AWSIZE(m_axi_gmem_in_AWSIZE),        // output wire [2 : 0] m_axi_gmem_in_AWSIZE
  .m_axi_gmem_in_AWBURST(m_axi_gmem_in_AWBURST),      // output wire [1 : 0] m_axi_gmem_in_AWBURST
  .m_axi_gmem_in_AWLOCK(m_axi_gmem_in_AWLOCK),        // output wire [1 : 0] m_axi_gmem_in_AWLOCK
  .m_axi_gmem_in_AWREGION(m_axi_gmem_in_AWREGION),    // output wire [3 : 0] m_axi_gmem_in_AWREGION
  .m_axi_gmem_in_AWCACHE(m_axi_gmem_in_AWCACHE),      // output wire [3 : 0] m_axi_gmem_in_AWCACHE
  .m_axi_gmem_in_AWPROT(m_axi_gmem_in_AWPROT),        // output wire [2 : 0] m_axi_gmem_in_AWPROT
  .m_axi_gmem_in_AWQOS(m_axi_gmem_in_AWQOS),          // output wire [3 : 0] m_axi_gmem_in_AWQOS
  .m_axi_gmem_in_AWVALID(m_axi_gmem_in_AWVALID),      // output wire m_axi_gmem_in_AWVALID
  .m_axi_gmem_in_AWREADY(m_axi_gmem_in_AWREADY),      // input wire m_axi_gmem_in_AWREADY
  .m_axi_gmem_in_WID(m_axi_gmem_in_WID),              // output wire [0 : 0] m_axi_gmem_in_WID
  .m_axi_gmem_in_WDATA(m_axi_gmem_in_WDATA),          // output wire [31 : 0] m_axi_gmem_in_WDATA
  .m_axi_gmem_in_WSTRB(m_axi_gmem_in_WSTRB),          // output wire [3 : 0] m_axi_gmem_in_WSTRB
  .m_axi_gmem_in_WLAST(m_axi_gmem_in_WLAST),          // output wire m_axi_gmem_in_WLAST
  .m_axi_gmem_in_WVALID(m_axi_gmem_in_WVALID),        // output wire m_axi_gmem_in_WVALID
  .m_axi_gmem_in_WREADY(m_axi_gmem_in_WREADY),        // input wire m_axi_gmem_in_WREADY
  .m_axi_gmem_in_BID(m_axi_gmem_in_BID),              // input wire [0 : 0] m_axi_gmem_in_BID
  .m_axi_gmem_in_BRESP(m_axi_gmem_in_BRESP),          // input wire [1 : 0] m_axi_gmem_in_BRESP
  .m_axi_gmem_in_BVALID(m_axi_gmem_in_BVALID),        // input wire m_axi_gmem_in_BVALID
  .m_axi_gmem_in_BREADY(m_axi_gmem_in_BREADY),        // output wire m_axi_gmem_in_BREADY
  .m_axi_gmem_in_ARID(m_axi_gmem_in_ARID),            // output wire [0 : 0] m_axi_gmem_in_ARID
  .m_axi_gmem_in_ARADDR(m_axi_gmem_in_ARADDR),        // output wire [63 : 0] m_axi_gmem_in_ARADDR
  .m_axi_gmem_in_ARLEN(m_axi_gmem_in_ARLEN),          // output wire [7 : 0] m_axi_gmem_in_ARLEN
  .m_axi_gmem_in_ARSIZE(m_axi_gmem_in_ARSIZE),        // output wire [2 : 0] m_axi_gmem_in_ARSIZE
  .m_axi_gmem_in_ARBURST(m_axi_gmem_in_ARBURST),      // output wire [1 : 0] m_axi_gmem_in_ARBURST
  .m_axi_gmem_in_ARLOCK(m_axi_gmem_in_ARLOCK),        // output wire [1 : 0] m_axi_gmem_in_ARLOCK
  .m_axi_gmem_in_ARREGION(m_axi_gmem_in_ARREGION),    // output wire [3 : 0] m_axi_gmem_in_ARREGION
  .m_axi_gmem_in_ARCACHE(m_axi_gmem_in_ARCACHE),      // output wire [3 : 0] m_axi_gmem_in_ARCACHE
  .m_axi_gmem_in_ARPROT(m_axi_gmem_in_ARPROT),        // output wire [2 : 0] m_axi_gmem_in_ARPROT
  .m_axi_gmem_in_ARQOS(m_axi_gmem_in_ARQOS),          // output wire [3 : 0] m_axi_gmem_in_ARQOS
  .m_axi_gmem_in_ARVALID(m_axi_gmem_in_ARVALID),      // output wire m_axi_gmem_in_ARVALID
  .m_axi_gmem_in_ARREADY(m_axi_gmem_in_ARREADY),      // input wire m_axi_gmem_in_ARREADY
  .m_axi_gmem_in_RID(m_axi_gmem_in_RID),              // input wire [0 : 0] m_axi_gmem_in_RID
  .m_axi_gmem_in_RDATA(m_axi_gmem_in_RDATA),          // input wire [31 : 0] m_axi_gmem_in_RDATA
  .m_axi_gmem_in_RRESP(m_axi_gmem_in_RRESP),          // input wire [1 : 0] m_axi_gmem_in_RRESP
  .m_axi_gmem_in_RLAST(m_axi_gmem_in_RLAST),          // input wire m_axi_gmem_in_RLAST
  .m_axi_gmem_in_RVALID(m_axi_gmem_in_RVALID),        // input wire m_axi_gmem_in_RVALID
  .m_axi_gmem_in_RREADY(m_axi_gmem_in_RREADY),        // output wire m_axi_gmem_in_RREADY
  .m_axi_gmem_out_AWID(m_axi_gmem_out_AWID),          // output wire [0 : 0] m_axi_gmem_out_AWID
  .m_axi_gmem_out_AWADDR(m_axi_gmem_out_AWADDR),      // output wire [63 : 0] m_axi_gmem_out_AWADDR
  .m_axi_gmem_out_AWLEN(m_axi_gmem_out_AWLEN),        // output wire [7 : 0] m_axi_gmem_out_AWLEN
  .m_axi_gmem_out_AWSIZE(m_axi_gmem_out_AWSIZE),      // output wire [2 : 0] m_axi_gmem_out_AWSIZE
  .m_axi_gmem_out_AWBURST(m_axi_gmem_out_AWBURST),    // output wire [1 : 0] m_axi_gmem_out_AWBURST
  .m_axi_gmem_out_AWLOCK(m_axi_gmem_out_AWLOCK),      // output wire [1 : 0] m_axi_gmem_out_AWLOCK
  .m_axi_gmem_out_AWREGION(m_axi_gmem_out_AWREGION),  // output wire [3 : 0] m_axi_gmem_out_AWREGION
  .m_axi_gmem_out_AWCACHE(m_axi_gmem_out_AWCACHE),    // output wire [3 : 0] m_axi_gmem_out_AWCACHE
  .m_axi_gmem_out_AWPROT(m_axi_gmem_out_AWPROT),      // output wire [2 : 0] m_axi_gmem_out_AWPROT
  .m_axi_gmem_out_AWQOS(m_axi_gmem_out_AWQOS),        // output wire [3 : 0] m_axi_gmem_out_AWQOS
  .m_axi_gmem_out_AWVALID(m_axi_gmem_out_AWVALID),    // output wire m_axi_gmem_out_AWVALID
  .m_axi_gmem_out_AWREADY(m_axi_gmem_out_AWREADY),    // input wire m_axi_gmem_out_AWREADY
  .m_axi_gmem_out_WID(m_axi_gmem_out_WID),            // output wire [0 : 0] m_axi_gmem_out_WID
  .m_axi_gmem_out_WDATA(m_axi_gmem_out_WDATA),        // output wire [31 : 0] m_axi_gmem_out_WDATA
  .m_axi_gmem_out_WSTRB(m_axi_gmem_out_WSTRB),        // output wire [3 : 0] m_axi_gmem_out_WSTRB
  .m_axi_gmem_out_WLAST(m_axi_gmem_out_WLAST),        // output wire m_axi_gmem_out_WLAST
  .m_axi_gmem_out_WVALID(m_axi_gmem_out_WVALID),      // output wire m_axi_gmem_out_WVALID
  .m_axi_gmem_out_WREADY(m_axi_gmem_out_WREADY),      // input wire m_axi_gmem_out_WREADY
  .m_axi_gmem_out_BID(m_axi_gmem_out_BID),            // input wire [0 : 0] m_axi_gmem_out_BID
  .m_axi_gmem_out_BRESP(m_axi_gmem_out_BRESP),        // input wire [1 : 0] m_axi_gmem_out_BRESP
  .m_axi_gmem_out_BVALID(m_axi_gmem_out_BVALID),      // input wire m_axi_gmem_out_BVALID
  .m_axi_gmem_out_BREADY(m_axi_gmem_out_BREADY),      // output wire m_axi_gmem_out_BREADY
  .m_axi_gmem_out_ARID(m_axi_gmem_out_ARID),          // output wire [0 : 0] m_axi_gmem_out_ARID
  .m_axi_gmem_out_ARADDR(m_axi_gmem_out_ARADDR),      // output wire [63 : 0] m_axi_gmem_out_ARADDR
  .m_axi_gmem_out_ARLEN(m_axi_gmem_out_ARLEN),        // output wire [7 : 0] m_axi_gmem_out_ARLEN
  .m_axi_gmem_out_ARSIZE(m_axi_gmem_out_ARSIZE),      // output wire [2 : 0] m_axi_gmem_out_ARSIZE
  .m_axi_gmem_out_ARBURST(m_axi_gmem_out_ARBURST),    // output wire [1 : 0] m_axi_gmem_out_ARBURST
  .m_axi_gmem_out_ARLOCK(m_axi_gmem_out_ARLOCK),      // output wire [1 : 0] m_axi_gmem_out_ARLOCK
  .m_axi_gmem_out_ARREGION(m_axi_gmem_out_ARREGION),  // output wire [3 : 0] m_axi_gmem_out_ARREGION
  .m_axi_gmem_out_ARCACHE(m_axi_gmem_out_ARCACHE),    // output wire [3 : 0] m_axi_gmem_out_ARCACHE
  .m_axi_gmem_out_ARPROT(m_axi_gmem_out_ARPROT),      // output wire [2 : 0] m_axi_gmem_out_ARPROT
  .m_axi_gmem_out_ARQOS(m_axi_gmem_out_ARQOS),        // output wire [3 : 0] m_axi_gmem_out_ARQOS
  .m_axi_gmem_out_ARVALID(m_axi_gmem_out_ARVALID),    // output wire m_axi_gmem_out_ARVALID
  .m_axi_gmem_out_ARREADY(m_axi_gmem_out_ARREADY),    // input wire m_axi_gmem_out_ARREADY
  .m_axi_gmem_out_RID(m_axi_gmem_out_RID),            // input wire [0 : 0] m_axi_gmem_out_RID
  .m_axi_gmem_out_RDATA(m_axi_gmem_out_RDATA),        // input wire [31 : 0] m_axi_gmem_out_RDATA
  .m_axi_gmem_out_RRESP(m_axi_gmem_out_RRESP),        // input wire [1 : 0] m_axi_gmem_out_RRESP
  .m_axi_gmem_out_RLAST(m_axi_gmem_out_RLAST),        // input wire m_axi_gmem_out_RLAST
  .m_axi_gmem_out_RVALID(m_axi_gmem_out_RVALID),      // input wire m_axi_gmem_out_RVALID
  .m_axi_gmem_out_RREADY(m_axi_gmem_out_RREADY)      // output wire m_axi_gmem_out_RREADY
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file top_0.v when simulating
// the core, top_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

