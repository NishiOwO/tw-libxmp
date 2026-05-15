// Name: Libxmp
// ID: nishiowoLibxmp
// Description: Use Libxmp.
// By: NishiOwO
// License: BSD-3-Clause

// Repository is at https://github.com/nishiowo/tw-libxmp

(async function(Scratch) {
	"use strict";

	if (!Scratch.extensions.unsandboxed) {
		throw new Error("DECtalk must be run unsandboxed");
	}

  	let Module;
	let xmp;
	let embedded = false;
	var libxmp;

	/* DO NOT REMOVE THE COMMENT BELOW!!! */
	/* EMBED XMP.JS HERE */

	if(embedded){
		xmp = libxmp;
	}else{
		xmp = await Scratch.evalAndReturn("", "libxmp");
	}

	Module = await xmp();

	class Libxmp {
		getInfo() {
			return {
			};
		}
	};
	
	Scratch.extensions.register(new Libxmp());
})(Scratch);
