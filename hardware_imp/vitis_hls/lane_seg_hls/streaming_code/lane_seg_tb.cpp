

#include <stdio.h>
#include "lane_seg_top.h"
#include "ap_fixed.h"

// Define the data type
//typedef ap_fixed<16, 8> data_t;
typedef ap_fixed<16, 8> data_t;
//typedef float data_t;

// Image dimensions for encoder0
#define IMG_HEIGHT 224
#define IMG_WIDTH  224
#define IMG_CHANNELS 3
#define OUT_HEIGHT 112
#define OUT_WIDTH  112
#define OUT_CHANNELS 32

#define KERNEL_SIZE    3
#define encoder0_c1_WEIGHT_SIZE    (KERNEL_SIZE * KERNEL_SIZE * IMG_CHANNELS * OUT_CHANNELS)
#define encoder0_c1_BIAS_SIZE      OUT_CHANNELS

// Save output feature maps
void save_encoder0_output(data_t out[OUT_HEIGHT][OUT_WIDTH][OUT_CHANNELS], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int c = 0; c < OUT_CHANNELS; c++) {
        for (int i = 0; i < OUT_HEIGHT; i++) {
            for (int j = 0; j < OUT_WIDTH; j++) {
                fprintf(f, "%.6f ", out[i][j][c]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n"); // Blank line between channels
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}




// ──────────────────────────────────────────────
// Main testbench
int main() {
    // Input / Output Buffers
    data_t image[IMG_HEIGHT][IMG_WIDTH][IMG_CHANNELS] = {0};
    data_t out0[OUT_HEIGHT][OUT_WIDTH][OUT_CHANNELS] = {0};
    data_t encoder0_c1_weights[encoder0_c1_WEIGHT_SIZE] = {0};
    data_t encoder0_c1_biases[encoder0_c1_BIAS_SIZE] = {0};


    // AXI-Lite debug signals
    unsigned int ctrl        = 0;
    unsigned int status      = 0;
    unsigned int magic       = 0;

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
    fclose(fp);
    printf("Loaded input image.\n");

    // === 2. Load weights ===
        fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/test_weights/encoder0_c1_weights.txt", "r");
        if (!fp) {
            printf("Error: Could not open weight file.\n");
            return 1;
        }
        for (int i = 0; i < encoder0_c1_WEIGHT_SIZE; i++)
            fscanf(fp, "%f", &encoder0_c1_weights[i]);


        fclose(fp);
        printf("Loaded weights.\n");

    // === 3. Load biases ===
        fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/weights/encoder0_c1_biases.txt", "r");
        if (!fp) {
           printf("Error: Could not open bias file.\n");
           return 1;
        }
        for (int i = 0; i < encoder0_c1_BIAS_SIZE; i++)
            fscanf(fp, "%f", &encoder0_c1_biases[i]);


        fclose(fp);
        printf("Loaded biases.\n");


        // === 4. Run top function ===
        lane_seg_top(image, out0, encoder0_c1_weights, encoder0_c1_biases, ctrl, status, magic);


    // === 3. Debug outputs ===
    printf("magic  = 0x%08X\n", magic);
    printf("status = 0x%08X\n", status);

    // === 4. Save output to file ===
    save_encoder0_output(out0, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/hw_output/encoder0_out.txt");

    return 0;
}
