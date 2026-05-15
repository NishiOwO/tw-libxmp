(async function(Scratch) {
	"use strict";

	if (!Scratch.extensions.unsandboxed) {
		throw new Error("DECtalk must be run unsandboxed");
	}

  	let Module;
	let xmp;
	let embedded = false;
	var XMP;

	if(embedded){
		xmp = XMP;
	}else{
		xmp = await Scratch.evalAndReturn("", "XMP");
	}

	Module = await xmp();

	class LibXMP {
		getInfo() {
			return {
			};
		}
	};
	
	Scratch.extensions.register(new LibXMP());
})(Scratch);
