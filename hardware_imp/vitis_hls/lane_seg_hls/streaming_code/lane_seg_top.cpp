#include "ap_fixed.h"
#include "hls_stream.h"
#include <math.h>


// Include support files
#include "lane_seg_top.h"




// Define the data type
//typedef float data_t;
typedef ap_fixed<16, 8> data_t;
//typedef float data_t;

// --------------------------- Top Wrapper ----------------------------
void lane_seg_top(
    //---------------------------------------------------------------- Stage 1
	data_t image[IN_H][IN_W][IN_C],
    data_t out0 [OUT_H][OUT_W][OUT_C],
	data_t encoder0_c1_weights   [K*K*IN_C*OUT_C],
	data_t encoder0_c1_biases    [OUT_C],
	//---------------------------------------------------------------- Stage 1


    unsigned int  ctrl,
    unsigned int& status,
    unsigned int& magic
){


// AXI interfaces: image & out only (no DDR weights)
#ifndef __SYNTHESIS__
    // m_axi disabled in C simulation
#else
    #pragma HLS INTERFACE m_axi     port=image offset=slave bundle=gmem_in  depth=(IN_H*IN_W*IN_C)
    #pragma HLS INTERFACE m_axi     port=out0  offset=slave bundle=gmem_out depth=(OUT_H*OUT_W*OUT_C)
	#pragma HLS INTERFACE m_axi 	port=encoder0_c1_weights offset=slave bundle=gmem_wts depth=(K*K*IN_C*OUT_C)
    #pragma HLS INTERFACE m_axi 	port=encoder0_c1_biases  offset=slave bundle=gmem_wts depth=OUT_C
#endif

    // Always required: AXI-lite control ports
    #pragma HLS INTERFACE s_axilite port=image  bundle=control
    #pragma HLS INTERFACE s_axilite port=out0   bundle=control
	#pragma HLS INTERFACE s_axilite port=encoder0_c1_weights bundle=control
    #pragma HLS INTERFACE s_axilite port=encoder0_c1_biases  bundle=control
	//--------------------------------------------------------------
    #pragma HLS INTERFACE s_axilite port=ctrl   bundle=control
    #pragma HLS INTERFACE s_axilite port=status bundle=control
    #pragma HLS INTERFACE s_axilite port=magic  bundle=control
    #pragma HLS INTERFACE s_axilite port=return bundle=control

    magic = 0x1EAF0002u;
    if (ctrl & 0x2u) status = 0u;


    // ─── Call encoder stage 0 with param-passed weights ───
    encoder0_c1(image, out0, encoder0_c1_weights, encoder0_c1_biases);
    status |= (1u<<0);  // STAGE0_DONE
}
//=========================================================

