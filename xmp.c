#include <emscripten.h>
#include <xmp.h>
#include <string.h>
#include <stdlib.h>

EMSCRIPTEN_KEEPALIVE xmp_context* xmp_start(void* buffer, int length){
	xmp_context* ctx = malloc(sizeof(*ctx));

	*ctx = xmp_create_context();
	if(xmp_load_module_from_memory(*ctx, buffer, length) < 0){
		xmp_free_context(*ctx);
		free(ctx);
		return NULL;
	}

	if(xmp_start_player(*ctx, 44100, 0) != 0){
		xmp_release_module(*ctx);
		xmp_free_context(*ctx);
		free(ctx);
		return NULL;
	}

	return ctx;
}

EMSCRIPTEN_KEEPALIVE float* xmp_read(xmp_context* ctx){
	short* buffer;
	float* ret;
	int i;
	struct xmp_frame_info fi;

	xmp_play_frame(*ctx);
	xmp_get_frame_info(*ctx, &fi);

	buffer = malloc(sizeof(*buffer) + fi.buffer_size);
	buffer[0] = fi.buffer_size / 2 / sizeof(*buffer);
	memcpy(&buffer[1], fi.buffer, fi.buffer_size);

	ret = malloc(sizeof(*ret) * (buffer[0] * 2 + 1));

	ret[0] = buffer[0];
	for(i = 0; i < 2 * buffer[0]; i++){
		ret[i + 1] = buffer[i + 1] / 32767.0;
	}

	free(buffer);

	return ret;
}

EMSCRIPTEN_KEEPALIVE void xmp_end(xmp_context* ctx){
	xmp_end_player(*ctx);
	xmp_release_module(*ctx);
	xmp_free_context(*ctx);
	free(ctx);
}	

EMSCRIPTEN_KEEPALIVE int xmp_loop_count(xmp_context* ctx){
	struct xmp_frame_info fi;

	xmp_get_frame_info(*ctx, &fi);

	return fi.loop_count;
}	
