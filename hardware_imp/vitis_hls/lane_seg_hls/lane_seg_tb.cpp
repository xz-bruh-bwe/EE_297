#include "ap_fixed.h"
#include "lane_seg_top.h"
#include "hls_stream.h"


// ──────────────────────────────────────────────
// Image and Feature Map Dimensions
#define IMG_HEIGHT     224
#define IMG_WIDTH      224
#define IMG_CHANNELS   3

#define OUT_HEIGHT     112
#define OUT_WIDTH      112
#define OUT_CHANNELS   32

// ──────────────────────────────────────────────
//Inverted Residual 0
#define OUT1_IR0_HEIGHT   112
#define OUT1_IR0_WIDTH    112
#define OUT1_IR0_CHANNELS 16

// ──────────────────────────────────────────────
// Inverted Residual 1
#define OUT2_IR1_HEIGHT   56
#define OUT2_IR1_WIDTH    56
#define OUT2_IR1_CHANNELS 24

// ──────────────────────────────────────────────
// Inverted Residual 2 (enc3_ir2)
#define OUT3_IR2_HEIGHT   56
#define OUT3_IR2_WIDTH    56
#define OUT3_IR2_CHANNELS 24

// ──────────────────────────────────────────────
// Inverted Residual 3 (enc4_ir3)
#define OUT4_IR3_HEIGHT   28
#define OUT4_IR3_WIDTH    28
#define OUT4_IR3_CHANNELS 32

// ──────────────────────────────────────────────
// Inverted Residual 4 (enc5_ir4)
#define OUT5_IR4_HEIGHT   28
#define OUT5_IR4_WIDTH    28
#define OUT5_IR4_CHANNELS 32

// ──────────────────────────────────────────────
// Inverted Residual 5 (enc6_ir5)
#define OUT6_IR5_HEIGHT   28
#define OUT6_IR5_WIDTH    28
#define OUT6_IR5_CHANNELS 32

// ──────────────────────────────────────────────
// Inverted Residual 6 (enc7_ir6)
#define OUT7_IR6_HEIGHT   14
#define OUT7_IR6_WIDTH    14
#define OUT7_IR6_CHANNELS 64

// ──────────────────────────────────────────────
// Inverted Residual 7 (enc8_ir7)
#define OUT8_IR7_HEIGHT   14
#define OUT8_IR7_WIDTH    14
#define OUT8_IR7_CHANNELS 64

// ──────────────────────────────────────────────
// Inverted Residual 8 (enc9_ir8)
#define OUT9_IR8_HEIGHT   14
#define OUT9_IR8_WIDTH    14
#define OUT9_IR8_CHANNELS 64

// ──────────────────────────────────────────────
// Inverted Residual 9 (enc10_ir9)
#define OUT10_IR9_HEIGHT   14
#define OUT10_IR9_WIDTH    14
#define OUT10_IR9_CHANNELS 64

// ──────────────────────────────────────────────
// Inverted Residual 10 (enc11_ir10)
#define OUT11_IR10_HEIGHT   14
#define OUT11_IR10_WIDTH    14
#define OUT11_IR10_CHANNELS 96

// ──────────────────────────────────────────────
// Inverted Residual 11 (enc12_ir11)
#define OUT12_IR11_HEIGHT   14
#define OUT12_IR11_WIDTH    14
#define OUT12_IR11_CHANNELS 96

// ──────────────────────────────────────────────
// Inverted Residual 12 (enc13_ir12)
#define OUT13_IR12_HEIGHT   14
#define OUT13_IR12_WIDTH    14
#define OUT13_IR12_CHANNELS 96

// ──────────────────────────────────────────────
// Inverted Residual 13 (enc14_ir13)
#define OUT14_IR13_HEIGHT   7
#define OUT14_IR13_WIDTH    7
#define OUT14_IR13_CHANNELS 160

// ──────────────────────────────────────────────
// Inverted Residual 15 (enc15_ir14)
#define OUT15_IR14_HEIGHT   7
#define OUT15_IR14_WIDTH    7
#define OUT15_IR14_CHANNELS 160

// ──────────────────────────────────────────────
// Inverted Residual 16 (enc16_ir15)
#define OUT16_IR15_HEIGHT   7
#define OUT16_IR15_WIDTH    7
#define OUT16_IR15_CHANNELS 160

