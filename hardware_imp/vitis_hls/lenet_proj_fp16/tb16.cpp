#include <stdio.h>
#include "lenet_top.h"
#include "ap_fixed.h"

// Match data type used in your design
//typedef ap_fixed<32, 16> data_t;
typedef float data_t;

// Image dimensions
#define IMG_HEIGHT 28
#define IMG_WIDTH  28
#define OUT_CHANNELS 6

// Function to save conv1 output to .txt file
void save_conv1_out(data_t conv1_out[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int f_idx = 0; f_idx < OUT_CHANNELS; f_idx++) {
        //fprintf(f, "==== Feature Map for Filter %d ====\n", f_idx);
        for (int i = 0; i < IMG_HEIGHT; i++) {
            for (int j = 0; j < IMG_WIDTH; j++) {
                fprintf(f, "%.6f ", conv1_out[i][j][f_idx]); //casted to float
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n"); // This causes the gap in between filter outputs:
    }

    fclose(f);
    printf("Output written to: %s\n", filename);
}

void save_pool1_out(data_t pool1_out[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int f_idx = 0; f_idx < OUT_CHANNELS; f_idx++) {
        for (int i = 0; i < IMG_HEIGHT / 2; i++) {
            for (int j = 0; j < IMG_WIDTH / 2; j++) {
                fprintf(f, "%.6f ", (float)pool1_out[i][j][f_idx]);  // Cast to float if using ap_fixed
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");  // Separate filters
    }

    fclose(f);
    printf("MaxPool output written to: %s\n", filename);
}

void save_conv2_out(float conv2_out[10][10][16], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int f_idx = 0; f_idx < 16; f_idx++) {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                fprintf(f, "%.6f ", (float)conv2_out[i][j][f_idx]);  // cast in case you're using ap_fixed
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");  // Separate filters
    }

    fclose(f);
    printf("Conv2 output written to: %s\n", filename);
}


void save_pool2_out(float pool2_out[5][5][16], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int f_idx = 0; f_idx < 16; f_idx++) {
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                fprintf(f, "%.6f ", (float)pool2_out[i][j][f_idx]);
            }
            fprintf(f, "\n");
        }
        fprintf(f, "\n");  // Separate filters with blank line
    }

    fclose(f);
    printf("MaxPool2 output written to: %s\n", filename);
}

// Fletten out Layer
void save_flatten_out(float flatten_out[400], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int i = 0; i < 400; i++) {
        fprintf(f, "%.6f\n", flatten_out[i]);
    }

    fclose(f);
    printf("Flatten output written to: %s\n", filename);
}

//fc1
#define FC1_OUT_SIZE 120
void save_fc1_out(float fc1_out[FC1_OUT_SIZE], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int i = 0; i < FC1_OUT_SIZE; i++) {
        fprintf(f, "%.6f\n", fc1_out[i]);
    }

    fclose(f);
    printf("FC1 output written to: %s\n", filename);
}

//fc2
#define FC2_OUT_SIZE 84
void save_fc2_out(float fc2_out[FC2_OUT_SIZE], const char* filename) {
    FILE* f = fopen(filename, "w");
    if (!f) {
        printf("Failed to open file for writing: %s\n", filename);
        return;
    }

    for (int i = 0; i < FC2_OUT_SIZE; i++) {
        fprintf(f, "%.6f\n", fc2_out[i]);
    }

    fclose(f);
    printf("FC2 output written to: %s\n", filename);
}


// ──────────────────────────────────────────────
// Main Testbench
int main() {
    data_t image[IMG_HEIGHT][IMG_WIDTH];
    data_t conv1_out[IMG_HEIGHT][IMG_WIDTH][OUT_CHANNELS];
    data_t pool1_out[IMG_HEIGHT / 2][IMG_WIDTH / 2][OUT_CHANNELS];
    data_t conv2_out[10][10][16];
    data_t pool2_out[5][5][16];
    data_t flat_out[400];
    data_t fc1_out[120];
    data_t fc2_out[84];
    int prediction = -1;

    // 1. Load image from .txt file
    FILE *fp = fopen("C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/test_files/img_9.txt", "r");
    if (!fp) {
        printf("Error: Could not open image file.\n");
        return 1;
    }

    //Old Code
    for (int i = 0; i < IMG_HEIGHT; i++) {
        for (int j = 0; j < IMG_WIDTH; j++) {
            fscanf(fp, "%f", &image[i][j]);
        }
    }
    fclose(fp);

    // 2. Run the top-level HLS function
    lenet_top(image, conv1_out, pool1_out, conv2_out, pool2_out, flat_out, fc1_out, fc2_out, &prediction);

    // 3. Save Conv1 output
    save_conv1_out(conv1_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/conv1_out_c.txt");

    //4. Save Pool 1
    save_pool1_out(pool1_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/pool1_out_c.txt");

    //5. Save Conv2
    save_conv2_out(conv2_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/conv2_out_c.txt");

    // Save Pool2
    save_pool2_out(pool2_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/pool2_out_c.txt"); 

    // Save flatted out
    save_flatten_out(flat_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/flat_out_c.txt"); 

    // Save fc1_out 
    save_fc1_out(fc1_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/fc1_out_c.txt");

    // Save fc2_out
    save_fc2_out(fc2_out, "C:/Users/Baron/Desktop/EE_297_Repo/EE_297/vivado/lenet_proj/output_tests/fc2_out_c.txt");

    // Print result
    printf("Predicted digit class: %d\n", prediction);


    return 0;
    
}
