-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:hls:top:1.0
-- IP Revision: 2114245911

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT top_0
  PORT (
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_gmem_in_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_in_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem_in_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_in_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_in_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_in_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_in_AWREADY : IN STD_LOGIC;
    m_axi_gmem_in_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_in_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_in_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_WLAST : OUT STD_LOGIC;
    m_axi_gmem_in_WVALID : OUT STD_LOGIC;
    m_axi_gmem_in_WREADY : IN STD_LOGIC;
    m_axi_gmem_in_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_in_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_BVALID : IN STD_LOGIC;
    m_axi_gmem_in_BREADY : OUT STD_LOGIC;
    m_axi_gmem_in_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_in_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem_in_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_in_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_in_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_in_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_in_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_in_ARREADY : IN STD_LOGIC;
    m_axi_gmem_in_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_in_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_in_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_in_RLAST : IN STD_LOGIC;
    m_axi_gmem_in_RVALID : IN STD_LOGIC;
    m_axi_gmem_in_RREADY : OUT STD_LOGIC;
    m_axi_gmem_out_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_out_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem_out_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_out_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_out_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_out_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_out_AWREADY : IN STD_LOGIC;
    m_axi_gmem_out_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_out_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_out_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_WLAST : OUT STD_LOGIC;
    m_axi_gmem_out_WVALID : OUT STD_LOGIC;
    m_axi_gmem_out_WREADY : IN STD_LOGIC;
    m_axi_gmem_out_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_out_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_BVALID : IN STD_LOGIC;
    m_axi_gmem_out_BREADY : OUT STD_LOGIC;
    m_axi_gmem_out_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_out_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem_out_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_out_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_out_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_out_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_out_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_out_ARREADY : IN STD_LOGIC;
    m_axi_gmem_out_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem_out_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_out_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_out_RLAST : IN STD_LOGIC;
    m_axi_gmem_out_RVALID : IN STD_LOGIC;
    m_axi_gmem_out_RREADY : OUT STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : top_0
  PORT MAP (
    s_axi_control_AWADDR => s_axi_control_AWADDR,
    s_axi_control_AWVALID => s_axi_control_AWVALID,
    s_axi_control_AWREADY => s_axi_control_AWREADY,
    s_axi_control_WDATA => s_axi_control_WDATA,
    s_axi_control_WSTRB => s_axi_control_WSTRB,
    s_axi_control_WVALID => s_axi_control_WVALID,
    s_axi_control_WREADY => s_axi_control_WREADY,
    s_axi_control_BRESP => s_axi_control_BRESP,
    s_axi_control_BVALID => s_axi_control_BVALID,
    s_axi_control_BREADY => s_axi_control_BREADY,
    s_axi_control_ARADDR => s_axi_control_ARADDR,
    s_axi_control_ARVALID => s_axi_control_ARVALID,
    s_axi_control_ARREADY => s_axi_control_ARREADY,
    s_axi_control_RDATA => s_axi_control_RDATA,
    s_axi_control_RRESP => s_axi_control_RRESP,
    s_axi_control_RVALID => s_axi_control_RVALID,
    s_axi_control_RREADY => s_axi_control_RREADY,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    interrupt => interrupt,
    m_axi_gmem_in_AWID => m_axi_gmem_in_AWID,
    m_axi_gmem_in_AWADDR => m_axi_gmem_in_AWADDR,
    m_axi_gmem_in_AWLEN => m_axi_gmem_in_AWLEN,
    m_axi_gmem_in_AWSIZE => m_axi_gmem_in_AWSIZE,
    m_axi_gmem_in_AWBURST => m_axi_gmem_in_AWBURST,
    m_axi_gmem_in_AWLOCK => m_axi_gmem_in_AWLOCK,
    m_axi_gmem_in_AWREGION => m_axi_gmem_in_AWREGION,
    m_axi_gmem_in_AWCACHE => m_axi_gmem_in_AWCACHE,
    m_axi_gmem_in_AWPROT => m_axi_gmem_in_AWPROT,
    m_axi_gmem_in_AWQOS => m_axi_gmem_in_AWQOS,
    m_axi_gmem_in_AWVALID => m_axi_gmem_in_AWVALID,
    m_axi_gmem_in_AWREADY => m_axi_gmem_in_AWREADY,
    m_axi_gmem_in_WID => m_axi_gmem_in_WID,
    m_axi_gmem_in_WDATA => m_axi_gmem_in_WDATA,
    m_axi_gmem_in_WSTRB => m_axi_gmem_in_WSTRB,
    m_axi_gmem_in_WLAST => m_axi_gmem_in_WLAST,
    m_axi_gmem_in_WVALID => m_axi_gmem_in_WVALID,
    m_axi_gmem_in_WREADY => m_axi_gmem_in_WREADY,
    m_axi_gmem_in_BID => m_axi_gmem_in_BID,
    m_axi_gmem_in_BRESP => m_axi_gmem_in_BRESP,
    m_axi_gmem_in_BVALID => m_axi_gmem_in_BVALID,
    m_axi_gmem_in_BREADY => m_axi_gmem_in_BREADY,
    m_axi_gmem_in_ARID => m_axi_gmem_in_ARID,
    m_axi_gmem_in_ARADDR => m_axi_gmem_in_ARADDR,
    m_axi_gmem_in_ARLEN => m_axi_gmem_in_ARLEN,
    m_axi_gmem_in_ARSIZE => m_axi_gmem_in_ARSIZE,
    m_axi_gmem_in_ARBURST => m_axi_gmem_in_ARBURST,
    m_axi_gmem_in_ARLOCK => m_axi_gmem_in_ARLOCK,
    m_axi_gmem_in_ARREGION => m_axi_gmem_in_ARREGION,
    m_axi_gmem_in_ARCACHE => m_axi_gmem_in_ARCACHE,
    m_axi_gmem_in_ARPROT => m_axi_gmem_in_ARPROT,
    m_axi_gmem_in_ARQOS => m_axi_gmem_in_ARQOS,
    m_axi_gmem_in_ARVALID => m_axi_gmem_in_ARVALID,
    m_axi_gmem_in_ARREADY => m_axi_gmem_in_ARREADY,
    m_axi_gmem_in_RID => m_axi_gmem_in_RID,
    m_axi_gmem_in_RDATA => m_axi_gmem_in_RDATA,
    m_axi_gmem_in_RRESP => m_axi_gmem_in_RRESP,
    m_axi_gmem_in_RLAST => m_axi_gmem_in_RLAST,
    m_axi_gmem_in_RVALID => m_axi_gmem_in_RVALID,
    m_axi_gmem_in_RREADY => m_axi_gmem_in_RREADY,
    m_axi_gmem_out_AWID => m_axi_gmem_out_AWID,
    m_axi_gmem_out_AWADDR => m_axi_gmem_out_AWADDR,
    m_axi_gmem_out_AWLEN => m_axi_gmem_out_AWLEN,
    m_axi_gmem_out_AWSIZE => m_axi_gmem_out_AWSIZE,
    m_axi_gmem_out_AWBURST => m_axi_gmem_out_AWBURST,
    m_axi_gmem_out_AWLOCK => m_axi_gmem_out_AWLOCK,
    m_axi_gmem_out_AWREGION => m_axi_gmem_out_AWREGION,
    m_axi_gmem_out_AWCACHE => m_axi_gmem_out_AWCACHE,
    m_axi_gmem_out_AWPROT => m_axi_gmem_out_AWPROT,
    m_axi_gmem_out_AWQOS => m_axi_gmem_out_AWQOS,
    m_axi_gmem_out_AWVALID => m_axi_gmem_out_AWVALID,
    m_axi_gmem_out_AWREADY => m_axi_gmem_out_AWREADY,
    m_axi_gmem_out_WID => m_axi_gmem_out_WID,
    m_axi_gmem_out_WDATA => m_axi_gmem_out_WDATA,
    m_axi_gmem_out_WSTRB => m_axi_gmem_out_WSTRB,
    m_axi_gmem_out_WLAST => m_axi_gmem_out_WLAST,
    m_axi_gmem_out_WVALID => m_axi_gmem_out_WVALID,
    m_axi_gmem_out_WREADY => m_axi_gmem_out_WREADY,
    m_axi_gmem_out_BID => m_axi_gmem_out_BID,
    m_axi_gmem_out_BRESP => m_axi_gmem_out_BRESP,
    m_axi_gmem_out_BVALID => m_axi_gmem_out_BVALID,
    m_axi_gmem_out_BREADY => m_axi_gmem_out_BREADY,
    m_axi_gmem_out_ARID => m_axi_gmem_out_ARID,
    m_axi_gmem_out_ARADDR => m_axi_gmem_out_ARADDR,
    m_axi_gmem_out_ARLEN => m_axi_gmem_out_ARLEN,
    m_axi_gmem_out_ARSIZE => m_axi_gmem_out_ARSIZE,
    m_axi_gmem_out_ARBURST => m_axi_gmem_out_ARBURST,
    m_axi_gmem_out_ARLOCK => m_axi_gmem_out_ARLOCK,
    m_axi_gmem_out_ARREGION => m_axi_gmem_out_ARREGION,
    m_axi_gmem_out_ARCACHE => m_axi_gmem_out_ARCACHE,
    m_axi_gmem_out_ARPROT => m_axi_gmem_out_ARPROT,
    m_axi_gmem_out_ARQOS => m_axi_gmem_out_ARQOS,
    m_axi_gmem_out_ARVALID => m_axi_gmem_out_ARVALID,
    m_axi_gmem_out_ARREADY => m_axi_gmem_out_ARREADY,
    m_axi_gmem_out_RID => m_axi_gmem_out_RID,
    m_axi_gmem_out_RDATA => m_axi_gmem_out_RDATA,
    m_axi_gmem_out_RRESP => m_axi_gmem_out_RRESP,
    m_axi_gmem_out_RLAST => m_axi_gmem_out_RLAST,
    m_axi_gmem_out_RVALID => m_axi_gmem_out_RVALID,
    m_axi_gmem_out_RREADY => m_axi_gmem_out_RREADY
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file top_0.vhd when simulating
-- the core, top_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



