#!/bin/bash

set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
BUILD_ROOT=$ROOT/..

make clean
make

mkdir ./tests/data
cd ./tests/data
wget https://github.com/KaliAssistant/imgtools/releases/download/1.0.0/data.7z
7z x data.7z

cd ..
./test.sh



