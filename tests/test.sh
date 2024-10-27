#!/bin/bash


debug_dir=$(pwd)/../debug
data_dir=$(pwd)/data
output_dir=$(pwd)/output

export PATH=$PATH:$debug_dir

sample_jpeg="$data_dir/Sample-jpg-*.jpg"
sample_tga="$data_dir/Sample-tga-*.tga"
sample_png_no_alpha="$data_dir/Sample-png-noalpha-*.png"
sample_png_alpha="$data_dir/Sample-png-alpha-*.png"
sample_bmp_noalpha="$data_dir/Sample-bmp-noalpha-*.bmp"
sample_bmp_alpha="$data_dir/Sample-bmp-alpha-*.bmp"

count=0
for imgs in $sample_png_no_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2bmp-output-"$count".bmp -f BMP&
  ((count++))
done
count=0
for imgs in $sample_png_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2bmp-output-"$count".bmp -f BMP&
  ((count++))
done
count=0
for imgs in $sample_jpeg; do
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2bmp-output-"$count".bmp -f BMP&
  ((count++))
done
count=0
for imgs in $sample_bmp_noalpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2bmp-output-"$count".bmp -f BMP&
  ((count++))
done
count=0
for imgs in $sample_bmp_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2bmp-output-"$count".bmp -f BMP&
  ((count++))
done
count=0
for imgs in $sample_tga; do
  img2img -i "$imgs" -o "$output_dir"/Test-tga2bmp-output-"$count".bmp -f BMP&
  ((count++))
done









count=0
for imgs in $sample_png_no_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2png-output-"$count".png -f PNG&
  ((count++))
done
count=0
for imgs in $sample_png_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2png-output-"$count".png -f PNG&
  ((count++))
done
count=0
for imgs in $sample_jpeg; do
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2png-output-"$count".png -f PNG&
  ((count++))
done
count=0
for imgs in $sample_bmp_noalpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2png-output-"$count".png -f PNG&
  ((count++))
done
count=0
for imgs in $sample_bmp_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2png-output-"$count".png -f PNG&
  ((count++))
done
count=0
for imgs in $sample_tga; do
  img2img -i "$imgs" -o "$output_dir"/Test-tga2png-output-"$count".png -f PNG&
  ((count++))
done






count=0
for imgs in $sample_png_no_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done
count=0
for imgs in $sample_png_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done
count=0
for imgs in $sample_jpeg; do
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done
count=0
for imgs in $sample_bmp_noalpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done
count=0
for imgs in $sample_bmp_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done
count=0
for imgs in $sample_tga; do
  img2img -i "$imgs" -o "$output_dir"/Test-tga2jpg-output-"$count".jpg -f JPG -q 100&
  ((count++))
done




count=0
for imgs in $sample_png_no_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-noalpha2tga-output-"$count".tga -f TGA&
  ((count++))
done
count=0
for imgs in $sample_png_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-png-alpha2tga-output-"$count".tga -f TGA&
  ((count++))
done
count=0
for imgs in $sample_jpeg; do
  img2img -i "$imgs" -o "$output_dir"/Test-jpg2tga-output-"$count".tga -f TGA&
  ((count++))
done
count=0
for imgs in $sample_bmp_noalpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-noalpha2tga-output-"$count".tga -f TGA&
  ((count++))
done
count=0
for imgs in $sample_bmp_alpha; do
  img2img -i "$imgs" -o "$output_dir"/Test-bmp-alpha2tga-output-"$count".tga -f TGA&
  ((count++))
done
count=0
for imgs in $sample_tga; do
  img2img -i "$imgs" -o "$output_dir"/Test-tga2tga-output-"$count".tga -f TGA&
  ((count++))
done
