// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xlane_seg_top.h"

extern XLane_seg_top_Config XLane_seg_top_ConfigTable[];

XLane_seg_top_Config *XLane_seg_top_LookupConfig(u16 DeviceId) {
	XLane_seg_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLANE_SEG_TOP_NUM_INSTANCES; Index++) {
		if (XLane_seg_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLane_seg_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLane_seg_top_Initialize(XLane_seg_top *InstancePtr, u16 DeviceId) {
	XLane_seg_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLane_seg_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLane_seg_top_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

