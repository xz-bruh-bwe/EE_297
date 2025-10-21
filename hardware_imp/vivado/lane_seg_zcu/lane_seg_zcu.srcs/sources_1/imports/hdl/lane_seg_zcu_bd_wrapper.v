//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Mon Oct 13 20:38:26 2025
//Host        : DESKTOP-D2NNA1U running 64-bit major release  (build 9200)
//Command     : generate_target lane_seg_zcu_bd_wrapper.bd
//Design      : lane_seg_zcu_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lane_seg_zcu_bd_wrapper
   (led);
  output [0:0]led;

  wire [0:0]led;

  lane_seg_zcu_bd lane_seg_zcu_bd_i
       (.led(led));
endmodule
