#include "hls_stream.h"
#include <math.h>

// ──────────────────────────────────────────────
// Project Headers
#include "lane_seg_top.h"

// ──────────────────────────────────────────────
// Include Weights and Biases
// ──────────────────────────────────────────────
// encoder0_c1
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\encoder_conv0_b.h"
//
////enc0_ir0 (InvertedResidual0)
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_dw_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_dw_b.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_pw_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc1_pw_b.h"
//
////enc1_ir1
//// enc1_ir1 (InvertedResidual1)
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_exp_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_exp_b.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_dw_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_dw_b.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_pw_w.h"
//#include "C:\Users\Baron\Desktop\EE_297_Repo\EE_297\ML_PATH_EE297\EE297_env\01_main\03_lanes_code\weights\enc2_ir1_pw_b.h"
//
//// enc2_ir2 (InvertedResidual2)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc3_ir2_pw_b.h"
//
//// enc4_ir3 (InvertedResidual3)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc4_ir3_pw_b.h"
//
//// enc5_ir4 (InvertedResidual4)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc5_ir4_pw_b.h"
//
//
//// enc6_ir5 (InvertedResidual5)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc6_ir5_pw_b.h"
//
//// enc7_ir6 (InvertedResidual6)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc7_ir6_pw_b.h"
//
//// enc8_ir7 (InvertedResidual7)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc8_ir7_pw_b.h"
//
//// enc9_ir8 (InvertedResidual8)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc9_ir8_pw_b.h"
//
//// enc10_ir9 (InvertedResidual10)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc10_ir9_pw_b.h"
//
//// enc11_ir10 (InvertedResidual11)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc11_ir10_pw_b.h"
//
//
//// enc12_ir11 (InvertedResidual12)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc12_ir11_pw_b.h"
//
//// enc13_ir12 (InvertedResidual13)
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_exp_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_exp_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_dw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_dw_b.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_pw_w.h"
//#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc13_ir12_pw_b.h"

// enc14_ir13 (InvertedResidual14)
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_exp_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_exp_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_dw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_dw_b.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_pw_w.h"
#include "C:\\Users\\Baron\\Desktop\\EE_297_Repo\\EE_297\\ML_PATH_EE297\\EE297_env\\01_main\\03_lanes_code\\weights\\enc14_ir13_pw_b.h"



