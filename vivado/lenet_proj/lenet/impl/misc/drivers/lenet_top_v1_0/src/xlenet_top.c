// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xlenet_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLenet_top_CfgInitialize(XLenet_top *InstancePtr, XLenet_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLenet_top_Start(XLenet_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLenet_top_IsDone(XLenet_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLenet_top_IsIdle(XLenet_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLenet_top_IsReady(XLenet_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLenet_top_EnableAutoRestart(XLenet_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLenet_top_DisableAutoRestart(XLenet_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

void XLenet_top_Set_image_r(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IMAGE_R_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IMAGE_R_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_image_r(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IMAGE_R_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IMAGE_R_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_conv1_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV1_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV1_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_conv1_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV1_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV1_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_pool1_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL1_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL1_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_pool1_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL1_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL1_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_conv2_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV2_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV2_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_conv2_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV2_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_CONV2_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_pool2_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL2_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL2_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_pool2_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL2_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_POOL2_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_flat_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FLAT_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FLAT_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_flat_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FLAT_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FLAT_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_Set_fc1_out(XLenet_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FC1_OUT_DATA, (u32)(Data));
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FC1_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XLenet_top_Get_fc1_out(XLenet_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FC1_OUT_DATA);
    Data += (u64)XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_FC1_OUT_DATA + 4) << 32;
    return Data;
}

void XLenet_top_InterruptGlobalEnable(XLenet_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_GIE, 1);
}

void XLenet_top_InterruptGlobalDisable(XLenet_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_GIE, 0);
}

void XLenet_top_InterruptEnable(XLenet_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IER);
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XLenet_top_InterruptDisable(XLenet_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IER);
    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLenet_top_InterruptClear(XLenet_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLenet_top_WriteReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XLenet_top_InterruptGetEnabled(XLenet_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_IER);
}

u32 XLenet_top_InterruptGetStatus(XLenet_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLenet_top_ReadReg(InstancePtr->Control_BaseAddress, XLENET_TOP_CONTROL_ADDR_ISR);
}

