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
// Decoder Stage 1 (dec1)
// Input:  14x14x256 (from dec0)
// Conv2d: 256 → 256, kernel=3, stride=1, padding=1
// Output: 14x14x256
#define OUT20_DEC1_HEIGHT   OUT19_DEC0_HEIGHT
#define OUT20_DEC1_WIDTH    OUT19_DEC0_WIDTH
#define OUT20_DEC1_CHANNELS 256

// ──────────────────────────────────────────────
// Decoder Stage 2 (dec2)
// Input:  14x14x256 (from dec1)
// ConvTranspose2d: 256 → 128, kernel=2, stride=2
// Output: 28x28x128
#define OUT21_DEC2_HEIGHT   (OUT20_DEC1_HEIGHT * 2)
#define OUT21_DEC2_WIDTH    (OUT20_DEC1_WIDTH * 2)
#define OUT21_DEC2_CHANNELS 128


// ──────────────────────────────────────────────
// Decoder Stage 3 (dec3)
// Input:  28x28x128 (from dec2)
// Conv2d: 128 → 128, kernel=3, stride=1, padding=1
// Output: 28x28x128
#define OUT22_DEC3_HEIGHT   OUT21_DEC2_HEIGHT
#define OUT22_DEC3_WIDTH    OUT21_DEC2_WIDTH
#define OUT22_DEC3_CHANNELS 128

// ──────────────────────────────────────────────
// Decoder Stage 4 (dec4)
// Input:  28x28x128 (from dec3)
// ConvTranspose2d: 128 → 64, kernel=2, stride=2
// Output: 56x56x64
#define OUT23_DEC4_HEIGHT   (OUT22_DEC3_HEIGHT * 2)
#define OUT23_DEC4_WIDTH    (OUT22_DEC3_WIDTH * 2)
#define OUT23_DEC4_CHANNELS 64

// ──────────────────────────────────────────────
// Decoder Stage 5 (dec5)
// Input:  56x56x64 (from dec4)
// Conv2d: 64 → 64, kernel=3, stride=1, padding=1
// Output: 56x56x64
#define OUT24_DEC5_HEIGHT   OUT23_DEC4_HEIGHT
#define OUT24_DEC5_WIDTH    OUT23_DEC4_WIDTH
#define OUT24_DEC5_CHANNELS 64

// ──────────────────────────────────────────────
// Decoder Stage 6 (dec6)
// Input:  56x56x64 (from dec5)
// ConvTranspose2d: 64 → 32, kernel=2, stride=2
// Output: 112x112x32
#define OUT25_DEC6_HEIGHT   (OUT24_DEC5_HEIGHT * 2)
#define OUT25_DEC6_WIDTH    (OUT24_DEC5_WIDTH * 2)
#define OUT25_DEC6_CHANNELS 32

// ──────────────────────────────────────────────
// Decoder Stage 7 (dec7)
// Input:  112x112x32 (from dec6)
// Conv2d: 32 → 32, kernel=3, stride=1, padding=1
// Output: 112x112x32
#define OUT26_DEC7_HEIGHT   OUT25_DEC6_HEIGHT
#define OUT26_DEC7_WIDTH    OUT25_DEC6_WIDTH
#define OUT26_DEC7_CHANNELS 32

