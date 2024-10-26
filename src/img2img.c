/*
 * filename: img2img.c
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
#include <errno.h>
#include "stb_image.h"
#include "stb_image_write.h"

int string_to_int(const char *str) {
    char *endptr;
    errno = 0;  // To distinguish success/failure after call
    long val = strtol(str, &endptr, 10);

    // Check for conversion errors
    if (errno != 0 || endptr == str) {
        //printf("Conversion error or no digits found.\n");
        return -1;
    }

    // Check if the number is within 0-100 range
    if (val < 0 || val > 100) {
        //printf("Value out of range (0-100).\n");
        return -2;
    }

    return (int)val;
}

int main(int argc, char* argv[])
{
    char *input_file = NULL;
    char *output_file = NULL;
    char *outpot_format = NULL;
    char *jpeg_quality = NULL;
    int opt;
    while ((opt = getopt(argc, argv, "i:o:f:q:")) != -1) {
        switch (opt) {
            case 'i':
                input_file = optarg;
                break;
            case 'o':
                output_file = optarg;
                break;
            case 'f':
                outpot_format = optarg;
                break;
            case 'q':
                jpeg_quality = optarg;
                break;
            default:
                fprintf(stderr, "Usage: %s -i <input image files> -o <output image files> -f <output image format [JPG|PNG|TGA|BMP] > -q <jpeg quality 0~100>\n Input files format: JPG, PNG, TGA, BMP \n Output files format: JPG, PNG, TGA, BMP\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    if (!input_file || !output_file || !outpot_format) {
        fprintf(stderr, "Missing required arguments.\n");
        exit(EXIT_FAILURE);
    }

    int width, height, channels;
    unsigned char *data = stbi_load(input_file, &width, &height, &channels, 4);

    if (!data) {
        fprintf(stderr, "Cannot load file:%s\n", input_file);
        exit(EXIT_FAILURE);
    }

    if (strcmp(outpot_format, "JPG") ==0) {
        if (!jpeg_quality) {
            fprintf(stderr, "Missing argument <jpeg quality>.\n");
            exit(EXIT_FAILURE);
        }
        int _quality = string_to_int(jpeg_quality);
        if (_quality == -1) {
            fprintf(stderr, "Argument <jpeg quality> no digits found.\n");
            exit(EXIT_FAILURE);
        } else if (_quality == -2) {
            fprintf(stderr, "Argument <jpeg quality> value out of range (0-100).\n");
            exit(EXIT_FAILURE);
        }

        unsigned char *rgb_data;
        rgb_data = malloc(width * height *3);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                int src_index = (y * width + x) * 4;
                int dest_index = (y * width + x) * 3;
                unsigned char r = data[src_index];
                unsigned char g = data[src_index + 1];
                unsigned char b = data[src_index + 2];
                unsigned char a = data[src_index + 3];

                rgb_data[dest_index] = r * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 1] = g * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 2] = b * a / 255 + 255 * (255 - a) / 255;
            }
        }

        if (!stbi_write_jpg(output_file, width, height, 3, rgb_data, _quality)) {
            fprintf(stderr, "Cannot write jpeg file:%s\n", output_file);
            stbi_image_free(data);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        stbi_image_free(data);
    } else if (strcmp(outpot_format, "PNG") ==0) {
        unsigned char *rgba_data;
        rgba_data = malloc(width * height *4);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                int src_index = (y * width + x) * 4;
                //int dest_index = (y * width + x) * 3;
                rgba_data[src_index] = data[src_index];
                rgba_data[src_index + 1] = data[src_index + 1];
                rgba_data[src_index + 2] = data[src_index + 2];
                rgba_data[src_index + 3] = data[src_index + 3];

            }
        }

        if (!stbi_write_png(output_file, width, height, 4, rgba_data, width*4)) {
            fprintf(stderr, "Cannot write png file:%s\n", output_file);
            stbi_image_free(data);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        stbi_image_free(data);
    } else if (strcmp(outpot_format, "TGA") ==0) {
        unsigned char *rgb_data;
        rgb_data = malloc(width * height *3);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                int src_index = (y * width + x) * 4;
                int dest_index = (y * width + x) * 3;
                unsigned char r = data[src_index];
                unsigned char g = data[src_index + 1];
                unsigned char b = data[src_index + 2];
                unsigned char a = data[src_index + 3];

                rgb_data[dest_index] = r * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 1] = g * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 2] = b * a / 255 + 255 * (255 - a) / 255;
            }
        }

        if (!stbi_write_tga(output_file, width, height, 3, rgb_data)) {
            fprintf(stderr, "Cannot write tga file:%s\n", output_file);
            stbi_image_free(data);
            exit(EXIT_FAILURE);
        }

        printf("Conversion completed: %s\n", output_file);
        stbi_image_free(data);
    } else if (strcmp(outpot_format, "BMP") ==0) {
        unsigned char *rgb_data;
        rgb_data = malloc(width * height *3);
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                int src_index = (y * width + x) * 4;
                int dest_index = (y * width + x) * 3;
                unsigned char r = data[src_index];
                unsigned char g = data[src_index + 1];
                unsigned char b = data[src_index + 2];
                unsigned char a = data[src_index + 3];

                rgb_data[dest_index] = r * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 1] = g * a / 255 + 255 * (255 - a) / 255;
                rgb_data[dest_index + 2] = b * a / 255 + 255 * (255 - a) / 255;
            }
        }
        if (!stbi_write_bmp(output_file, width, height, 3, rgb_data)) {
            fprintf(stderr, "Cannot write bmp file:%s\n", output_file);
            stbi_image_free(data);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        stbi_image_free(data);

    } else {
        fprintf(stderr, "Unsupported format combination.\n");
        exit(EXIT_FAILURE);
    }
    return 0;
}