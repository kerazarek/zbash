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
		-o $ZBASH_DIR/components/set_textexpander_homedir.scpt \
		$ZBASH_DIR/components/set_textexpander_homedir.applescript
	osascript \
		$ZBASH_DIR/components/set_textexpander_homedir.scpt \
		$home_dir
fi
