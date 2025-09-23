#include "ap_fixed.h"
#include "lane_seg_top.h"


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
// Main Testbench
int main() {
    // Input / Output Buffers
    float image[IMG_HEIGHT][IMG_WIDTH][IMG_CHANNELS] = {0};
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
    data_t out10_ir9[OUT10_IR9_HEIGHT][OUT10_IR9_WIDTH][OUT10_IR9_CHANNELS] = {0};


    // AXI-Lite Debug Signals
    unsigned int ctrl = 0;
    unsigned int status = 0;
    unsigned int magic = 0;

    // === 1. Load image from .txt ===
    FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/test_imgs/img_rgb_224.txt", "r");
    if (!fp) {
        printf("Error: Could not open input image file.\n");
        return 1;
    }

    for (int c = 0; c < IMG_CHANNELS; c++) {
        for (int i = 0; i < IMG_HEIGHT; i++) {
            for (int j = 0; j < IMG_WIDTH; j++) {
                fscanf(fp, "%f", &image[i][j][c]);
            }
        }
    }
    printf("TESTBENCH DEBUG: image[0][0][0] = %f\n", image[0][0][0]);

    fclose(fp);
    printf("Loaded input image.\n");

    // === 2. Run HLS top function ===
    lane_seg_top(image, out10_ir9, ctrl, status, magic);


    // === 3. Debug Outputs ===
    printf("magic  = 0x%08X\n", magic);
    printf("status = 0x%08X\n", status);

    // === 4. Save output to file ===
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
    save_encoder10_ir9_output(out10_ir9, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc10_ir9_out.txt");


    return 0;
}
