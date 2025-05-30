// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lenet_top_fc_layer_120_84_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        input_r,
        output_r
);

parameter    ap_ST_fsm_state1 = 20'd1;
parameter    ap_ST_fsm_state2 = 20'd2;
parameter    ap_ST_fsm_state3 = 20'd4;
parameter    ap_ST_fsm_state4 = 20'd8;
parameter    ap_ST_fsm_state5 = 20'd16;
parameter    ap_ST_fsm_state6 = 20'd32;
parameter    ap_ST_fsm_state7 = 20'd64;
parameter    ap_ST_fsm_state8 = 20'd128;
parameter    ap_ST_fsm_state9 = 20'd256;
parameter    ap_ST_fsm_pp0_stage0 = 20'd512;
parameter    ap_ST_fsm_pp0_stage1 = 20'd1024;
parameter    ap_ST_fsm_pp0_stage2 = 20'd2048;
parameter    ap_ST_fsm_pp0_stage3 = 20'd4096;
parameter    ap_ST_fsm_pp0_stage4 = 20'd8192;
parameter    ap_ST_fsm_state29 = 20'd16384;
parameter    ap_ST_fsm_state30 = 20'd32768;
parameter    ap_ST_fsm_state31 = 20'd65536;
parameter    ap_ST_fsm_state32 = 20'd131072;
parameter    ap_ST_fsm_state33 = 20'd262144;
parameter    ap_ST_fsm_state34 = 20'd524288;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [31:0] m_axi_gmem_WDATA;
output  [3:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [31:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [63:0] input_r;
input  [63:0] output_r;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem_AWVALID;
reg m_axi_gmem_WVALID;
reg m_axi_gmem_ARVALID;
reg m_axi_gmem_RREADY;
reg m_axi_gmem_BREADY;

(* fsm_encoding = "none" *) reg   [19:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [6:0] fc2_biases_address0;
reg    fc2_biases_ce0;
wire   [31:0] fc2_biases_q0;
wire   [13:0] fc2_weights_address0;
reg    fc2_weights_ce0;
wire   [31:0] fc2_weights_q0;
reg    gmem_blk_n_AW;
reg    gmem_blk_n_W;
wire    ap_CS_fsm_pp0_stage4;
reg    ap_enable_reg_pp0_iter3;
wire    ap_block_pp0_stage4;
reg   [0:0] ifzero_reg_415;
reg   [0:0] ifzero_reg_415_pp0_iter3_reg;
reg    gmem_blk_n_B;
wire    ap_CS_fsm_state34;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_state3;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage1;
reg   [0:0] icmp_ln82_reg_401;
reg   [6:0] j_reg_168;
reg   [13:0] phi_mul_reg_179;
reg   [31:0] sum_3_reg_191;
reg   [63:0] gmem_addr_11_reg_372;
wire   [6:0] add_ln79_fu_264_p2;
reg   [6:0] add_ln79_reg_381;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state8;
wire   [13:0] zext_ln81_fu_275_p1;
reg   [13:0] zext_ln81_reg_391;
wire    ap_CS_fsm_state9;
reg   [31:0] fc2_biases_load_reg_396;
wire   [0:0] icmp_ln82_fu_279_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state10_pp0_stage0_iter0;
wire    ap_block_state15_pp0_stage0_iter1;
wire    ap_block_state20_pp0_stage0_iter2;
wire    ap_block_state24_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln82_reg_401_pp0_iter1_reg;
reg   [0:0] icmp_ln82_reg_401_pp0_iter2_reg;
wire   [6:0] add_ln82_fu_285_p2;
reg   [6:0] add_ln82_reg_405;
wire   [0:0] ifzero_fu_301_p2;
reg   [0:0] ifzero_reg_415_pp0_iter1_reg;
reg   [0:0] ifzero_reg_415_pp0_iter2_reg;
reg   [31:0] gmem_addr_11_read_reg_419;
reg    ap_block_state11_pp0_stage1_iter0;
wire    ap_block_state16_pp0_stage1_iter1;
wire    ap_block_state35_pp0_stage1_iter2;
wire    ap_block_state25_pp0_stage1_iter3;
reg    ap_block_pp0_stage1_11001;
reg   [31:0] fc2_weights_load_reg_424;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state12_pp0_stage2_iter0;
wire    ap_block_state17_pp0_stage2_iter1;
wire    ap_block_state21_pp0_stage2_iter2;
wire    ap_block_state26_pp0_stage2_iter3;
wire    ap_block_pp0_stage2_11001;
wire   [13:0] add_ln83_1_fu_311_p2;
reg   [13:0] add_ln83_1_reg_434;
wire    ap_block_state14_pp0_stage4_iter0;
wire    ap_block_state19_pp0_stage4_iter1;
wire    ap_block_state23_pp0_stage4_iter2;
wire    ap_block_state28_pp0_stage4_iter3;
reg    ap_block_state28_io;
reg    ap_block_pp0_stage4_11001;
wire   [31:0] grp_fu_208_p2;
reg   [31:0] mul_reg_439;
wire   [31:0] grp_fu_203_p2;
reg   [31:0] sum_4_reg_444;
reg    ap_enable_reg_pp0_iter2;
reg   [31:0] sum_reg_450;
wire   [31:0] select_ln86_fu_358_p3;
reg   [31:0] select_ln86_reg_456;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state13_pp0_stage3_iter0;
wire    ap_block_state18_pp0_stage3_iter1;
wire    ap_block_state22_pp0_stage3_iter2;
wire    ap_block_state27_pp0_stage3_iter3;
wire    ap_block_pp0_stage3_11001;
reg    ap_block_pp0_stage4_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_condition_pp0_exit_iter1_state16;
reg   [6:0] i_reg_156;
wire    ap_CS_fsm_state29;
reg   [6:0] ap_phi_mux_j_phi_fu_172_p4;
wire    ap_block_pp0_stage0;
reg   [13:0] ap_phi_mux_phi_mul_phi_fu_183_p4;
reg   [31:0] ap_phi_mux_sum_3_phi_fu_195_p4;
wire   [63:0] zext_ln79_fu_270_p1;
wire   [63:0] zext_ln83_fu_296_p1;
wire  signed [63:0] sext_ln79_fu_227_p1;
wire  signed [63:0] sext_ln82_fu_248_p1;
wire    ap_block_pp0_stage4_01001;
reg   [31:0] grp_fu_203_p0;
reg   [31:0] grp_fu_203_p1;
wire    ap_block_pp0_stage2;
wire   [31:0] grp_fu_208_p0;
wire   [61:0] trunc_ln_fu_217_p4;
wire   [61:0] trunc_ln4_fu_238_p4;
wire   [13:0] add_ln83_fu_291_p2;
wire    ap_block_pp0_stage3;
wire   [31:0] bitcast_ln86_fu_317_p1;
wire   [7:0] tmp_fu_320_p4;
wire   [22:0] trunc_ln86_fu_330_p1;
wire   [0:0] icmp_ln86_2_fu_340_p2;
wire   [0:0] icmp_ln86_fu_334_p2;
wire   [0:0] or_ln86_fu_346_p2;
wire   [0:0] grp_fu_212_p2;
wire   [0:0] and_ln86_fu_352_p2;
reg    grp_fu_203_ce;
reg    grp_fu_208_ce;
reg    grp_fu_212_ce;
wire    ap_block_pp0_stage2_00001;
wire   [0:0] icmp_ln79_fu_258_p2;
reg   [19:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage3_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 20'd1;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

lenet_top_fc_layer_120_84_s_fc2_biases #(
    .DataWidth( 32 ),
    .AddressRange( 84 ),
    .AddressWidth( 7 ))
fc2_biases_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fc2_biases_address0),
    .ce0(fc2_biases_ce0),
    .q0(fc2_biases_q0)
);

lenet_top_fc_layer_120_84_s_fc2_weights #(
    .DataWidth( 32 ),
    .AddressRange( 10080 ),
    .AddressWidth( 14 ))