// ──────────────────────────────────────────────
// Top-Level HLS Function (Wrapper)
// Description:
//   Entry point for lane segmentation pipeline.
//   Performs the first stage convolution using static weights.
//   Supports AXI4 and AXI4-Lite interfaces for integration.
// ──────────────────────────────────────────────
void lane_seg_top(
    //float image[IN_H][IN_W][IN_C],
    //data_t out0[OUT_H][OUT_W][OUT_C],
	//data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C],  // <-- output after encoder1_ir0
	//data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C],  // <-- output after encoder2_ir1
	//data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C],  // <-- output after encoder3_ir2
    //data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C],  // <-- output after encoder4_ir3
	//data_t out5_ir4[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C],  // <-- output after encoder5_ir4
	//data_t out6_ir5[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C],  // <-- output after encoder6_ir5
	//data_t out7_ir6[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C],  // <-- output after encoder7_ir6
	//data_t out8_ir7[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C],  // <-- output after encoder8_ir7
	//data_t out9_ir8[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C],  // <-- output after encoder9_ir8
	//data_t out10_ir9[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C],  // <-- output after encoder10_ir9
	//data_t out11_ir10[OUT11_IR10_H][OUT11_IR10_W][OUT11_IR10_C],  // <-- output after encoder11_ir10
	//data_t out12_ir11[OUT12_IR11_H][OUT12_IR11_W][OUT12_IR11_C],  // <-- output after encoder12_ir11
	float out13_ir12[OUT13_IR12_H][OUT13_IR12_W][OUT13_IR12_C],  // <-- output after encoder13_ir1 <- Serves as input
	data_t out14_ir13[OUT14_IR13_H][OUT14_IR13_W][OUT14_IR13_C],  // <-- output after encoder14_ir13




	// Proc Ctrl Signals
    unsigned int ctrl,
    unsigned int& status,
    unsigned int& magic
) {
    // ───── Memory Interfaces (disabled for simulation) ─────
#ifndef __SYNTHESIS__
    // No AXI4 ports in C simulation
#else
    //#pragma HLS INTERFACE m_axi port=image offset=slave bundle=gmem_in depth=(IN_H * IN_W * IN_C)
    //#pragma HLS INTERFACE m_axi port=out0  offset=slave bundle=gmem_out depth=(OUT_H * OUT_W * OUT_C)
	//#pragma HLS INTERFACE m_axi port=out1_ir0  offset=slave bundle=gmem_out depth=(OUT1_IR0_H * OUT1_IR0_W * OUT1_IR0_C)
	//#pragma HLS INTERFACE m_axi port=out2_ir1 offset=slave bundle=gmem_out depth=(OUT2_IR1_H * OUT2_IR1_W * OUT2_IR1_C)
	//#pragma HLS INTERFACE m_axi port=out3_ir2 offset=slave bundle=gmem_out depth=(OUT3_IR2_H * OUT3_IR2_W * OUT3_IR2_C)
	//#pragma HLS INTERFACE m_axi port=out4_ir3 offset=slave bundle=gmem_out depth=(OUT4_IR3_H * OUT4_IR3_W * OUT4_IR3_C)
	//#pragma HLS INTERFACE m_axi port=out5_ir4 offset=slave bundle=gmem_out depth=(OUT5_IR4_H * OUT5_IR4_W * OUT5_IR4_C)
	//#pragma HLS INTERFACE m_axi port=out6_ir5 offset=slave bundle=gmem_out depth=(OUT6_IR5_H * OUT6_IR5_W * OUT6_IR5_C)
	//#pragma HLS INTERFACE m_axi port=out7_ir6 offset=slave bundle=gmem_out depth=(OUT7_IR6_H * OUT7_IR6_W * OUT7_IR6_C)
	//#pragma HLS INTERFACE m_axi port=out8_ir7 offset=slave bundle=gmem_out depth=(OUT8_IR7_H * OUT8_IR7_W * OUT8_IR7_C)
	//#pragma HLS INTERFACE m_axi port=out9_ir8 offset=slave bundle=gmem_out depth=(OUT9_IR8_H * OUT9_IR8_W * OUT9_IR8_C)
	//#pragma HLS INTERFACE m_axi port=out10_ir9 offset=slave bundle=gmem_out depth=(OUT10_IR9_H * OUT10_IR9_W * OUT10_IR9_C)
	//#pragma HLS INTERFACE m_axi port=out11_ir10 offset=slave bundle=gmem_out depth=(OUT11_IR10_H * OUT11_IR10_W * OUT11_IR10_C)
	//#pragma HLS INTERFACE m_axi port=out12_ir11 offset=slave bundle=gmem_out depth=(OUT12_IR11_H * OUT12_IR11_W * OUT12_IR11_C)

	#pragma HLS INTERFACE m_axi port=out13_ir12 offset=slave bundle=gmem_in depth=(OUT13_IR12_H * OUT13_IR12_W * OUT13_IR12_C)
	#pragma HLS INTERFACE m_axi port=out14_ir13 offset=slave bundle=gmem_out depth=(OUT14_IR13_H * OUT14_IR13_W * OUT14_IR13_C)




#endif

    // ───── AXI-Lite Interfaces ─────
    //#pragma HLS INTERFACE s_axilite port=image   bundle=control
    //#pragma HLS INTERFACE s_axilite port=out0    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out1_ir0    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out2_ir1    bundle=control
	//#pragma HLS INTERFACE s_axilite port=out3_ir2 	bundle=control
	//#pragma HLS INTERFACE s_axilite port=out4_ir3 	bundle=control
	//#pragma HLS INTERFACE s_axilite port=out5_ir4 	bundle=control
	//#pragma HLS INTERFACE s_axilite port=out6_ir5 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out7_ir6 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out8_ir7 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out9_ir8 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out10_ir9 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out11_ir10 bundle=control
	//#pragma HLS INTERFACE s_axilite port=out12_ir11 bundle=control
	#pragma HLS INTERFACE s_axilite port=out13_ir12 bundle=control
	#pragma HLS INTERFACE s_axilite port=out14_ir13 bundle=control



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


//    // ───── Encoder Stage 0 ─────
//    static data_t out0_enc0[OUT0_H][OUT0_W][OUT0_C]; //<- Stage0 output -> Stage1 input // 112x112x32
//
//    encoder0_c1(image, out0_enc0, conv0_w, conv0_b);
//    // ───── Update Status Bit: Stage 0 Done ─────
//    status |= (1u << 0);  // STAGE0_DONE
//
//    // ───── Stage 1: InvertedResidual0─────
//    static data_t out1_ir0[OUT1_IR0_H][OUT1_IR0_W][OUT1_IR0_C]; // 112x112x16
//
//    enc1_ir0(out0_enc0, out1_ir0, enc1_dw_w, enc1_dw_b, enc1_pw_w, enc1_pw_b);
//    status |= (1u << 1);  // STAGE1_DONE
//
//    // ───── Stage 2: InvertedResidual1 (exp → dw → pw) ─────
//    static data_t out2_ir1[OUT2_IR1_H][OUT2_IR1_W][OUT2_IR1_C];  // 56x56x24
//
//    enc2_ir1(out1_ir0, out2_ir1,
//            enc2_ir1_exp_w, enc2_ir1_exp_b,
//            enc2_ir1_dw_w,  enc2_ir1_dw_b,
//            enc2_ir1_pw_w,  enc2_ir1_pw_b
//        );
//    status |= (1u << 2);  // STAGE2_DONE
//
//    // ───── Stage 3: enc3_ir2 (expand → dw → pw) ─────
//    static data_t out3_ir2[OUT3_IR2_H][OUT3_IR2_W][OUT3_IR2_C];
//    enc3_ir2(out2_ir1, out3_ir2,
//                 enc3_ir2_exp_w, enc3_ir2_exp_b,
//                 enc3_ir2_dw_w,  enc3_ir2_dw_b,
//                 enc3_ir2_pw_w,  enc3_ir2_pw_b);
//        status |= (1u << 3);
//
//   // ───── Stage 4: enc4_ir3 (expand → dw → pw) ─────
//   static data_t out4_ir3[OUT4_IR3_H][OUT4_IR3_W][OUT4_IR3_C];
//   enc4_ir3(out3_ir2, out4_ir3,
//		   enc4_ir3_exp_w, enc4_ir3_exp_b,
//           enc4_ir3_dw_w,  enc4_ir3_dw_b,
//		   enc4_ir3_pw_w,  enc4_ir3_pw_b);
//     status |= (1u << 4);
//
//     // ───── Stage 5: enc5_ir4 (expand → dw → pw) ─────
//     static data_t out5_ir4[OUT5_IR4_H][OUT5_IR4_W][OUT5_IR4_C];
//         enc5_ir4(out4_ir3, out5_ir4,
//                  enc5_ir4_exp_w, enc5_ir4_exp_b,
//                  enc5_ir4_dw_w,  enc5_ir4_dw_b,
//                  enc5_ir4_pw_w,  enc5_ir4_pw_b);
//         status |= (1u << 5);
//
//    // ───── Stage 6: enc6_ir5 (expand → dw → pw) ─────
//   static data_t out6_ir5[OUT6_IR5_H][OUT6_IR5_W][OUT6_IR5_C];
//          enc6_ir5(out5_ir4, out6_ir5,
//        		enc6_ir5_exp_w, enc6_ir5_exp_b,
//                enc6_ir5_dw_w,  enc6_ir5_dw_b,
//                enc6_ir5_pw_w,  enc6_ir5_pw_b);
//
//         status |= (1u << 6);
//
//    // ───── Stage 7: enc7_ir6 (expand → dw → pw) ─────
//    static data_t out7_ir6[OUT7_IR6_H][OUT7_IR6_W][OUT7_IR6_C];
//         enc7_ir6(out6_ir5, out7_ir6,
//                enc7_ir6_exp_w, enc7_ir6_exp_b,
//                enc7_ir6_dw_w,  enc7_ir6_dw_b,
//                enc7_ir6_pw_w,  enc7_ir6_pw_b);
//        status |= (1u << 7);
//
//   // ───── Stage 8: enc8_ir7 (expand → dw → pw) ─────
//   static data_t out8_ir7[OUT8_IR7_H][OUT8_IR7_W][OUT8_IR7_C];  // <-- output after encoder8_ir7
//        enc8_ir7(out7_ir6, out8_ir7,
//                     enc8_ir7_exp_w, enc8_ir7_exp_b,
//                     enc8_ir7_dw_w,  enc8_ir7_dw_b,
//                     enc8_ir7_pw_w,  enc8_ir7_pw_b);
//            status |= (1u << 8);
//
//   // ───── Stage 9: enc8_ir7 (expand → dw → pw) ─────
//        static data_t out9_ir8[OUT9_IR8_H][OUT9_IR8_W][OUT9_IR8_C];  // <-- output after encoder8_ir7
//         enc9_ir8(out8_ir7, out9_ir8,
//                         enc9_ir8_exp_w, enc9_ir8_exp_b,
//                         enc9_ir8_dw_w,  enc9_ir8_dw_b,
//                         enc9_ir8_pw_w,  enc9_ir8_pw_b);
//                status |= (1u << 9);
//
//   // ───── Stage 10: enc10_ir9 (expand → dw → pw) ─────
//      static data_t out10_ir9[OUT10_IR9_H][OUT10_IR9_W][OUT10_IR9_C];
//       enc10_ir9(out9_ir8, out10_ir9,
//    		   enc10_ir9_exp_w, enc10_ir9_exp_b,
//			   enc10_ir9_dw_w,  enc10_ir9_dw_b,
//			   enc10_ir9_pw_w,  enc10_ir9_pw_b);
//
//       	   	   status |= (1u << 10);
//
//  // ───── Stage 11: enc11_ir10 (expand → dw → pw) ─────
//  static data_t out11_ir10[OUT11_IR10_H][OUT11_IR10_W][OUT11_IR10_C];
//      enc11_ir10(out10_ir9, out11_ir10,
//    		  enc11_ir10_exp_w, enc11_ir10_exp_b,
//			  enc11_ir10_dw_w,  enc11_ir10_dw_b,
//			  enc11_ir10_pw_w,  enc11_ir10_pw_b);
//
//      status |= (1u << 11);
// // ───── Stage 12: enc12_ir11 (expand → dw → pw) ─────
//      static data_t out12_ir11[OUT12_IR11_H][OUT12_IR11_W][OUT12_IR11_C];
//      enc12_ir11(out11_ir10, out12_ir11,
//                 enc12_ir11_exp_w, enc12_ir11_exp_b,
//                 enc12_ir11_dw_w,  enc12_ir11_dw_b,
//                 enc12_ir11_pw_w,  enc12_ir11_pw_b);
//      status |= (1u << 12);
//
//
//      // ───── Stage 13: enc13_ir12 (expand → dw → pw) ─────
//      static data_t out13_ir12[OUT13_IR12_H][OUT13_IR12_W][OUT13_IR12_C];
//      enc13_ir12(out12_ir11, out13_ir12,
//                 enc13_ir12_exp_w, enc13_ir12_exp_b,
//                 enc13_ir12_dw_w,  enc13_ir12_dw_b,
//                 enc13_ir12_pw_w,  enc13_ir12_pw_b);
//      status |= (1u << 13);

      // ───── Stage 14: enc14_ir13 (expand → dw (stride=2) → pw) ────
      enc14_ir13(out13_ir12, out14_ir13,
                 enc14_ir13_exp_w, enc14_ir13_exp_b,
                 enc14_ir13_dw_w,  enc14_ir13_dw_b,
                 enc14_ir13_pw_w,  enc14_ir13_pw_b);
      status |= (1u << 14);


}
