#include "hls_stream.h"
#include <math.h>

// ──────────────────────────────────────────────
// Project Headers
#include "lane_seg_top.h"

// ──────────────────────────────────────────────
// Include Weights and Biases
// ──────────────────────────────────────────────
// encoder0_c1
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_b.h"

//enc0_ir0 (InvertedResidual0)
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_dw_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_dw_b.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_pw_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_pw_b.h"

//enc1_ir1
// enc1_ir1 (InvertedResidual1)
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_exp_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_exp_b.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_dw_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_dw_b.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_pw_w.h"
#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_pw_b.h"

// enc2_ir2 (InvertedResidual2)
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_exp_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_exp_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_dw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_dw_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_pw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_pw_b.h"

// enc4_ir3 (InvertedResidual3)
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_exp_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_exp_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_dw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_dw_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_pw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_pw_b.h"

// enc5_ir4 (InvertedResidual4)
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_exp_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_exp_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_dw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_dw_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_pw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_pw_b.h"



// ──────────────────────────────────────────────
// Top-Level HLS Function (Wrapper)
// Description:
//   Entry point for lane segmentation pipeline.
//   Performs the first stage convolution using static weights.
//   Supports AXI4 and AXI4-Lite interfaces for integration.
// ──────────────────────────────────────────────
void lane_seg_top(
    float image[IN_H][IN_W][IN_C],
    //data_t out0[OUT_H][OUT_W][OUT_C],
	//data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],  // <-- output after encoder1_ir0
	//data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],  // <-- output after encoder2_ir1
	//data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],  // <-- output after encoder3_ir2
    //data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],  // <-- output after encoder4_ir3
	data_t out5_ir4[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],   	// <-- output after encoder5_ir4



	// Proc Ctrl Signals
    unsigned int ctrl,
    unsigned int& status,
    unsigned int& magic
) {
    // ───── Memory Interfaces (disabled for simulation) ─────
#ifndef __SYNTHESIS__
    // No AXI4 ports in C simulation
#else
    #pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem_in depth=(IN_H * IN_W * IN_C)
    //#pragma HLS INTERFACE m_axi port=out0  offset=slave bundle=gmem_out depth=(OUT_H * OUT_W * OUT_C)
	//#pragma HLS INTERFACE m_axi port=out1_ir0  offset=slave bundle=gmem_out depth=(OUT1_IR0_H * OUT1_IR0_W * OUT1_IR0_C)
	//#pragma HLS INTERFACE m_axi port=out2_ir1 offset=slave bundle=gmem_out depth=(OUT2_IR1_H * OUT2_IR1_W * OUT2_IR1_C)
	//#pragma HLS INTERFACE m_axi port=out3_ir2 offset=slave bundle=gmem_out depth=(OUT3_IR2_H * OUT3_IR2_W * OUT3_IR2_C)
	//#pragma HLS INTERFACE m_axi port=out4_ir3 offset=slave bundle=gmem_out depth=(OUT4_IR3_H * OUT4_IR3_W * OUT4_IR3_C)
	#pragma HLS INTERFACE m_axi port=out5_ir4 offset=slave bundle=gmem_out depth=(OUT5_IR4_H * OUT5_IR4_W * OUT5_IR4_C)

#endif

    // ───── AXI-Lite Interfaces ─────
    #pragma HLS INTERFACE s_axilite port=image   bundle=control
    //#pragma HLS INTERFACE s_axilite port=out0    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out1_ir0    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out2_ir1    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out3_ir2 	bundle=control
	//#pragma HLS INTERFACE s_axilite port=out4_ir3 bundle=control
	#pragma HLS INTERFACE s_axilite port=out5_ir4 	bundle=control

	// ────────────────────────────────────────────────────────
	#pragma HLS INTERFACE s_axilite port=ctrl    bundle=control
    #pragma HLS INTERFACE s_axilite port=status  bundle=control
    #pragma HLS INTERFACE s_axilite port=magic   bundle=control
    #pragma HLS INTERFACE s_axilite port=return  bundle=control

    // ───── Initialization ─────
    magic = 0x1EAF0002u;

    if (ctrl & 0x2u)
        status = 0u;
    // ──────────────────────────────


    // ───── Encoder Stage 0 ─────
    static data_t out0_enc0[OUT0_H][OUT0_W][OUT0_C]; //<- Stage0 output -> Stage1 input // 112x112x32

    encoder0_c1(image, out0_enc0, conv0_w, conv0_b);
    // ───── Update Status Bit: Stage 0 Done ─────
    status |= (1u << 0);  // STAGE0_DONE

    // ───── Stage 1: InvertedResidual0─────
    static data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C]; // 112x112x16

    enc1_ir0(out0_enc0, out1_ir0, enc1_dw_w, enc1_dw_b, enc1_pw_w, enc1_pw_b);
    status |= (1u << 1);  // STAGE1_DONE

    // ───── Stage 2: InvertedResidual1 (exp → dw → pw) ─────
    static data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C];  // 56x56x24

    enc2_ir1(
    		out1_ir0, out2_ir1,
            enc2_ir1_exp_w, enc2_ir1_exp_b,
            enc2_ir1_dw_w,  enc2_ir1_dw_b,
            enc2_ir1_pw_w,  enc2_ir1_pw_b
        );
    status |= (1u << 2);  // STAGE2_DONE

    // ───── Stage 3: enc3_ir2 (expand → dw → pw) ─────
    static data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C];
    enc3_ir2(out2_ir1, out3_ir2,
                 enc3_ir2_exp_w, enc3_ir2_exp_b,
                 enc3_ir2_dw_w,  enc3_ir2_dw_b,
                 enc3_ir2_pw_w,  enc3_ir2_pw_b);
        status |= (1u << 3);

   // ───── Stage 3: enc4_ir3 (expand → dw → pw) ─────
   static data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C];
   enc4_ir3(out3_ir2, out4_ir3,
		   enc4_ir3_exp_w, enc4_ir3_exp_b,
           enc4_ir3_dw_w,  enc4_ir3_dw_b,
		   enc4_ir3_pw_w,  enc4_ir3_pw_b);
     status |= (1u << 4);

     // ───── Stage 5 ─────
         enc5_ir4(out4_ir3, out5_ir4,
                  enc5_ir4_exp_w, enc5_ir4_exp_b,
                  enc5_ir4_dw_w,  enc5_ir4_dw_b,
                  enc5_ir4_pw_w,  enc5_ir4_pw_b);
         status |= (1u << 5);

}
