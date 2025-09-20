set ModuleHierarchy {[{
"Name" : "lane_seg_top","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_encoder0_c1_fu_758","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_encoder0_c1_Pipeline_1_fu_737","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3_fu_795","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3","ID" : "5","Type" : "pipeline"},]},
		{"Name" : "grp_encoder0_c1_Pipeline_VITIS_LOOP_50_4_VITIS_LOOP_51_5_fu_829","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_50_4_VITIS_LOOP_51_5","ID" : "7","Type" : "pipeline"},]},]},
	{"Name" : "grp_enc1_ir0_fu_1341","ID" : "8","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_enc1_ir0_Pipeline_VITIS_LOOP_125_1_VITIS_LOOP_126_2_fu_692","ID" : "9","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_125_1_VITIS_LOOP_126_2","ID" : "10","Type" : "pipeline"},]},
		{"Name" : "grp_enc1_ir0_Pipeline_VITIS_LOOP_161_6_VITIS_LOOP_162_7_fu_1336","ID" : "11","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_161_6_VITIS_LOOP_162_7","ID" : "12","Type" : "pipeline"},]},]},]
}]}