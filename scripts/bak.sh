#!/usr/bin/env bash

### bak.sh - interactively change file name to a timestamped .BAK
  #
  # (c) Zarek Siegel
  # created 10/18/16 15:05
  #

for f in $@; do
	# make sure it exists
	if test -d $f; then
		echo "(FYI \`\`$f'' is a directory)"
	elif test ! -f $f; then
		echo "\`\`$f'' is not a file or a directory, or it doesn't exist, exiting"
		exit 1
	fi
	# no trailing slashes
	if echo $f | grep -Eq '/$'; then
		f=$(echo $f | perl -pe 's/\/$//;')
	fi
	timestamp=$(date "+%y%m%d_%H%M%S")
	echo ">>> \`\`$f'' will be renamed \`\`$f.$timestamp.BAK'', is that ok? [y|Y]"
	read answer
	if echo $answer | grep -Eq '^[yY]$'; then
		mv -v "$f" "$f.$timestamp.BAK"
	else
		echo "ok, didn't do anything"
	fi
done
