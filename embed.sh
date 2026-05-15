#!/bin/sh
IFS=""
while read a; do
	if echo "$a" | grep 'EMBED XMP\.JS HERE' >/dev/null; then
		cat xmp.js
		echo "embedded = true;"
	else
		echo "$a"
	fi
done < libxmp.js > libxmp.offline.js
