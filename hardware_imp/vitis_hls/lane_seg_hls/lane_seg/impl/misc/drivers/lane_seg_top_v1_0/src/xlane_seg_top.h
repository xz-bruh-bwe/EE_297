// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XLANE_SEG_TOP_H
#define XLANE_SEG_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xlane_seg_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XLane_seg_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XLane_seg_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XLane_seg_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XLane_seg_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XLane_seg_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XLane_seg_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XLane_seg_top_Initialize(XLane_seg_top *InstancePtr, u16 DeviceId);
XLane_seg_top_Config* XLane_seg_top_LookupConfig(u16 DeviceId);
int XLane_seg_top_CfgInitialize(XLane_seg_top *InstancePtr, XLane_seg_top_Config *ConfigPtr);
#else
int XLane_seg_top_Initialize(XLane_seg_top *InstancePtr, const char* InstanceName);
int XLane_seg_top_Release(XLane_seg_top *InstancePtr);
#endif

void XLane_seg_top_Start(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_IsDone(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_IsIdle(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_IsReady(XLane_seg_top *InstancePtr);
void XLane_seg_top_EnableAutoRestart(XLane_seg_top *InstancePtr);
void XLane_seg_top_DisableAutoRestart(XLane_seg_top *InstancePtr);

void XLane_seg_top_Set_image_r(XLane_seg_top *InstancePtr, u64 Data);
u64 XLane_seg_top_Get_image_r(XLane_seg_top *InstancePtr);
void XLane_seg_top_Set_out0(XLane_seg_top *InstancePtr, u64 Data);
u64 XLane_seg_top_Get_out0(XLane_seg_top *InstancePtr);
void XLane_seg_top_Set_ctrl(XLane_seg_top *InstancePtr, u32 Data);
u32 XLane_seg_top_Get_ctrl(XLane_seg_top *InstancePtr);
void XLane_seg_top_Set_status_i(XLane_seg_top *InstancePtr, u32 Data);
u32 XLane_seg_top_Get_status_i(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_Get_status_o(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_Get_status_o_vld(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_Get_magic(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_Get_magic_vld(XLane_seg_top *InstancePtr);

void XLane_seg_top_InterruptGlobalEnable(XLane_seg_top *InstancePtr);
void XLane_seg_top_InterruptGlobalDisable(XLane_seg_top *InstancePtr);
void XLane_seg_top_InterruptEnable(XLane_seg_top *InstancePtr, u32 Mask);
void XLane_seg_top_InterruptDisable(XLane_seg_top *InstancePtr, u32 Mask);
void XLane_seg_top_InterruptClear(XLane_seg_top *InstancePtr, u32 Mask);
u32 XLane_seg_top_InterruptGetEnabled(XLane_seg_top *InstancePtr);
u32 XLane_seg_top_InterruptGetStatus(XLane_seg_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