fc2_weights_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fc2_weights_address0),
    .ce0(fc2_weights_ce0),
    .q0(fc2_weights_q0)
);

lenet_top_fadd_32ns_32ns_32_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fadd_32ns_32ns_32_5_full_dsp_1_U105(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_203_p0),
    .din1(grp_fu_203_p1),
    .ce(grp_fu_203_ce),
    .dout(grp_fu_203_p2)
);

lenet_top_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U106(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_208_p0),
    .din1(fc2_weights_load_reg_424),
    .ce(grp_fu_208_ce),
    .dout(grp_fu_208_p2)
);

lenet_top_fcmp_32ns_32ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
fcmp_32ns_32ns_1_2_no_dsp_1_U107(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(sum_reg_450),
    .din1(32'd0),
    .ce(grp_fu_212_ce),
    .opcode(5'd2),
    .dout(grp_fu_212_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
            if ((1'b1 == ap_condition_pp0_exit_iter1_state16)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter0;
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((m_axi_gmem_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_156 <= 7'd0;
    end else if ((1'b1 == ap_CS_fsm_state29)) begin
        i_reg_156 <= add_ln79_reg_381;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        j_reg_168 <= 7'd0;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j_reg_168 <= add_ln82_reg_405;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        phi_mul_reg_179 <= 14'd0;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        phi_mul_reg_179 <= add_ln83_1_reg_434;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        sum_3_reg_191 <= 32'd0;
    end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln82_reg_401_pp0_iter2_reg == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        sum_3_reg_191 <= sum_4_reg_444;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln79_reg_381 <= add_ln79_fu_264_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln82_reg_405 <= add_ln82_fu_285_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage4) & (icmp_ln82_reg_401 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        add_ln83_1_reg_434 <= add_ln83_1_fu_311_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        fc2_biases_load_reg_396 <= fc2_biases_q0;
        zext_ln81_reg_391[6 : 0] <= zext_ln81_fu_275_p1[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        fc2_weights_load_reg_424 <= fc2_weights_q0;
        gmem_addr_11_read_reg_419 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((~((m_axi_gmem_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        gmem_addr_11_reg_372 <= sext_ln82_fu_248_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln82_reg_401 <= icmp_ln82_fu_279_p2;
        icmp_ln82_reg_401_pp0_iter1_reg <= icmp_ln82_reg_401;
        icmp_ln82_reg_401_pp0_iter2_reg <= icmp_ln82_reg_401_pp0_iter1_reg;
        ifzero_reg_415_pp0_iter1_reg <= ifzero_reg_415;
        ifzero_reg_415_pp0_iter2_reg <= ifzero_reg_415_pp0_iter1_reg;
        ifzero_reg_415_pp0_iter3_reg <= ifzero_reg_415_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_fu_279_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifzero_reg_415 <= ifzero_fu_301_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_reg_439 <= grp_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ifzero_reg_415_pp0_iter3_reg == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        select_ln86_reg_456 <= select_ln86_fu_358_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln82_reg_401_pp0_iter1_reg == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum_4_reg_444 <= grp_fu_203_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ifzero_reg_415_pp0_iter3_reg == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        sum_reg_450 <= grp_fu_203_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state16 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state16 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage4) & (icmp_ln82_reg_401 == 1'd1) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((((m_axi_gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state34)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_j_phi_fu_172_p4 = add_ln82_reg_405;
    end else begin
        ap_phi_mux_j_phi_fu_172_p4 = j_reg_168;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_phi_mul_phi_fu_183_p4 = add_ln83_1_reg_434;
    end else begin
        ap_phi_mux_phi_mul_phi_fu_183_p4 = phi_mul_reg_179;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln82_reg_401_pp0_iter2_reg == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        ap_phi_mux_sum_3_phi_fu_195_p4 = sum_4_reg_444;
    end else begin
        ap_phi_mux_sum_3_phi_fu_195_p4 = sum_3_reg_191;
    end
end

always @ (*) begin
    if (((m_axi_gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state34))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        fc2_biases_ce0 = 1'b1;
    end else begin
        fc2_biases_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        fc2_weights_ce0 = 1'b1;
    end else begin
        fc2_weights_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        gmem_blk_n_AW = m_axi_gmem_AWREADY;
    end else begin
        gmem_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state34)) begin
        gmem_blk_n_B = m_axi_gmem_BVALID;
    end else begin
        gmem_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln82_reg_401 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ifzero_reg_415_pp0_iter3_reg == 1'd1) & (1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        gmem_blk_n_W = m_axi_gmem_WREADY;
    end else begin
        gmem_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_11001)))) begin
        grp_fu_203_ce = 1'b1;
    end else begin
        grp_fu_203_ce = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_203_p0 = sum_4_reg_444;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_203_p0 = ap_phi_mux_sum_3_phi_fu_195_p4;
    end else begin
        grp_fu_203_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_203_p1 = fc2_biases_load_reg_396;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_203_p1 = mul_reg_439;
    end else begin
        grp_fu_203_p1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_11001)))) begin
        grp_fu_208_ce = 1'b1;
    end else begin
        grp_fu_208_ce = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001)))) begin
        grp_fu_212_ce = 1'b1;
    end else begin
        grp_fu_212_ce = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem_ARVALID = 1'b1;
    end else begin
        m_axi_gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((m_axi_gmem_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_gmem_AWVALID = 1'b1;
    end else begin
        m_axi_gmem_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state34))) begin
        m_axi_gmem_BREADY = 1'b1;
    end else begin
        m_axi_gmem_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln82_reg_401 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ifzero_reg_415_pp0_iter3_reg == 1'd1) & (1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        m_axi_gmem_WVALID = 1'b1;
    end else begin
        m_axi_gmem_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((m_axi_gmem_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln79_fu_258_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state30;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((m_axi_gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state29;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((~((ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1)) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state29;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            if (((m_axi_gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state34))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state34;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln79_fu_264_p2 = (i_reg_156 + 7'd1);

assign add_ln82_fu_285_p2 = (ap_phi_mux_j_phi_fu_172_p4 + 7'd1);

assign add_ln83_1_fu_311_p2 = (phi_mul_reg_179 + 14'd84);

assign add_ln83_fu_291_p2 = (zext_ln81_reg_391 + ap_phi_mux_phi_mul_phi_fu_183_p4);

assign and_ln86_fu_352_p2 = (or_ln86_fu_346_p2 & grp_fu_212_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state29 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state34 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((m_axi_gmem_RVALID == 1'b0) & (icmp_ln82_reg_401 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((m_axi_gmem_RVALID == 1'b0) & (icmp_ln82_reg_401 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage4_11001 = ((1'b1 == ap_block_state28_io) & (ap_enable_reg_pp0_iter3 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage4_subdone = ((1'b1 == ap_block_state28_io) & (ap_enable_reg_pp0_iter3 == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state11_pp0_stage1_iter0 = ((m_axi_gmem_RVALID == 1'b0) & (icmp_ln82_reg_401 == 1'd0));
end

assign ap_block_state12_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage2_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state22_pp0_stage3_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state23_pp0_stage4_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state24_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state25_pp0_stage1_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state26_pp0_stage2_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state27_pp0_stage3_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state28_io = ((m_axi_gmem_WREADY == 1'b0) & (ifzero_reg_415_pp0_iter3_reg == 1'd1));
end

assign ap_block_state28_pp0_stage4_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state35_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln86_fu_317_p1 = sum_reg_450;

assign fc2_biases_address0 = zext_ln79_fu_270_p1;

assign fc2_weights_address0 = zext_ln83_fu_296_p1;

assign grp_fu_208_p0 = gmem_addr_11_read_reg_419;

assign icmp_ln79_fu_258_p2 = ((i_reg_156 == 7'd84) ? 1'b1 : 1'b0);

assign icmp_ln82_fu_279_p2 = ((ap_phi_mux_j_phi_fu_172_p4 == 7'd120) ? 1'b1 : 1'b0);

assign icmp_ln86_2_fu_340_p2 = ((trunc_ln86_fu_330_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_334_p2 = ((tmp_fu_320_p4 != 8'd255) ? 1'b1 : 1'b0);

assign ifzero_fu_301_p2 = ((add_ln82_fu_285_p2 == 7'd120) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARADDR = gmem_addr_11_reg_372;

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = 32'd120;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_AWADDR = sext_ln79_fu_227_p1;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd84;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_WDATA = select_ln86_reg_456;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 4'd15;

assign m_axi_gmem_WUSER = 1'd0;

assign or_ln86_fu_346_p2 = (icmp_ln86_fu_334_p2 | icmp_ln86_2_fu_340_p2);

assign select_ln86_fu_358_p3 = ((and_ln86_fu_352_p2[0:0] === 1'b1) ? bitcast_ln86_fu_317_p1 : 32'd0);

assign sext_ln79_fu_227_p1 = $signed(trunc_ln_fu_217_p4);

assign sext_ln82_fu_248_p1 = $signed(trunc_ln4_fu_238_p4);

assign tmp_fu_320_p4 = {{bitcast_ln86_fu_317_p1[30:23]}};

assign trunc_ln4_fu_238_p4 = {{input_r[63:2]}};

assign trunc_ln86_fu_330_p1 = bitcast_ln86_fu_317_p1[22:0];

assign trunc_ln_fu_217_p4 = {{output_r[63:2]}};

assign zext_ln79_fu_270_p1 = i_reg_156;

assign zext_ln81_fu_275_p1 = i_reg_156;

assign zext_ln83_fu_296_p1 = add_ln83_fu_291_p2;

always @ (posedge ap_clk) begin
    zext_ln81_reg_391[13:7] <= 7'b0000000;
end

endmodule //lenet_top_fc_layer_120_84_s
