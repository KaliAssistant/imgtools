#!/bin/bash

#set -e

bin_dir=$(pwd)/../bin
data_dir=$(pwd)/data
output_dir=$(pwd)/output
test_sample_dir=$(pwd)/tests
export PATH=$PATH:$bin_dir

Test_img2img_output_array=(
"img2img -i $data_dir/Sample-bmp-alpha-0.bmp -o  $output_dir/Test-bmp-alpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-bmp-alpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-bmp-alpha2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-bmp-alpha-0.bmp -o  $output_dir/Test-bmp-alpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-bmp-alpha2png-output-0.png) <(xxd $test_sample_dir/Test-bmp-alpha2png-output-0.png)"
"img2img -i $data_dir/Sample-bmp-alpha-0.bmp -o  $output_dir/Test-bmp-alpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-bmp-alpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-bmp-alpha2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-bmp-alpha-0.bmp -o  $output_dir/Test-bmp-alpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-bmp-alpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-bmp-alpha2tga-output-0.tga)"

"img2img -i $data_dir/Sample-bmp-noalpha-0.bmp -o  $output_dir/Test-bmp-noalpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-bmp-noalpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-bmp-noalpha2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-bmp-noalpha-0.bmp -o  $output_dir/Test-bmp-noalpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-bmp-noalpha2png-output-0.png) <(xxd $test_sample_dir/Test-bmp-noalpha2png-output-0.png)"
"img2img -i $data_dir/Sample-bmp-noalpha-0.bmp -o  $output_dir/Test-bmp-noalpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-bmp-noalpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-bmp-noalpha2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-bmp-noalpha-0.bmp -o  $output_dir/Test-bmp-noalpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-bmp-noalpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-bmp-noalpha2tga-output-0.tga)"

"img2img -i $data_dir/Sample-png-alpha-0.png -o  $output_dir/Test-png-alpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-png-alpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-png-alpha2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-png-alpha-0.png -o  $output_dir/Test-png-alpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-png-alpha2png-output-0.png) <(xxd $test_sample_dir/Test-png-alpha2png-output-0.png)"
"img2img -i $data_dir/Sample-png-alpha-0.png -o  $output_dir/Test-png-alpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-png-alpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-png-alpha2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-png-alpha-0.png -o  $output_dir/Test-png-alpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-png-alpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-png-alpha2tga-output-0.tga)"

"img2img -i $data_dir/Sample-png-noalpha-0.png -o  $output_dir/Test-png-noalpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-png-noalpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-png-noalpha2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-png-noalpha-0.png -o  $output_dir/Test-png-noalpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-png-noalpha2png-output-0.png) <(xxd $test_sample_dir/Test-png-noalpha2png-output-0.png)"
"img2img -i $data_dir/Sample-png-noalpha-0.png -o  $output_dir/Test-png-noalpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-png-noalpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-png-noalpha2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-png-noalpha-0.png -o  $output_dir/Test-png-noalpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-png-noalpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-png-noalpha2tga-output-0.tga)"

"img2img -i $data_dir/Sample-jpg-0.jpg -o  $output_dir/Test-jpg2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-jpg2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-jpg2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-jpg-0.jpg -o  $output_dir/Test-jpg2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-jpg2png-output-0.png) <(xxd $test_sample_dir/Test-jpg2png-output-0.png)"
"img2img -i $data_dir/Sample-jpg-0.jpg -o  $output_dir/Test-jpg2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-jpg2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-jpg2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-jpg-0.jpg -o  $output_dir/Test-jpg2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-jpg2tga-output-0.tga) <(xxd $test_sample_dir/Test-jpg2tga-output-0.tga)"

"img2img -i $data_dir/Sample-tga-0.tga -o  $output_dir/Test-tga2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-tga2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-tga2bmp-output-0.bmp)"
"img2img -i $data_dir/Sample-tga-0.tga -o  $output_dir/Test-tga2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-tga2png-output-0.png) <(xxd $test_sample_dir/Test-tga2png-output-0.png)"
"img2img -i $data_dir/Sample-tga-0.tga -o  $output_dir/Test-tga2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-tga2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-tga2jpg-output-0.jpg)"
"img2img -i $data_dir/Sample-tga-0.tga -o  $output_dir/Test-tga2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-tga2tga-output-0.tga) <(xxd $test_sample_dir/Test-tga2tga-output-0.tga)"
)


Test_img2lcd_output_array=(
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-bmp-alpha2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-bmp-alpha2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-bmp-alpha2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-bmp-alpha2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-bmp-alpha2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-alpha2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-bmp-alpha2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-alpha2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-bmp-alpha2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-bmp-alpha2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-alpha2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-bmp-alpha2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-alpha2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-alpha-0.bmp -o $output_dir/Test-bmp-alpha2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-bmp-alpha2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-alpha2rgb888-bgw-bin-output-0.bin)"

"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-bmp-noalpha2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-bmp-noalpha2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-bmp-noalpha-0.bmp -o $output_dir/Test-bmp-noalpha2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-bmp-noalpha2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-bmp-noalpha2rgb888-bgw-bin-output-0.bin)"

"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-png-alpha2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-png-alpha2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-png-alpha2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-png-alpha2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-png-alpha2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-alpha2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-png-alpha2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-alpha2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-png-alpha2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-png-alpha2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-alpha2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-png-alpha2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-alpha2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-alpha-0.png -o $output_dir/Test-png-alpha2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-png-alpha2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-alpha2rgb888-bgw-bin-output-0.bin)"

