#!/bin/bash

   #######################
  ###########################
 #####   zbash_master.sh   #####
    ###########################
       #######################

### unifying script joining zbash parts
ZBASH_DIR=~/Dropbox/zbash
for f in $ZBASH_DIR/components/*.sh; do
	echo ">>> sourcing \`\`$f''"
	source $f
done



