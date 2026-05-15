#!/bin/sh
emcc -o xmp.js xmp.c \
  -I ../libxmp/include \
  ../libxmp/build/libxmp.a \
  -s WASM=1 \
  -s SINGLE_FILE=1 \
  -s EXPORTED_FUNCTIONS='["_xmp_start", "_xmp_read", "_xmp_end", "_xmp_loop_count", "_malloc", "_free"]' \
  -s EXPORTED_RUNTIME_METHODS='["cwrap", "ccall", "HEAPF32", "HEAPU8", "addFunction"]' \
  -s MODULARIZE=1 \
  -s ALLOW_TABLE_GROWTH=1 \
  -s EXPORT_NAME="libxmp" 