"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-png-noalpha2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-png-noalpha2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-png-noalpha2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-png-noalpha2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-png-noalpha2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-noalpha2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-png-noalpha2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-noalpha2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-png-noalpha2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-png-noalpha2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-png-noalpha2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-png-noalpha2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-noalpha2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-png-noalpha-0.png -o $output_dir/Test-png-noalpha2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-png-noalpha2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-png-noalpha2rgb888-bgw-bin-output-0.bin)"

"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-jpg2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-jpg2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-jpg2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-jpg2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-jpg2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-jpg2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-jpg2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-jpg2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-jpg2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-jpg2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-jpg2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-jpg2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-jpg2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-jpg-0.jpg -o $output_dir/Test-jpg2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-jpg2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-jpg2rgb888-bgw-bin-output-0.bin)"

"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2xbm-bgb-cpp-output-0.h -b BLACK -f XBM -F xbm&&diff <(xxd $output_dir/Test-tga2xbm-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2xbm-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2xbm-bgw-cpp-output-0.h -b WHITE -f XBM -F xbm&&diff <(xxd $output_dir/Test-tga2xbm-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2xbm-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb565-bgb-cpp-output-0.h -b BLACK -f RGB565 -F h&&diff <(xxd $output_dir/Test-tga2rgb565-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2rgb565-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb565-bgw-cpp-output-0.h -b WHITE -f RGB565 -F h&&diff <(xxd $output_dir/Test-tga2rgb565-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2rgb565-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb565-bgb-bin-output-0.bin -b BLACK -f RGB565 -F bin&&diff <(xxd $output_dir/Test-tga2rgb565-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-tga2rgb565-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb565-bgw-bin-output-0.bin -b WHITE -f RGB565 -F bin&&diff <(xxd $output_dir/Test-tga2rgb565-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-tga2rgb565-bgw-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb888-bgb-cpp-output-0.h -b BLACK -f RGB888 -F h&&diff <(xxd $output_dir/Test-tga2rgb888-bgb-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2rgb888-bgb-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb888-bgw-cpp-output-0.h -b WHITE -f RGB888 -F h&&diff <(xxd $output_dir/Test-tga2rgb888-bgw-cpp-output-0.h) <(xxd $test_sample_dir/Test-tga2rgb888-bgw-cpp-output-0.h)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb888-bgb-bin-output-0.bin -b BLACK -f RGB888 -F bin&&diff <(xxd $output_dir/Test-tga2rgb888-bgb-bin-output-0.bin) <(xxd $test_sample_dir/Test-tga2rgb888-bgb-bin-output-0.bin)"
"img2lcd -i $data_dir/Sample-tga-0.tga -o $output_dir/Test-tga2rgb888-bgw-bin-output-0.bin -b WHITE -f RGB888 -F bin&&diff <(xxd $output_dir/Test-tga2rgb888-bgw-bin-output-0.bin) <(xxd $test_sample_dir/Test-tga2rgb888-bgw-bin-output-0.bin)"
)

Test_heic2img_array=(
"heic2img -i $data_dir/Sample-heic-alpha-0.heic -o $output_dir/Test-heic-alpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-heic-alpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-heic-alpha2bmp-output-0.bmp)"
"heic2img -i $data_dir/Sample-heic-alpha-0.heic -o $output_dir/Test-heic-alpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-heic-alpha2png-output-0.png) <(xxd $test_sample_dir/Test-heic-alpha2png-output-0.png)"
"heic2img -i $data_dir/Sample-heic-alpha-0.heic -o $output_dir/Test-heic-alpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-heic-alpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-heic-alpha2jpg-output-0.jpg)"
"heic2img -i $data_dir/Sample-heic-alpha-0.heic -o $output_dir/Test-heic-alpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-heic-alpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-heic-alpha2tga-output-0.tga)"
"heic2img -i $data_dir/Sample-heic-noalpha-0.heic -o $output_dir/Test-heic-noalpha2bmp-output-0.bmp -f BMP&&diff <(xxd $output_dir/Test-heic-noalpha2bmp-output-0.bmp) <(xxd $test_sample_dir/Test-heic-noalpha2bmp-output-0.bmp)"
"heic2img -i $data_dir/Sample-heic-noalpha-0.heic -o $output_dir/Test-heic-noalpha2png-output-0.png -f PNG&&diff <(xxd $output_dir/Test-heic-noalpha2png-output-0.png) <(xxd $test_sample_dir/Test-heic-noalpha2png-output-0.png)"
"heic2img -i $data_dir/Sample-heic-noalpha-0.heic -o $output_dir/Test-heic-noalpha2jpg-output-0.jpg -f JPG -q 100&&diff <(xxd $output_dir/Test-heic-noalpha2jpg-output-0.jpg) <(xxd $test_sample_dir/Test-heic-noalpha2jpg-output-0.jpg)"
"heic2img -i $data_dir/Sample-heic-noalpha-0.heic -o $output_dir/Test-heic-noalpha2tga-output-0.tga -f TGA&&diff <(xxd $output_dir/Test-heic-noalpha2tga-output-0.tga) <(xxd $test_sample_dir/Test-heic-noalpha2tga-output-0.tga)"
)

for imgs in "${Test_img2img_output_array[@]}"; do
  eval "$imgs"
done

for imgs in "${Test_img2lcd_output_array[@]}"; do
  eval "$imgs"
done

for imgs in "${Test_heic2img_array[@]}"; do
  eval "$imgs"
done








