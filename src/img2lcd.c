/*
 * filename: img2lcd.c
 * Author: KaliAssistant
 * Github: https://github.com/KaliAssistant
 *
 * */

#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STBI_NO_PSD
#define STBI_NO_GIF
#define STBI_NO_PIC
#define STBI_NO_PNM

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  // For getopt()
#include <stdbool.h>
#include "stb_image.h"
#include "stb_image_write.h"

unsigned short* convert_rgb565(int width, int height, bool a2bg, const unsigned char *rgba_data);
unsigned char* convert_rgb888(int width, int height, bool a2bg, const unsigned char *rgba_data);
unsigned char* convert_xbm_1bit(int width, int height, bool a2bg, const unsigned char *rgba_data);
int save_rgb565_data(const char* output_file, int width, int height, unsigned short* rgb565_data);
int save_rgb565_bin(const char* output_file, int width, int height, unsigned short* rgb565_data);
int save_xbm_1bit_xbm(const char* output_file, int width, int height, unsigned char* xbm_data);
int save_rgb888_data(const char* output_file, int width, int height, unsigned char* rgb888_data);
int save_rgb888_bin(const char* output_file, int width, int height, unsigned char* rgb888_data);

int main(int argc, char* argv[]) {
    char *input_file = NULL;
    char *output_file = NULL;
    char *color_format = NULL;
    char *output_format = NULL;
    char *alpha_2_bgcolor = NULL;

    int opt;
    while ((opt = getopt(argc, argv, "i:o:b:f:F:")) != -1) {
        switch (opt) {
            case 'i':
                input_file = optarg;
                break;
            case 'o':
                output_file = optarg;
                break;
            case 'b':
                alpha_2_bgcolor = optarg;
                break;
            case 'f':
                color_format = optarg;
                break;
            case 'F':
                output_format = optarg;
                break;

            default:
                fprintf(stderr, "Usage: %s -i <input image> -o output -b <alpha to bg color> [BLACK|WHITE] -f [RGB565|RGB888|XBM] -F [bin|h|xbm]\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    if (!input_file || !output_file || !color_format || !output_format || !alpha_2_bgcolor) {
        fprintf(stderr, "Missing required arguments.\n");
        exit(EXIT_FAILURE);
    }

    int width, height, channels;
    unsigned char *rgb_data = stbi_load(input_file, &width, &height, &channels, 4);

    if (!rgb_data) {
        fprintf(stderr, "Cannot load file:%s\n", input_file);
        exit(EXIT_FAILURE);
    }

    bool a2bg;
    if (strcmp(alpha_2_bgcolor, "WHITE") ==0) {
        a2bg = true;
    } else if (strcmp(alpha_2_bgcolor, "BLACK") ==0) {
        a2bg = false;
    } else {
        fprintf(stderr, "Unsupported bgcolor format : %s\n", alpha_2_bgcolor);
        stbi_image_free(rgb_data);
        exit(EXIT_FAILURE);
    }

    if (strcmp(color_format, "XBM") ==0) {
        if (strcmp(output_format, "xbm") ==0) {
            if (save_xbm_1bit_xbm(output_file, width, height, convert_xbm_1bit(width, height, a2bg, rgb_data)) == -1) {
                fprintf(stderr, "Cannot write file:%s\n", output_file);
                stbi_image_free(rgb_data);
                exit(EXIT_FAILURE);
            }
            printf("Conversion completed: %s\n", output_file);
            stbi_image_free(rgb_data);
        } else {
            fprintf(stderr, "Unsupported output format: %s\n", output_format);
            stbi_image_free(rgb_data);
            exit(EXIT_FAILURE);
        }
    } else if (strcmp(color_format, "RGB565") ==0 ) {
        if (strcmp(output_format, "h") ==0) {
            if (save_rgb565_data(output_file, width, height, convert_rgb565(width, height, a2bg,  rgb_data)) == -1) {
                fprintf(stderr, "Cannot write file:%s\n", output_file);
                stbi_image_free(rgb_data);
                exit(EXIT_FAILURE);
            }
            printf("Conversion completed: %s\n", output_file);
            stbi_image_free(rgb_data);
        } else if (strcmp(output_format, "bin") ==0) {
            if (save_rgb565_bin(output_file, width, height, convert_rgb565(width, height, a2bg,  rgb_data)) == -1) {
                fprintf(stderr, "Cannot write file:%s\n", output_file);
                stbi_image_free(rgb_data);
                exit(EXIT_FAILURE);
            }
            printf("Conversion completed: %s\n", output_file);
            stbi_image_free(rgb_data);
        } else {
            fprintf(stderr, "Unsupported output format: %s\n", output_format);
            stbi_image_free(rgb_data);
            exit(EXIT_FAILURE);
        }
    } else if (strcmp(color_format, "RGB888") ==0) {
        if (strcmp(output_format, "h") ==0) {
            if (save_rgb888_data(output_file, width, height, convert_rgb888(width, height, a2bg,  rgb_data)) == -1) {
                fprintf(stderr, "Cannot write file:%s\n", output_file);
                stbi_image_free(rgb_data);
                exit(EXIT_FAILURE);
            }
            printf("Conversion completed: %s\n", output_file);
            stbi_image_free(rgb_data);
        } else if (strcmp(output_format, "bin") ==0) {
            if (save_rgb888_bin(output_file, width, height, convert_rgb888(width, height, a2bg,  rgb_data)) == -1) {
                fprintf(stderr, "Cannot write file:%s\n", output_file);
                stbi_image_free(rgb_data);
                exit(EXIT_FAILURE);
            }
            printf("Conversion completed: %s\n", output_file);
            stbi_image_free(rgb_data);
        } else {
            fprintf(stderr, "Unsupported output format: %s\n", output_format);
            stbi_image_free(rgb_data);
            exit(EXIT_FAILURE);
        }
    } else {
        fprintf(stderr, "Unsupported color format: %s\n", color_format);
        stbi_image_free(rgb_data);
        exit(EXIT_FAILURE);
    }
    return 0;
}

unsigned char* convert_xbm_1bit(int width, int height, bool a2bg, const unsigned char *rgba_data) {
    unsigned char* xbm_data = malloc((width + 7) / 8 * height);
    for (int y = 0; y < height; ++y ) {
        for (int x = 0; x < width; ++x) {
            int index = y * width + x;
            int byte_index = y * ((width + 7) / 8) + (x / 8);
            int bit_index = x % 8;

            unsigned char r = rgba_data[index * 4];
            unsigned char g = rgba_data[index * 4 + 1];
            unsigned char b = rgba_data[index * 4 + 2];
            unsigned char a = rgba_data[index * 4 + 3];

            // 將透明像素設置為白色，不透明像素設置為黑色
            if (a2bg) {
                if (a > 128 && (r + g + b) / 3 < 128) {
                    xbm_data[byte_index] |= (1 << bit_index);
                } else {
                    xbm_data[byte_index] |= (0 << bit_index);
                }
            } else {
                if (a > 128 && (r + g + b) / 3 < 128) {
                    xbm_data[byte_index] |= (0 << bit_index);
                } else {
                    xbm_data[byte_index] |= (1 << bit_index);
                }
            }
        }
    }
    return xbm_data;
}

unsigned short* convert_rgb565(int width, int height, bool a2bg, const unsigned char *rgba_data) {
    unsigned short* rgb565_data = malloc(width * height *2);
   // unsigned char *raw_rgb_data = malloc(width * height * 3);
    int _px_count_ = 0;
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            int src_index = (y * width + x) * 4;
            //int dest_index = (y * width + x) * 3;
            unsigned char r = rgba_data[src_index];
            unsigned char g = rgba_data[src_index + 1];
            unsigned char b = rgba_data[src_index + 2];
            unsigned char a = rgba_data[src_index + 3];

            if (a2bg) {
                unsigned char cr = r * a / 255 + 255 * (255 - a) / 255;
                unsigned char cg = g * a / 255 + 255 * (255 - a) / 255;
                unsigned char cb = b * a / 255 + 255 * (255 - a) / 255;
                rgb565_data[_px_count_++] =  ((cr & 0xF8) << 8) | ((cg & 0xFC) << 3) | (cb >> 3);
            } else {
                rgb565_data[_px_count_++] =  ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
            }
        }
    }
    return rgb565_data;
}

