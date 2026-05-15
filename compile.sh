#!/bin/sh
emcc -o xmp.js xmp.c \
  -I ../libxmp/include \
  ../libxmp/build/libxmp.a \
  -s WASM=1 \
  -s SINGLE_FILE=1 \
  -s EXPORTED_FUNCTIONS='["_xmp_load_module_from_memory", "_xmp_create_context", "_xmp_start_player", "_xmp_end_player", "_xmp_release_module", "_xmp_free_context", "_malloc", "_free"]' \
  -s EXPORTED_RUNTIME_METHODS='["cwrap", "ccall", "HEAP16", "HEAP8", "addFunction"]' \
  -s MODULARIZE=1 \
  -s ALLOW_TABLE_GROWTH=1 \
  -s EXPORT_NAME="XMP" 
