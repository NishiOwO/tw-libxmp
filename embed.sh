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

for i in "" ".offline"; do
	cp libxmp$i.js libxmp.full$i.js
	sed -i 's/full_libxmp = false/full_libxmp = true/' libxmp.full$i.js
done