unsigned char* convert_rgb888(int width, int height, bool a2bg, const unsigned char *rgba_data) {
    unsigned char* rgb888_data = malloc(width * height * 3);
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            int src_index = (y * width + x) * 4;
            int dest_index = (y * width + x) * 3;
            unsigned char r = rgba_data[src_index];
            unsigned char g = rgba_data[src_index + 1];
            unsigned char b = rgba_data[src_index + 2];
            unsigned char a = rgba_data[src_index + 3];

            if (a2bg) {
                rgb888_data[dest_index] = r * a / 255 + 255 * (255 - a) / 255;
                rgb888_data[dest_index + 1] = g * a / 255 + 255 * (255 - a) / 255;
                rgb888_data[dest_index + 2] = b * a / 255 + 255 * (255 - a) / 255;
            } else {
                rgb888_data[dest_index] = r;
                rgb888_data[dest_index + 1] = g;
                rgb888_data[dest_index + 2] = b;
            }
        }
    }
    return rgb888_data;
}

int save_xbm_1bit_xbm(const char* output_file, int width, int height, unsigned char* xbm_data) {
    FILE *file = fopen(output_file, "w");
    if (!file) {
        fprintf(stderr, "Could not open output file: %s\n", output_file);
        return -1;
    }
    fprintf(file, "#define XBM_WIDTH %d\n", width);
    fprintf(file, "#define XBM_HEIGHT %d\n", height);
    fprintf(file, "const unsigned char xbm_data[] PROGMEM = {\n");
    size_t out_data_size = (width + 7) / 8 * height;
    for (size_t i = 0; i < out_data_size; ++i) {
        if (i % 16 == 0 && i != 0) {
            fprintf(file, "\n");
        }
        fprintf(file, "0x%02X", xbm_data[i]);
        if (i != out_data_size) {
            fprintf(file, ", ");
        }
    }
    fprintf(file, "\n};\n");
    fclose(file);
    free(xbm_data);

    return 0;
}

