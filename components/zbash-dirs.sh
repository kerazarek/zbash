#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

if (( IS_CLUSTER )); then
	alias snamd='cd ~/namd/sert_5ht_ifd'
	alias snamdsc='cd ~/namd/sert_5ht_ifd/scripts'
	alias slogs='cd ~/logs/namd/sert_5ht_ifd'
elif [[ $COMP == 'cube' ]]; then
	alias snamd='cd /Users/zss2002/pascal/namd/sert_5ht_ifd'
	alias snamdsc='cd /Users/zss2002/pascal/namd/sert_5ht_ifd/scripts'
	alias slogs='cd /Users/zss2002/pascal/logs/namd/sert_5ht_ifd'
fi

zo_dirs_script=$ZBASH_DIR/scripts/zo-dirs.py
[[ -x $zo_dirs_script ]] || chmod +x $zo_dirs_script
function zodir() {
	$zo_dirs_script $@
}
