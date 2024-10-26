# imgtools

[![Build Status](https://github.com/KaliAssistant/imgtools/actions/workflows/build.yml/badge.svg)](https://github.com/KaliAssistant/imgtools/actions)

Noteworthy:

* image to image Converter: [img2img.c](./src/img2img.c)
* image to lcd, oled (img2lcd, xbm): [img2lcd.c](./src/img2lcd.c)
* heic to image Converter: [heic2img.c](./src/heic2img.c)

| file                           | input format       | color              | depth       |      output format |
|:-------------------------------|--------------------|--------------------|-------------|-------------------:|
| [img2img.c](./src/img2img.c)   | JPG, PNG, TGA, BMP | RGB888, RGBA8888   | 8bit        | JPG, PNG, TGA, BMP |
| [img2lcd.c](./src/img2lcd.c)   | JPG, PNG, TGA, BMP | RGB888, RGB565, WK | 8/565/1 bit | C header, XBM, bin |
| [heic2img.c](./src/heic2img.c) | HEIF (HEIC)        | RGB888             | 8bit        | JPG, PNG, TGA, BMP |

