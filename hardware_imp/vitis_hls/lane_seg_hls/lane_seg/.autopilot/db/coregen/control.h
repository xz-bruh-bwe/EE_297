// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of image_r
//        bit 31~0 - image_r[31:0] (Read/Write)
// 0x14 : Data signal of image_r
//        bit 31~0 - image_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of out0
//        bit 31~0 - out0[31:0] (Read/Write)
// 0x20 : Data signal of out0
//        bit 31~0 - out0[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of ctrl
//        bit 31~0 - ctrl[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of status_i
//        bit 31~0 - status_i[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of status_o
//        bit 31~0 - status_o[31:0] (Read)
// 0x3c : Control signal of status_o
//        bit 0  - status_o_ap_vld (Read/COR)
//        others - reserved
// 0x40 : Data signal of magic
//        bit 31~0 - magic[31:0] (Read)
// 0x44 : Control signal of magic
//        bit 0  - magic_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL       0x00
#define CONTROL_ADDR_GIE           0x04
#define CONTROL_ADDR_IER           0x08
#define CONTROL_ADDR_ISR           0x0c
#define CONTROL_ADDR_IMAGE_R_DATA  0x10
#define CONTROL_BITS_IMAGE_R_DATA  64
#define CONTROL_ADDR_OUT0_DATA     0x1c
#define CONTROL_BITS_OUT0_DATA     64
#define CONTROL_ADDR_CTRL_DATA     0x28
#define CONTROL_BITS_CTRL_DATA     32
#define CONTROL_ADDR_STATUS_I_DATA 0x30
#define CONTROL_BITS_STATUS_I_DATA 32
#define CONTROL_ADDR_STATUS_O_DATA 0x38
#define CONTROL_BITS_STATUS_O_DATA 32
#define CONTROL_ADDR_STATUS_O_CTRL 0x3c
#define CONTROL_ADDR_MAGIC_DATA    0x40
#define CONTROL_BITS_MAGIC_DATA    32
#define CONTROL_ADDR_MAGIC_CTRL    0x44