// ──────────────────────────────────────────────
// Decoder Stage 8 (dec8)
// Input:  112x112x32 (from dec7)
// Conv2d: 32 → 1, kernel=1, stride=1, padding=0
// Output: 112x112x1
#define OUT27_DEC8_HEIGHT   OUT26_DEC7_HEIGHT
#define OUT27_DEC8_WIDTH    OUT26_DEC7_WIDTH
#define OUT27_DEC8_CHANNELS 1



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
// Save dec1 output feature maps to file
void save_decoder1_output(data_t out[OUT20_DEC1_HEIGHT][OUT20_DEC1_WIDTH][OUT20_DEC1_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT20_DEC1_CHANNELS; c++) {
        for (int i = 0; i < OUT20_DEC1_HEIGHT; i++) {
            for (int j = 0; j < OUT20_DEC1_WIDTH; j++) {
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
// Save dec2 output feature maps to file
void save_decoder2_output(data_t out[OUT21_DEC2_HEIGHT][OUT21_DEC2_WIDTH][OUT21_DEC2_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT21_DEC2_CHANNELS; c++) {
        for (int i = 0; i < OUT21_DEC2_HEIGHT; i++) {
            for (int j = 0; j < OUT21_DEC2_WIDTH; j++) {
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
// Save dec3 output feature maps to file
void save_decoder3_output(data_t out[OUT22_DEC3_HEIGHT][OUT22_DEC3_WIDTH][OUT22_DEC3_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT22_DEC3_CHANNELS; c++) {
        for (int i = 0; i < OUT22_DEC3_HEIGHT; i++) {
            for (int j = 0; j < OUT22_DEC3_WIDTH; j++) {
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
// Save dec4 output feature maps to file
void save_decoder4_output(data_t out[OUT23_DEC4_HEIGHT][OUT23_DEC4_WIDTH][OUT23_DEC4_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT23_DEC4_CHANNELS; c++) {
        for (int i = 0; i < OUT23_DEC4_HEIGHT; i++) {
            for (int j = 0; j < OUT23_DEC4_WIDTH; j++) {
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
// Save dec5 output feature maps to file
void save_decoder5_output(data_t out[OUT24_DEC5_HEIGHT][OUT24_DEC5_WIDTH][OUT24_DEC5_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT24_DEC5_CHANNELS; c++) {
        for (int i = 0; i < OUT24_DEC5_HEIGHT; i++) {
            for (int j = 0; j < OUT24_DEC5_WIDTH; j++) {
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
// Save dec6 output feature maps to file
void save_decoder6_output(data_t out[OUT25_DEC6_HEIGHT][OUT25_DEC6_WIDTH][OUT25_DEC6_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT25_DEC6_CHANNELS; c++) {
        for (int i = 0; i < OUT25_DEC6_HEIGHT; i++) {
            for (int j = 0; j < OUT25_DEC6_WIDTH; j++) {
                fprintf(f, "%.4f ", (float)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save dec7 output feature maps to file
void save_decoder7_output(data_t out[OUT26_DEC7_HEIGHT][OUT26_DEC7_WIDTH][OUT26_DEC7_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT26_DEC7_CHANNELS; c++) {
        for (int i = 0; i < OUT26_DEC7_HEIGHT; i++) {
            for (int j = 0; j < OUT26_DEC7_WIDTH; j++) {
                fprintf(f, "%.6f ", (half)out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

// ──────────────────────────────────────────────
// Save dec8 output feature maps to file
void save_decoder8_output(data_t out[OUT27_DEC8_HEIGHT][OUT27_DEC8_WIDTH][OUT27_DEC8_CHANNELS],
                          const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT27_DEC8_CHANNELS; c++) {
        for (int i = 0; i < OUT27_DEC8_HEIGHT; i++) {
            for (int j = 0; j < OUT27_DEC8_WIDTH; j++) {
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
    //data_t out18_cnv[OUT18_CNV_HEIGHT][OUT18_CNV_WIDTH][OUT18_CNV_CHANNELS]     = {0};

	//data_t out19_dec0[OUT19_DEC0_HEIGHT][OUT19_DEC0_WIDTH][OUT19_DEC0_CHANNELS] = {0}; //
	//data_t out20_dec1[OUT20_DEC1_HEIGHT][OUT20_DEC1_WIDTH][OUT20_DEC1_CHANNELS] = {0}; //
	//data_t out21_dec2[OUT21_DEC2_HEIGHT][OUT21_DEC2_WIDTH][OUT21_DEC2_CHANNELS] = {0}; //
	//data_t out22_dec3[OUT22_DEC3_HEIGHT][OUT22_DEC3_WIDTH][OUT22_DEC3_CHANNELS] = {0};
	//data_t out23_dec4[OUT23_DEC4_HEIGHT][OUT23_DEC4_WIDTH][OUT23_DEC4_CHANNELS] = {0};
	//data_t  out24_dec5[OUT24_DEC5_HEIGHT][OUT24_DEC5_WIDTH][OUT24_DEC5_CHANNELS] = {0};
	//data_t out25_dec6[OUT25_DEC6_HEIGHT][OUT25_DEC6_WIDTH][OUT25_DEC6_CHANNELS] = {0};
    float out26_dec7[OUT26_DEC7_HEIGHT][OUT26_DEC7_WIDTH][OUT26_DEC7_CHANNELS] = {0};
    data_t out27_dec8[OUT27_DEC8_HEIGHT][OUT27_DEC8_WIDTH][OUT27_DEC8_CHANNELS] = {0};




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
    //    FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/enc18_cnv_out.txt", "r");
    //    if (!fp) {
    //    	printf("Error: Could not open input image file.\n");
    //    	return 1;
    //    }
    //    for (int c = 0; c < OUT18_CNV_CHANNELS; c++) { //int c = 0; c < OUT19_DEC0_CHANNELS; c++
    //    	for (int i = 0; i < OUT18_CNV_HEIGHT; i++) {
    //    		for (int j = 0; j < OUT18_CNV_WIDTH; j++) {
    //    			fscanf(fp, "%f", &out18_cnv[i][j][c]);
    //    		}
    //    	}
    //    }
    //    printf("TESTBENCH DEBUG: out18_cnv[0][0][0] = %f\n", out18_cnv[0][0][0]);
    //
    //    fclose(fp);
    //    printf("Loaded input out18_cnv.\n");

    // === 3. Load output out19_dec0 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out19_dec0.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out19_dec0.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT19_DEC0_CHANNELS; c++) {
    //    for (int i = 0; i < OUT19_DEC0_HEIGHT; i++) {
    //        for (int j = 0; j < OUT19_DEC0_WIDTH; j++) {
    //            fscanf(fp, "%f", &out19_dec0[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out19_dec0[0][0][0] = %f\n", out19_dec0[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input out19_dec0.\n");

    // === 3. Load output out20_dec1 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/ML_PATH_EE297/EE297_env/01_main/03_lanes_code/software_output/sw_decoder1_output.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out20_dec1.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT20_DEC1_CHANNELS; c++) {
    //    for (int i = 0; i < OUT20_DEC1_HEIGHT; i++) {
    //        for (int j = 0; j < OUT20_DEC1_WIDTH; j++) {
    //            fscanf(fp, "%f", &out20_dec1[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out20_dec1[0][0][0] = %f\n", out20_dec1[0][0][0]);
    //
    //fclose(fp);
    //printf("Loaded input out20_dec1.\n");

    // === 3. Load output out21_dec2 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out21_dec2.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out21_dec2.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT21_DEC2_CHANNELS; c++) {
    //    for (int i = 0; i < OUT21_DEC2_HEIGHT; i++) {
    //        for (int j = 0; j < OUT21_DEC2_WIDTH; j++) {
    //            fscanf(fp, "%f", &out21_dec2[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out21_dec2[0][0][0] = %f\n", out21_dec2[0][0][0]);
    //fclose(fp);
    //printf("Loaded input out21_dec2.\n");

    // === 3. Load output out22_dec3 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out22_dec3.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out22_dec3.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT22_DEC3_CHANNELS; c++) {
    //    for (int i = 0; i < OUT22_DEC3_HEIGHT; i++) {
    //        for (int j = 0; j < OUT22_DEC3_WIDTH; j++) {
    //            fscanf(fp, "%f", &out22_dec3[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out22_dec3[0][0][0] = %f\n", out22_dec3[0][0][0]);
    //fclose(fp);
    //printf("Loaded input out22_dec3.\n");

    // === 3. Load output out23_dec4 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out23_dec4.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out23_dec4.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT23_DEC4_CHANNELS; c++) {
    //    for (int i = 0; i < OUT23_DEC4_HEIGHT; i++) {
    //        for (int j = 0; j < OUT23_DEC4_WIDTH; j++) {
    //            fscanf(fp, "%f", &out23_dec4[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out23_dec4[0][0][0] = %f\n", out23_dec4[0][0][0]);
    //fclose(fp);
    //printf("Loaded input out23_dec4.\n");

    // === 3. Load output out24_dec5 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out24_dec5.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out24_dec5.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT24_DEC5_CHANNELS; c++) {
    //    for (int i = 0; i < OUT24_DEC5_HEIGHT; i++) {
    //        for (int j = 0; j < OUT24_DEC5_WIDTH; j++) {
    //            fscanf(fp, "%f", &out24_dec5[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out24_dec5[0][0][0] = %f\n", out24_dec5[0][0][0]);
    //fclose(fp);
    //printf("Loaded input out24_dec5.\n");
    
    // === 1. Load output out25_dec6 from .txt ===
    //FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out25_dec6.txt", "r");
    //if (!fp) {
    //    printf("Error: Could not open out25_dec6.txt\n");
    //    return 1;
    //}
    //for (int c = 0; c < OUT25_DEC6_CHANNELS; c++) {
    //    for (int i = 0; i < OUT25_DEC6_HEIGHT; i++) {
    //        for (int j = 0; j < OUT25_DEC6_WIDTH; j++) {
    //            fscanf(fp, "%f", &out25_dec6[i][j][c]);
    //        }
    //    }
    //}
    //printf("TESTBENCH DEBUG: out25_dec6[0][0][0] = %f\n", out25_dec6[0][0][0]);
    //fclose(fp);
    //printf("Loaded input out25_dec6.\n");

    // === 1. Load output out26_dec7 from .txt ===
    FILE* fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/ML_PATH_EE297/EE297_env/01_main/03_lanes_code/software_output/sw_decoder7_output.txt", "r");
    if (!fp) {
        printf("Error: Could not open out26_dec7.txt\n");
        return 1;
    }

    for (int c = 0; c < OUT26_DEC7_CHANNELS; c++) {
        for (int i = 0; i < OUT26_DEC7_HEIGHT; i++) {
            for (int j = 0; j < OUT26_DEC7_WIDTH; j++) {
                fscanf(fp, "%f", &out26_dec7[i][j][c]);
            }
        }
    }
    printf("TESTBENCH DEBUG: out26_dec7[0][0][0] = %f\n", out26_dec7[0][0][0]);
    fclose(fp);
    printf("Loaded input out26_dec7.\n");
    
    
    // === 3. Run HLS top function ===
    //lane_seg_top(image, out14_ir13, ctrl, status, magic); <- Change back when finished.

    lane_seg_top(out26_dec7, out27_dec8, ctrl, status, magic);


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
    //save_decoder0_output(out19_dec0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out19_dec0.txt");
    //save_decoder1_output(out20_dec1, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out20_dec1.txt");
    //save_decoder2_output(out21_dec2, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out21_dec2.txt");
    //save_decoder3_output(out22_dec3, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out22_dec3.txt");
    //save_decoder4_output(out23_dec4, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out23_dec4.txt");
    //save_decoder5_output(out24_dec5, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out24_dec5.txt");
    //save_decoder6_output(out25_dec6, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out25_dec6.txt");
    //save_decoder7_output(out26_dec7, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out26_dec7.txt");
    save_decoder8_output(out27_dec8, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/out27_dec8.txt");




    return 0;
}
