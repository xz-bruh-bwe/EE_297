// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xlane_seg_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLane_seg_top_CfgInitialize(XLane_seg_top *InstancePtr, XLane_seg_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLane_seg_top_Start(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLane_seg_top_IsDone(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLane_seg_top_IsIdle(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLane_seg_top_IsReady(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLane_seg_top_EnableAutoRestart(XLane_seg_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLane_seg_top_DisableAutoRestart(XLane_seg_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

void XLane_seg_top_Set_image_r(XLane_seg_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IMAGE_R_DATA, (u32)(Data));
    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IMAGE_R_DATA + 4, (u32)(Data >> 32));
}

u64 XLane_seg_top_Get_image_r(XLane_seg_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IMAGE_R_DATA);
    Data += (u64)XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IMAGE_R_DATA + 4) << 32;
    return Data;
}

void XLane_seg_top_Set_out1_ir0(XLane_seg_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_OUT1_IR0_DATA, (u32)(Data));
    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_OUT1_IR0_DATA + 4, (u32)(Data >> 32));
}

u64 XLane_seg_top_Get_out1_ir0(XLane_seg_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_OUT1_IR0_DATA);
    Data += (u64)XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_OUT1_IR0_DATA + 4) << 32;
    return Data;
}

void XLane_seg_top_Set_ctrl(XLane_seg_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_CTRL_DATA, Data);
}

u32 XLane_seg_top_Get_ctrl(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_CTRL_DATA);
    return Data;
}

void XLane_seg_top_Set_status_i(XLane_seg_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_STATUS_I_DATA, Data);
}

u32 XLane_seg_top_Get_status_i(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_STATUS_I_DATA);
    return Data;
}

u32 XLane_seg_top_Get_status_o(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_STATUS_O_DATA);
    return Data;
}

u32 XLane_seg_top_Get_status_o_vld(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_STATUS_O_CTRL);
    return Data & 0x1;
}

u32 XLane_seg_top_Get_magic(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_MAGIC_DATA);
    return Data;
}

u32 XLane_seg_top_Get_magic_vld(XLane_seg_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_MAGIC_CTRL);
    return Data & 0x1;
}

void XLane_seg_top_InterruptGlobalEnable(XLane_seg_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_GIE, 1);
}

void XLane_seg_top_InterruptGlobalDisable(XLane_seg_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_GIE, 0);
}

void XLane_seg_top_InterruptEnable(XLane_seg_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IER);
    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XLane_seg_top_InterruptDisable(XLane_seg_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IER);
    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLane_seg_top_InterruptClear(XLane_seg_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLane_seg_top_WriteReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XLane_seg_top_InterruptGetEnabled(XLane_seg_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_IER);
}

u32 XLane_seg_top_InterruptGetStatus(XLane_seg_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLane_seg_top_ReadReg(InstancePtr->Control_BaseAddress, XLANE_SEG_TOP_CONTROL_ADDR_ISR);
}

