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
// Main Testbench
int main() {
    // Input / Output Buffers
    data_t image[IMG_HEIGHT][IMG_WIDTH][IMG_CHANNELS] = {0};
    data_t out0[OUT_HEIGHT][OUT_WIDTH][OUT_CHANNELS] = {0};

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
    lane_seg_top(image, out0, ctrl, status, magic);

    // === 3. Debug Outputs ===
    printf("magic  = 0x%08X\n", magic);
    printf("status = 0x%08X\n", status);

    // === 4. Save output to file ===
    save_encoder0_output(out0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/encoder0_out.txt");

    return 0;
}
