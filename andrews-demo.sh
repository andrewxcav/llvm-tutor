#!/bin/bash

# pre build analysis only Hello World pass:
clang -emit-llvm -S  -O0   inputs/input_for_hello.c  -o test.ll
opt test.ll --load=HelloWorld/libHelloWorld.so --legacy-hello-world  -time-passes  -S  -dot-cfg -o output.ll

# for the next step
# mkdir build && pushd build
# cmake -DLT_LLVM_INSTALL_DIR=/usr ../
# make

clang -emit-llvm -S -O1 inputs/input_for_mba.c
opt input_for_mba.ll --load=./build/lib/libMBAAdd.so --legacy-mba-add  -S  -dot-cfg -o output_for_mba.ll
meld input_for_mba.ll output_for_mba.ll

