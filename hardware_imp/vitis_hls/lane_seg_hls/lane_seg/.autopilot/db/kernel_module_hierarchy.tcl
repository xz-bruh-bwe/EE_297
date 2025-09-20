set ModuleHierarchy {[{
"Name" : "lane_seg_top","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_encoder0_c1_fu_116","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_encoder0_c1_Pipeline_1_fu_87","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_encoder0_c1_Pipeline_VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3_fu_93","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_36_1_VITIS_LOOP_37_2_VITIS_LOOP_38_3","ID" : "5","Type" : "pipeline"},]},
		{"Name" : "grp_encoder0_c1_Pipeline_VITIS_LOOP_50_4_VITIS_LOOP_51_5_fu_101","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_50_4_VITIS_LOOP_51_5","ID" : "7","Type" : "pipeline"},]},]},]
}]}