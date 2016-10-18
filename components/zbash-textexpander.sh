#!/bin/bash

### switch textexpander based off computer
  #
  # (c) Zarek Siegel
  # created 10/07/16 22:30
  #

# sets the expansion "~//" to $HOME
#	other expansions are derived therefrom

if uname -s | grep -q "Darwin"; then
	home_dir=$HOME
	osacompile \
		-o $ZBASH_DIR/scripts/set-textexpander-homedir.scpt \
		$ZBASH_DIR/scripts/set-textexpander-homedir.applescript
	osascript \
		$ZBASH_DIR/scripts/set-textexpander-homedir.scpt \
		$home_dir
fi
