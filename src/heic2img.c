/*
 * filename: heic2img.c
 * Author: KaliAssistant
 * Github: https://github.com/KaliAssistant
 *
 * */

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  // For getopt()
#include <errno.h>
#include "stb_image_write.h"
#include <libheif/heif.h>
#include <stdbool.h>


// Define the background color (RGB)
#define BACKGROUND_R 255
#define BACKGROUND_G 255
#define BACKGROUND_B 255


unsigned char* RGBA2RGB(int width, int height, const unsigned char*data) {
    unsigned char *rgb_data = malloc(width * height *3);
    //rgb_data = malloc(width * height *3);
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            int src_index = (y * width + x) * 4;
            int dest_index = (y * width + x) * 3;
            unsigned char r = data[src_index];
            unsigned char g = data[src_index + 1];
            unsigned char b = data[src_index + 2];
            unsigned char a = data[src_index + 3];

            rgb_data[dest_index] = (r * a + BACKGROUND_R * (255 - a)) / 255;
            rgb_data[dest_index + 1] = (g * a + BACKGROUND_G * (255 - a)) / 255;
            rgb_data[dest_index + 2] = (b * a + BACKGROUND_B * (255 - a)) / 255;
        }
    }
    return rgb_data;
}

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



int main(int argc, char* argv[]) {
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
                fprintf(stderr, "Usage: %s -i <input heic image> -o <output image files> -f <output image format [JPG|PNG|TGA|BMP] > -q <jpeg quality 0~100> \n Output files format: JPG, PNG, TGA, BMP\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    if (!input_file || !output_file || !outpot_format) {
        fprintf(stderr, "Missing required arguments.\n");
        exit(EXIT_FAILURE);
    }

    struct heif_context *ctx = heif_context_alloc();
    struct heif_error err = heif_context_read_from_file(ctx, input_file, NULL);
    if (err.code != heif_error_Ok) {
        fprintf(stderr, "Failed to read HEIC file: %s\n", err.message);
        heif_context_free(ctx);
        exit(EXIT_FAILURE);
    }

    struct heif_image_handle *handle;
    err = heif_context_get_primary_image_handle(ctx, &handle);
    if (err.code != heif_error_Ok) {
        fprintf(stderr, "Failed to get HEIC image handle: %s\n", err.message);
        heif_context_free(ctx);
        exit(EXIT_FAILURE);
    }

    bool isAlphaCh = heif_image_handle_has_alpha_channel(handle);

    struct heif_image *img;
    // Decode with RGBA if alpha is present
    if (isAlphaCh) {
        err = heif_decode_image(handle, &img, heif_colorspace_RGB, heif_chroma_interleaved_RGBA, NULL);
    } else {
        err = heif_decode_image(handle, &img, heif_colorspace_RGB, heif_chroma_interleaved_RGB, NULL);
    }

    /*
    if (err.code != heif_error_Ok) {
        // Try decoding with RGB if RGBA is not supported or alpha is absent
        err = heif_decode_image(handle, &img, heif_colorspace_RGB, heif_chroma_interleaved_RGB, NULL);
    }*/
    if (err.code != heif_error_Ok) {
        fprintf(stderr, "Failed to decode HEIC image: %s\n", err.message);
        heif_image_handle_release(handle);
        heif_context_free(ctx);
        exit(EXIT_FAILURE);
    }

    int width = heif_image_get_width(img, heif_channel_interleaved);
    int height = heif_image_get_height(img, heif_channel_interleaved);
    int stride;
    const uint8_t *data = heif_image_get_plane_readonly(img, heif_channel_interleaved, &stride);
    int _count_channel = (isAlphaCh) ? 4 : 3;
    int pkd_stride = (isAlphaCh) ? width * 4 : width * 3;
    if (stride != pkd_stride) {
        printf("Warning: stride (%d) does not match width * 3 (%d).\n", stride, pkd_stride);
    }
    unsigned char* packed_data = malloc(height* pkd_stride);
    for (int y = 0; y < height; y++) {
        memcpy(packed_data + y * pkd_stride, data + y * stride, pkd_stride);
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

        unsigned char* _toJPG_data = (isAlphaCh) ? RGBA2RGB(width, height, packed_data) : packed_data;
        if (!stbi_write_jpg(output_file, width, height, 3, _toJPG_data, _quality)){

            fprintf(stderr, "Cannot write jpeg file:%s\n", output_file);
            heif_image_release(img);
            heif_image_handle_release(handle);
            heif_context_free(ctx);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        heif_image_release(img);
        heif_image_handle_release(handle);
        heif_context_free(ctx);
    } else if (strcmp(outpot_format, "PNG") ==0) {
        if (!stbi_write_png(output_file, width, height, _count_channel, packed_data,  pkd_stride)) {
            fprintf(stderr, "Cannot write png file:%s\n", output_file);
            heif_image_release(img);
            heif_image_handle_release(handle);
            heif_context_free(ctx);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        heif_image_release(img);
        heif_image_handle_release(handle);
        heif_context_free(ctx);
    } else if (strcmp(outpot_format, "TGA") ==0) {
        unsigned char* _toTGA_data = (isAlphaCh) ? RGBA2RGB(width, height, packed_data) : packed_data;
        if (!stbi_write_tga(output_file, width, height, 3, _toTGA_data)) {
            fprintf(stderr, "Cannot write png file:%s\n", output_file);
            heif_image_release(img);
            heif_image_handle_release(handle);
            heif_context_free(ctx);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        heif_image_release(img);
        heif_image_handle_release(handle);
        heif_context_free(ctx);
    } else if (strcmp(outpot_format, "BMP") ==0) {
        //unsigned char* _toBMP_data = (isAlphaCh) ? RGBA2RGB(width, height, packed_data) : packed_data;
        if (!stbi_write_bmp(output_file, width, height, 4, packed_data)) {
            fprintf(stderr, "Cannot write png file:%s\n", output_file);
            heif_image_release(img);
            heif_image_handle_release(handle);
            heif_context_free(ctx);
            exit(EXIT_FAILURE);
        }
        printf("Conversion completed: %s\n", output_file);
        heif_image_release(img);
        heif_image_handle_release(handle);
        heif_context_free(ctx);
    } else {
        fprintf(stderr, "Unsupported format combination.\n");
        exit(EXIT_FAILURE);
    }

    return 0;
}