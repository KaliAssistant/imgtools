#!/bin/bash


debug_dir=$(pwd)/../bin
data_dir=$(pwd)/data
output_dir=$(pwd)/output

export PATH=$PATH:$debug_dir

sample_jpeg="$data_dir/Sample-jpg-*.jpg"
sample_tga="$data_dir/Sample-tga-*.tga"
sample_png_no_alpha="$data_dir/Sample-png-noalpha-*.png"
sample_png_alpha="$data_dir/Sample-png-alpha-*.png"
sample_bmp_noalpha="$data_dir/Sample-bmp-noalpha-*.bmp"
sample_bmp_alpha="$data_dir/Sample-bmp-alpha-*.bmp"
sample_heic_alpha="$data_dir/Sample-heic-alpha-*.heic"
sample_heic_noalpha="$data_dir/Sample-heic-noalpha-*.heic"

count=0
for imgs in $sample_png_no_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2tga-output-"$count".tga -f TGA

  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-noalpha2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm


  ((count++))
done
count=0
for imgs in $sample_png_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2tga-output-"$count".tga -f TGA

  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-png-alpha2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm

  ((count++))
done
count=0
for imgs in $sample_jpeg; do
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2tga-output-"$count".tga -f TGA

  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-jpg2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm

  ((count++))
done
count=0
for imgs in $sample_bmp_noalpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2tga-output-"$count".tga -f TGA

  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm

  ((count++))
done
count=0
for imgs in $sample_bmp_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2tga-output-"$count".tga -f TGA


  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-bmp-alpha2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm
  ((count++))
done
count=0
for imgs in $sample_tga; do
  img2img -i "$imgs" -o "$output_dir"/Test-tga2bmp-output-"$count".bmp -f BMP
  img2img -i "$imgs" -o "$output_dir"/Test-tga2png-output-"$count".png -f PNG
  img2img -i "$imgs" -o "$output_dir"/Test-tga2jpg-output-"$count".jpg -f JPG -q 100
  img2img -i "$imgs" -o "$output_dir"/Test-tga2tga-output-"$count".tga -f TGA


  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb565-bgb-cpp-output-"$count".h -b BLACK -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb565-bgw-cpp-output-"$count".h -b WHITE -f RGB565 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb565-bgb-bin-output-"$count".bin -b BLACK -f RGB565 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb565-bgw-bin-output-"$count".bin -b WHITE -f RGB565 -F bin

  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb888-bgb-cpp-output-"$count".h -b BLACK -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb888-bgw-cpp-output-"$count".h -b WHITE -f RGB888 -F h
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb888-bgb-bin-output-"$count".bin -b BLACK -f RGB888 -F bin
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2rgb888-bgw-bin-output-"$count".bin -b WHITE -f RGB888 -F bin


  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2xbm-bgb-cpp-output-"$count".h -b BLACK -f XBM -F xbm
  img2lcd -i "$imgs" -o "$output_dir"/Test-tga2xbm-bgw-cpp-output-"$count".h -b WHITE -f XBM -F xbm

  ((count++))
done


count=0
for imgs in $sample_heic_alpha; do
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-alpha2png-output-"$count".png -f PNG
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-alpha2jpg-output-"$count".jpg -f JPG -q 100
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-alpha2bmp-output-"$count".bmp -f BMP
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-alpha2tga-output-"$count".tga -f TGA
  ((count++))
done





count=0
for imgs in $sample_heic_noalpha; do
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-noalpha2png-output-"$count".png -f PNG
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-noalpha2jpg-output-"$count".jpg -f JPG -q 100
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-noalpha2bmp-output-"$count".bmp -f BMP
  heic2img -i "$imgs" -o "$output_dir"/Teat-heic-noalpha2tga-output-"$count".tga -f TGA
  ((count++))
done






















