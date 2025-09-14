#include "hls_stream.h"
#include <math.h>

// ──────────────────────────────────────────────
// Project Headers
#include "lane_seg_top.h"

// ──────────────────────────────────────────────
// Include Weights and Biases
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_b.h"



// ──────────────────────────────────────────────
// Top-Level HLS Function (Wrapper)
// Description:
//   Entry point for lane segmentation pipeline.
//   Performs the first stage convolution using static weights.
//   Supports AXI4 and AXI4-Lite interfaces for integration.
// ──────────────────────────────────────────────
void lane_seg_top(
    float image[IN_H][IN_W][IN_C],
    data_t out0[OUT_H][OUT_W][OUT_C],
    unsigned int ctrl,
    unsigned int& status,
    unsigned int& magic
) {
    // ───── Memory Interfaces (disabled for simulation) ─────
#ifndef __SYNTHESIS__
    // No AXI4 ports in C simulation
#else
    #pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem_in depth=(IN_H * IN_W * IN_C)
    #pragma HLS INTERFACE m_axi port=out0  offset=slave bundle=gmem_out depth=(OUT_H * OUT_W * OUT_C)
#endif

    // ───── AXI-Lite Interfaces ─────
    #pragma HLS INTERFACE s_axilite port=image   bundle=control
    #pragma HLS INTERFACE s_axilite port=out0    bundle=control
    #pragma HLS INTERFACE s_axilite port=ctrl    bundle=control
    #pragma HLS INTERFACE s_axilite port=status  bundle=control
    #pragma HLS INTERFACE s_axilite port=magic   bundle=control
    #pragma HLS INTERFACE s_axilite port=return  bundle=control

    // ───── Initialization ─────
    magic = 0x1EAF0002u;

    if (ctrl & 0x2u)
        status = 0u;

    // ───── Call Encoder Stage 0 ─────
    encoder0_c1(image, out0, conv0_w, conv0_b);

    // ───── Update Status Bit: Stage 0 Done ─────
    status |= (1u << 0);  // STAGE0_DONE
}
