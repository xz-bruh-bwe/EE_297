// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xlenet_top.h"

extern XLenet_top_Config XLenet_top_ConfigTable[];

XLenet_top_Config *XLenet_top_LookupConfig(u16 DeviceId) {
	XLenet_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLENET_TOP_NUM_INSTANCES; Index++) {
		if (XLenet_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLenet_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLenet_top_Initialize(XLenet_top *InstancePtr, u16 DeviceId) {
	XLenet_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLenet_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLenet_top_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