// ──────────────────────────────────────────────
// Inverted Residual 17 (enc17_ir16)
#define OUT17_IR16_HEIGHT   7
#define OUT17_IR16_WIDTH    7
#define OUT17_IR16_CHANNELS 320

// ──────────────────────────────────────────────
// Conv2dNormActivation 18 (enc18_cnv)
#define OUT18_CNV_HEIGHT    7
#define OUT18_CNV_WIDTH     7
#define OUT18_CNV_CHANNELS  1280

// ──────────────────────────────────────────────
// Decoder Stage 0 (dec0)
// Input:  7x7x1280 (from enc18_cnv)
// Output: 14x14x256
#define OUT19_DEC0_HEIGHT   14
#define OUT19_DEC0_WIDTH    14
#define OUT19_DEC0_CHANNELS 256


// ──────────────────────────────────────────────
// Save encoder0 output feature maps to file
void save_encoder0_output(data_t out[OUT_HEIGHT][OUT_WIDTH][OUT_CHANNELS], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT_CHANNELS; c++) {
        for (int i = 0; i < OUT_HEIGHT; i++) {
            for (int j = 0; j < OUT_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");  // Blank line between channels
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc1_ir0 output feature maps to file
void save_encoder1_ir0_output(data_t out[OUT1_IR0_HEIGHT][OUT1_IR0_WIDTH][OUT1_IR0_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT1_IR0_CHANNELS; c++) {
        for (int i = 0; i < OUT1_IR0_HEIGHT; i++) {
            for (int j = 0; j < OUT1_IR0_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");  // Blank line between channels
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc2_ir1 output feature maps to file
void save_encoder2_ir1_output(data_t out[OUT2_IR1_HEIGHT][OUT2_IR1_WIDTH][OUT2_IR1_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT2_IR1_CHANNELS; c++) {
        for (int i = 0; i < OUT2_IR1_HEIGHT; i++) {
            for (int j = 0; j < OUT2_IR1_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc3_ir2 output feature maps to file
void save_encoder3_ir2_output(data_t out[OUT3_IR2_HEIGHT][OUT3_IR2_WIDTH][OUT3_IR2_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT3_IR2_CHANNELS; c++) {
        for (int i = 0; i < OUT3_IR2_HEIGHT; i++) {
            for (int j = 0; j < OUT3_IR2_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc4_ir3 output feature maps to file
void save_encoder4_ir3_output(data_t out[OUT4_IR3_HEIGHT][OUT4_IR3_WIDTH][OUT4_IR3_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT4_IR3_CHANNELS; c++) {
        for (int i = 0; i < OUT4_IR3_HEIGHT; i++) {
            for (int j = 0; j < OUT4_IR3_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc5_ir4 output feature maps to file
void save_encoder5_ir4_output(data_t out[OUT5_IR4_HEIGHT][OUT5_IR4_WIDTH][OUT5_IR4_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT5_IR4_CHANNELS; c++) {
        for (int i = 0; i < OUT5_IR4_HEIGHT; i++) {
            for (int j = 0; j < OUT5_IR4_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc6_ir5 output feature maps to file
void save_encoder6_ir5_output(data_t out[OUT6_IR5_HEIGHT][OUT6_IR5_WIDTH][OUT6_IR5_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT6_IR5_CHANNELS; c++) {
        for (int i = 0; i < OUT6_IR5_HEIGHT; i++) {
            for (int j = 0; j < OUT6_IR5_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc7_ir6 output feature maps to file
void save_encoder7_ir6_output(data_t out[OUT7_IR6_HEIGHT][OUT7_IR6_WIDTH][OUT7_IR6_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT7_IR6_CHANNELS; c++) {
        for (int i = 0; i < OUT7_IR6_HEIGHT; i++) {
            for (int j = 0; j < OUT7_IR6_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc8_ir7 output feature maps to file
void save_encoder8_ir7_output(data_t out[OUT8_IR7_HEIGHT][OUT8_IR7_WIDTH][OUT8_IR7_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT8_IR7_CHANNELS; c++) {
        for (int i = 0; i < OUT8_IR7_HEIGHT; i++) {
            for (int j = 0; j < OUT8_IR7_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc9_ir8 output feature maps to file
void save_encoder9_ir8_output(data_t out[OUT9_IR8_HEIGHT][OUT9_IR8_WIDTH][OUT9_IR8_CHANNELS],
                              const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT9_IR8_CHANNELS; c++) {
        for (int i = 0; i < OUT9_IR8_HEIGHT; i++) {
            for (int j = 0; j < OUT9_IR8_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc10_ir9 output feature maps to file
void save_encoder10_ir9_output(data_t out[OUT10_IR9_HEIGHT][OUT10_IR9_WIDTH][OUT10_IR9_CHANNELS],
                               const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT10_IR9_CHANNELS; c++) {
        for (int i = 0; i < OUT10_IR9_HEIGHT; i++) {
            for (int j = 0; j < OUT10_IR9_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc11_ir10 output feature maps to file
void save_encoder11_ir10_output(data_t out[OUT11_IR10_HEIGHT][OUT11_IR10_WIDTH][OUT11_IR10_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT11_IR10_CHANNELS; c++) {
        for (int i = 0; i < OUT11_IR10_HEIGHT; i++) {
            for (int j = 0; j < OUT11_IR10_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc12_ir11 output feature maps to file
void save_encoder12_ir11_output(data_t out[OUT12_IR11_HEIGHT][OUT12_IR11_WIDTH][OUT12_IR11_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT12_IR11_CHANNELS; c++) {
        for (int i = 0; i < OUT12_IR11_HEIGHT; i++) {
            for (int j = 0; j < OUT12_IR11_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc13_ir12 output feature maps to file
void save_encoder13_ir12_output(data_t out[OUT13_IR12_HEIGHT][OUT13_IR12_WIDTH][OUT13_IR12_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT13_IR12_CHANNELS; c++) {
        for (int i = 0; i < OUT13_IR12_HEIGHT; i++) {
            for (int j = 0; j < OUT13_IR12_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc14_ir13 output feature maps to file
void save_encoder14_ir13_output(data_t out[OUT14_IR13_HEIGHT][OUT14_IR13_WIDTH][OUT14_IR13_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT14_IR13_CHANNELS; c++) {
        for (int i = 0; i < OUT14_IR13_HEIGHT; i++) {
            for (int j = 0; j < OUT14_IR13_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc15_ir14 output feature maps to file
void save_encoder15_ir14_output(data_t out[OUT15_IR14_HEIGHT][OUT15_IR14_WIDTH][OUT15_IR14_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT15_IR14_CHANNELS; c++) {
        for (int i = 0; i < OUT15_IR14_HEIGHT; i++) {
            for (int j = 0; j < OUT15_IR14_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc16_ir15 output feature maps to file
void save_encoder16_ir15_output(data_t out[OUT16_IR15_HEIGHT][OUT16_IR15_WIDTH][OUT16_IR15_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT16_IR15_CHANNELS; c++) {
        for (int i = 0; i < OUT16_IR15_HEIGHT; i++) {
            for (int j = 0; j < OUT16_IR15_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save enc17_ir16 output feature maps to file
void save_encoder17_ir16_output(data_t out[OUT17_IR16_HEIGHT][OUT17_IR16_WIDTH][OUT17_IR16_CHANNELS],
                                const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT17_IR16_CHANNELS; c++) {
        for (int i = 0; i < OUT17_IR16_HEIGHT; i++) {
            for (int j = 0; j < OUT17_IR16_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}


// ──────────────────────────────────────────────
// Save enc18_cnv output feature maps to file
void save_encoder18_cnv_output(data_t out[OUT18_CNV_HEIGHT][OUT18_CNV_WIDTH][OUT18_CNV_CHANNELS],
                               const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT18_CNV_CHANNELS; c++) {
        for (int i = 0; i < OUT18_CNV_HEIGHT; i++) {
            for (int j = 0; j < OUT18_CNV_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save dec0 output feature maps to file
void save_decoder0_output(data_t out[OUT19_DEC0_HEIGHT][OUT19_DEC0_WIDTH][OUT19_DEC0_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT19_DEC0_CHANNELS; c++) {
        for (int i = 0; i < OUT19_DEC0_HEIGHT; i++) {
            for (int j = 0; j < OUT19_DEC0_WIDTH; j++) {
                fprintf(f, "%.6f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}



// ──────────────────────────────────────────────
// Main Testbench
int main() {
    // Input / Output Buffers
    //float image[IMG_HEIGHT][IMG_WIDTH][IMG_CHANNELS] = {0};
    //data_t out0[OUT_HEIGHT][OUT_WIDTH][OUT_CHANNELS] = {0};
    //data_t out1_ir0[OUT1_IR0_HEIGHT][OUT1_IR0_WIDTH][OUT1_IR0_CHANNELS] = {0};
    //data_t out2_ir1[OUT2_IR1_HEIGHT][OUT2_IR1_WIDTH][OUT2_IR1_CHANNELS] = {0};
    //data_t out3_ir2[OUT3_IR2_HEIGHT][OUT3_IR2_WIDTH][OUT3_IR2_CHANNELS] = {0};
    //data_t out4_ir3[OUT4_IR3_HEIGHT][OUT4_IR3_WIDTH][OUT4_IR3_CHANNELS] = {0};
    //data_t out5_ir4[OUT5_IR4_HEIGHT][OUT5_IR4_WIDTH][OUT5_IR4_CHANNELS] = {0};
    //data_t out6_ir5[OUT6_IR5_HEIGHT][OUT6_IR5_WIDTH][OUT6_IR5_CHANNELS] = {0};
    //data_t out7_ir6[OUT7_IR6_HEIGHT][OUT7_IR6_WIDTH][OUT7_IR6_CHANNELS] = {0};
    //data_t out8_ir7[OUT8_IR7_HEIGHT][OUT8_IR7_WIDTH][OUT8_IR7_CHANNELS] = {0};
    //data_t out9_ir8[OUT9_IR8_HEIGHT][OUT9_IR8_WIDTH][OUT9_IR8_CHANNELS] = {0};
    //data_t out10_ir9[OUT10_IR9_HEIGHT][OUT10_IR9_WIDTH][OUT10_IR9_CHANNELS] = {0};
    //data_t out11_ir10[OUT11_IR10_HEIGHT][OUT11_IR10_WIDTH][OUT11_IR10_CHANNELS] = {0};
    //data_t out12_ir11[OUT12_IR11_HEIGHT][OUT12_IR11_WIDTH][OUT12_IR11_CHANNELS] = {0};

	//data_t out13_ir12[OUT13_IR12_HEIGHT][OUT13_IR12_WIDTH][OUT13_IR12_CHANNELS] = {0};
    //data_t out14_ir13[OUT14_IR13_HEIGHT][OUT14_IR13_WIDTH][OUT14_IR13_CHANNELS] = {0};
	//data_t out15_ir14[OUT15_IR14_HEIGHT][OUT15_IR14_WIDTH][OUT15_IR14_CHANNELS] = {0};
    //data_t out16_ir15[OUT16_IR15_HEIGHT][OUT16_IR15_WIDTH][OUT16_IR15_CHANNELS] = {0};
    //data_t out17_ir16[OUT17_IR16_HEIGHT][OUT17_IR16_WIDTH][OUT17_IR16_CHANNELS] = {0};
    float out18_cnv[OUT18_CNV_HEIGHT][OUT18_CNV_WIDTH][OUT18_CNV_CHANNELS]    = {0}; // <- New Input
    data_t out19_dec0[OUT19_DEC0_HEIGHT][OUT19_DEC0_WIDTH][OUT19_DEC0_CHANNELS] = {0}; // output

    // Streams for weights and biases
    hls::stream<float> dec0_w; // comment out later
    hls::stream<float> dec0_b; // comment out later




    // AXI-Lite Debug Signals
    unsigned int ctrl = 0;
    unsigned int status = 0;
    unsigned int magic = 0;

    // === 1. Load image from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/test_imgs/img_rgb_224.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open input image file.\n");
    //    return 1;
    //}
    //
    //for (int c = 0; c < IMG_CHANNELS; c++) {
    //    for (int i = 0; i < IMG_HEIGHT; i++) {
    //        for (int j = 0; j < IMG_WIDTH; j++) {
    //            fscanf(fp, "%f", &image[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: image[0][0][0] = %f\n", image[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input image.\n");
    // === // === // === // === // === // === // === // === // === // === // === // === // === // === // === // === // === // === // ===

    // === 2. Load output out13_ir12 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc13_ir12_out.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open input image file.\n");
    //    return 1;
    //}
    //
    //for (int c = 0; c < OUT13_IR12_CHANNELS; c++) {
    //    for (int i = 0; i < OUT13_IR12_HEIGHT; i++) {
    //        for (int j = 0; j < OUT13_IR12_WIDTH; j++) {
    //            fscanf(fp, "%f", &out13_ir12[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out13_ir12[0][0][0] = %f\n", out13_ir12[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input out13_ir12.\n");

    // === 3. Load output out15_ir14 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc15_ir14_out.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open input image file.\n");
    //    return 1;
    //}
    //
    //for (int c = 0; c < OUT15_IR14_CHANNELS; c++) {
    //    for (int i = 0; i < OUT15_IR14_HEIGHT; i++) {
    //        for (int j = 0; j < OUT15_IR14_WIDTH; j++) {
    //            fscanf(fp, "%f", &out15_ir14[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out15_ir14[0][0][0] = %f\n", out15_ir14[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input out15_ir14.\n");


    // === 3. Load output out16_ir15 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc16_ir15_out.txt", "r");
    //if (!fp) {
    //	printf("Error: Could not open input image file.\n");
    //	return 1;
    //}
    //
    //for (int c = 0; c < OUT16_IR15_CHANNELS; c++) {
    //	for (int i = 0; i < OUT16_IR15_HEIGHT; i++) {
    //		for (int j = 0; j < OUT16_IR15_WIDTH; j++) {
    //			fscanf(fp, "%f", &out16_ir15[i][j][c]);
    //		}
    //	}
    //}
    //printf("TESTBENCH DEBUG: out16_ir15[0][0][0] = %f\n", out16_ir15[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input out16_ir15.\n");

    //// === 3. Load output out16_ir15 from .txt ===
    //    FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc16_ir15_out.txt", "r");
    //    if (!fp) {
    //    	printf("Error: Could not open input image file.\n");
    //    	return 1;
    //    }
    //
    //    for (int c = 0; c < OUT16_IR15_CHANNELS; c++) {
    //    	for (int i = 0; i < OUT16_IR15_HEIGHT; i++) {
    //    		for (int j = 0; j < OUT16_IR15_WIDTH; j++) {
    //    			fscanf(fp, "%f", &out16_ir15[i][j][c]);
    //    		}
    //    	}
    //    }
    //    printf("TESTBENCH DEBUG: out16_ir15[0][0][0] = %f\n", out16_ir15[0][0][0]);
    //
    //    fclose(fp);
    //    printf("Loaded input out16_ir15.\n");
    //
    //
    //
    //

    // === 3. Load output out17_ir16 from .txt ===
    //    FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc17_ir16_out.txt", "r");
    //    if (!fp) {
    //    	printf("Error: Could not open input image file.\n");
    //    	return 1;
    //    }
    //
    //    for (int c = 0; c < OUT18_CNV_CHANNELS; c++) {
    //    	for (int i = 0; i < OUT18_CNV_HEIGHT; i++) {
    //    		for (int j = 0; j < OUT18_CNV_WIDTH; j++) {
    //    			fscanf(fp, "%f", &out17_ir16[i][j][c]);
    //    		}
    //    	}
    //    }
    //    printf("TESTBENCH DEBUG: out17_ir16[0][0][0] = %f\n", out17_ir16[0][0][0]);
    //
    //    fclose(fp);
    //    printf("Loaded input out17_ir16.\n");
    
    // === 3. Load output out18_cnv from .txt ===
        FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc18_cnv_out.txt", "r");
        if (!fp) {
        	printf("Error: Could not open input image file.\n");
        	return 1;
        }
        for (int c = 0; c < OUT18_CNV_CHANNELS; c++) { //int c = 0; c < OUT19_DEC0_CHANNELS; c++
        	for (int i = 0; i < OUT18_CNV_HEIGHT; i++) {
        		for (int j = 0; j < OUT18_CNV_WIDTH; j++) {
        			fscanf(fp, "%f", &out18_cnv[i][j][c]);
        		}
        	}
        }
        printf("TESTBENCH DEBUG: out18_cnv[0][0][0] = %f\n", out18_cnv[0][0][0]);
    
        fclose(fp);
        printf("Loaded input out18_cnv.\n");


        // === Load biases into stream ===
        FILE* fb = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/ML_PATH_EE297/EE297_env/01_main/03_lanes_code/weights/dec0_b.txt", "r");
        if (!fb) { printf("Error: Could not open dec0_b.txt\n"); return 1; }

        int print_limit = 5;
        for (int oc = 0; oc < OUT19_DEC0_CHANNELS; oc++) {
            float tmp;
            if (fscanf(fb, "%f", &tmp) != 1) { printf("Error reading dec0_b at oc=%d\n", oc); return 2; }
            dec0_b.write(tmp);
            if (oc < print_limit) printf("dec0_b[%d] = %f\n", oc, tmp);  // (label fixed)
        }
        fclose(fb);
        printf("Streamed dec0 biases.\n");

        // === Load weights into stream ===
        FILE* fw = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/ML_PATH_EE297/EE297_env/01_main/03_lanes_code/weights/dec0_w.txt", "r");
        if (!fw) { printf("Error: Could not open dec0_w.txt\n"); return 1; }

        long long count = 0;
        const long long expected = 2LL * 2LL * OUT18_CNV_CHANNELS * OUT19_DEC0_CHANNELS;

        for (int ky = 0; ky < 2; ky++) {
            for (int kx = 0; kx < 2; kx++) {
                for (int ic = 0; ic < OUT18_CNV_CHANNELS; ic++) {
                    for (int oc = 0; oc < OUT19_DEC0_CHANNELS; oc++) {
                        float tmp;
                        if (fscanf(fw, "%f", &tmp) != 1) {
                            printf("Error reading dec0_w at (ky=%d,kx=%d,ic=%d,oc=%d) after %lld values\n",
                                   ky, kx, ic, oc, count);
                            fclose(fw);
                            return 3;
                        }
                        dec0_w.write(tmp);
                        count++;
                    }
                }
            }
        }
        fclose(fw);
        printf("Streamed dec0 weights (%lld of %lld).\n", count, expected);



    // === 3. Run HLS top function ===
    //lane_seg_top(image, out14_ir13, ctrl, status, magic); <- Change back when finished.

    //lane_seg_top(out18_cnv, out19_dec0, ctrl, status, magic);
    lane_seg_top(out18_cnv, out19_dec0, dec0_w, dec0_b, ctrl, status, magic);




    // === 4. Debug Outputs ===
    printf("magic  = 0x%08X\n", magic);
    printf("status = 0x%08X\n", status);

    // === 5. Save output to file ===
    //save_encoder0_output(out0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/encoder0_out.txt");
    //save_encoder1_ir0_output(out1_ir0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc0_ir0_out.txt");
    //save_encoder2_ir1_output(out2_ir1, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc2_ir1_out.txt");
    //save_encoder3_ir2_output(out3_ir2, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc3_ir2_out.txt");
    //save_encoder4_ir3_output(out4_ir3, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc4_ir3_out.txt");
    //save_encoder5_ir4_output(out5_ir4, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc5_ir4_out.txt");
    //save_encoder6_ir5_output(out6_ir5, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc6_ir5_out.txt");
    //save_encoder7_ir6_output(out7_ir6, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc7_ir6_out.txt");
    //save_encoder8_ir7_output(out8_ir7, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc8_ir7_out.txt");
    //save_encoder9_ir8_output(out9_ir8, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc9_ir8_out.txt");
    //save_encoder10_ir9_output(out10_ir9, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc10_ir9_out.txt");
    //save_encoder11_ir10_output(out11_ir10, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc11_ir10_out.txt");
    //save_encoder12_ir11_output(out12_ir11, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc12_ir11_out.txt");
    //save_encoder13_ir12_output(out13_ir12, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc13_ir12_out.txt");
    //save_encoder14_ir13_output(out14_ir13, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc14_ir13_out.txt");
    //save_encoder15_ir14_output(out15_ir14, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc15_ir14_out.txt");
    //save_encoder16_ir15_output(out16_ir15, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc16_ir15_out.txt");
    //save_encoder17_ir16_output(out17_ir16, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc17_ir16_out.txt");
    //save_encoder18_cnv_output(out18_cnv,   "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc18_cnv_out.txt");
    save_decoder0_output(out19_dec0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out19_dec0.txt");



    return 0;
}