int save_rgb565_data(const char* output_file, int width, int height, unsigned short* rgb565_data) {
    FILE *file = fopen(output_file, "w");
    if (!file) {
        fprintf(stderr, "Could not open output file: %s\n", output_file);
        return -1;
    }

    fprintf(file, "#define IMAGE_WIDTH %d\n", width);
    fprintf(file, "#define IMAGE_HEIGHT %d\n", height);
    fprintf(file, "const unsigned short image_data[] PROGMEM = {\n");


    size_t out_data_size = width * height;
    for (size_t i = 0; i < out_data_size; ++i) {
        if (i % 16 == 0 && i != 0) {
            fprintf(file, "\n");
        }
        fprintf(file, "0x%04X", rgb565_data[i]);
        if (i != out_data_size) {
            fprintf(file, ", ");
        }
    }
    fprintf(file, "\n};\n");
    fclose(file);
    free(rgb565_data);

    return 0;
}

int save_rgb888_data(const char* output_file, int width, int height, unsigned char* rgb888_data) {
    FILE *file = fopen(output_file, "wb");
    if (!file) {
        fprintf(stderr, "Could not open output file: %s\n", output_file);
        return -1;
    }

    fprintf(file, "#define IMAGE_WIDTH %d\n", width);
    fprintf(file, "#define IMAGE_HEIGHT %d\n", height);
    fprintf(file, "const unsigned char image_data_24bit[] PROGMEM = {\n");

    size_t out_data_size = width * height *3;
    for (size_t i = 0; i < out_data_size; i+=3) {
        if (i % 16 == 0 && i != 0) {
            fprintf(file, "\n");
        }
        fprintf(file, "0x%08X", (rgb888_data[i] << 16) | (rgb888_data[i+1] << 8) | rgb888_data[i+2]);
        if (i != out_data_size) {
            fprintf(file, ", ");
        }
    }
    fprintf(file, "\n};\n");
    fclose(file);
    free(rgb888_data);

    return 0;
}

int save_rgb565_bin(const char* output_file, int width, int height, unsigned short* rgb565_data) {
    FILE *file = fopen(output_file, "wb");
    if (!file) {
        fprintf(stderr, "Could not open output file: %s\n", output_file);
        return -1;
    }


    fwrite(rgb565_data, sizeof(unsigned short), width * height, file);
    fclose(file);
    free(rgb565_data);

    return 0;
}

int save_rgb888_bin(const char* output_file, int width, int height, unsigned char* rgb888_data) {
    FILE *file = fopen(output_file, "wb");
    if (!file) {
        fprintf(stderr, "Could not open output file: %s\n", output_file);
        return -1;
    }
    fwrite(rgb888_data, sizeof(unsigned char), width * height *3, file);
    fclose(file);
    free(rgb888_data);

    return 0;
}