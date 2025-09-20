set SynModuleInfo {
  {SRCNAME encoder0_c1_Pipeline_1 MODELNAME encoder0_c1_Pipeline_1 RTLNAME lane_seg_top_encoder0_c1_Pipeline_1
    SUBMODULES {
      {MODELNAME lane_seg_top_urem_8ns_3ns_2_12_1 RTLNAME lane_seg_top_urem_8ns_3ns_2_12_1 BINDTYPE op TYPE urem IMPL auto LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mul_10ns_12ns_21_1_1 RTLNAME lane_seg_top_mul_10ns_12ns_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mac_muladd_7ns_7ns_7ns_13_4_1 RTLNAME lane_seg_top_mac_muladd_7ns_7ns_7ns_13_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_flow_control_loop_pipe_sequential_init RTLNAME lane_seg_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME lane_seg_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3 MODELNAME encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3 RTLNAME lane_seg_top_encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3
    SUBMODULES {
      {MODELNAME lane_seg_top_mul_8ns_10ns_17_1_1 RTLNAME lane_seg_top_mul_8ns_10ns_17_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME encoder0_c1_Pipeline_VITIS_LOOP_50_4_VITIS_LOOP_51_5 MODELNAME encoder0_c1_Pipeline_VITIS_LOOP_50_4_VITIS_LOOP_51_5 RTLNAME lane_seg_top_encoder0_c1_Pipeline_VITIS_LOOP_50_4_VITIS_LOOP_51_5
    SUBMODULES {
      {MODELNAME lane_seg_top_sptohp_32ns_16_1_no_dsp_1 RTLNAME lane_seg_top_sptohp_32ns_16_1_no_dsp_1 BINDTYPE op TYPE sptohp IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_hadd_16ns_16ns_16_2_full_dsp_1 RTLNAME lane_seg_top_hadd_16ns_16ns_16_2_full_dsp_1 BINDTYPE op TYPE hadd IMPL fulldsp LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_hmul_16ns_16ns_16_2_max_dsp_1 RTLNAME lane_seg_top_hmul_16ns_16ns_16_2_max_dsp_1 BINDTYPE op TYPE hmul IMPL maxdsp LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_hcmp_16ns_16ns_1_1_no_dsp_1 RTLNAME lane_seg_top_hcmp_16ns_16ns_1_1_no_dsp_1 BINDTYPE op TYPE hcmp IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mul_7ns_9ns_15_1_1 RTLNAME lane_seg_top_mul_7ns_9ns_15_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_urem_7ns_3ns_2_11_1 RTLNAME lane_seg_top_urem_7ns_3ns_2_11_1 BINDTYPE op TYPE urem IMPL auto LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mul_7ns_8ns_13_1_1 RTLNAME lane_seg_top_mul_7ns_8ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mux_3_2_32_1_1 RTLNAME lane_seg_top_mux_3_2_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mac_muladd_6ns_6ns_6ns_11_4_1 RTLNAME lane_seg_top_mac_muladd_6ns_6ns_6ns_11_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME encoder0_c1 MODELNAME encoder0_c1 RTLNAME lane_seg_top_encoder0_c1
    SUBMODULES {
      {MODELNAME lane_seg_top_encoder0_c1_padded_RAM_1WNR_AUTO_1R1W RTLNAME lane_seg_top_encoder0_c1_padded_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME enc1_ir0_Pipeline_VITIS_LOOP_125_1_VITIS_LOOP_126_2 MODELNAME enc1_ir0_Pipeline_VITIS_LOOP_125_1_VITIS_LOOP_126_2 RTLNAME lane_seg_top_enc1_ir0_Pipeline_VITIS_LOOP_125_1_VITIS_LOOP_126_2
    SUBMODULES {
      {MODELNAME lane_seg_top_mul_64ns_66ns_129_1_1 RTLNAME lane_seg_top_mul_64ns_66ns_129_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mul_11s_7ns_11_1_1 RTLNAME lane_seg_top_mul_11s_7ns_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mul_6ns_7ns_11_1_1 RTLNAME lane_seg_top_mul_6ns_7ns_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_mux_3_2_16_1_1 RTLNAME lane_seg_top_mux_3_2_16_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME enc1_ir0_Pipeline_VITIS_LOOP_161_6_VITIS_LOOP_162_7 MODELNAME enc1_ir0_Pipeline_VITIS_LOOP_161_6_VITIS_LOOP_162_7 RTLNAME lane_seg_top_enc1_ir0_Pipeline_VITIS_LOOP_161_6_VITIS_LOOP_162_7}
  {SRCNAME enc1_ir0 MODELNAME enc1_ir0 RTLNAME lane_seg_top_enc1_ir0
    SUBMODULES {
      {MODELNAME lane_seg_top_enc1_ir0_enc1_ir0_half_112_32_half_112_16_half_3_1_32_half_hal_31_RAM_AUTO_1R1W RTLNAME lane_seg_top_enc1_ir0_enc1_ir0_half_112_32_half_112_16_half_3_1_32_half_hal_31_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME lane_seg_top MODELNAME lane_seg_top RTLNAME lane_seg_top IS_TOP 1
    SUBMODULES {
      {MODELNAME lane_seg_top_p_ZZ12lane_seg_topPA224_A3_fPA112_A16_DhjRjS5_E9out0_enc0_0_0_0_RAM_AUTO_1R1W RTLNAME lane_seg_top_p_ZZ12lane_seg_topPA224_A3_fPA112_A16_DhjRjS5_E9out0_enc0_0_0_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lane_seg_top_gmem_in_m_axi RTLNAME lane_seg_top_gmem_in_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME lane_seg_top_gmem_out_m_axi RTLNAME lane_seg_top_gmem_out_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME lane_seg_top_control_s_axi RTLNAME lane_seg_top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
