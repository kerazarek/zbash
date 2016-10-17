#!/usr/bin/env bash

### zbash-text.sh - text transformations
  #
  # (c) Zarek Siegel
  # created 10/16/16 21:49
  #

# shell formatting script
TERM=xterm-256color
function form() {
	form_script="$ZBASH_DIR/scripts/form.sh"
	echo -en $($form_script $@);
}

# clear formatting
function clearform() {
	echo -n $(echo $(form -c) | sed -e 's/\\\[//' -e 's/\\\]//') ;
}

# python formatting script
function pyform() {
	pyform_script="$ZBASH_DIR/scripts/pyform.py"
	echo -en $($pyform_script $@);
}

# convert SI numbers
alias sinum='$ZBASH_DIR/scripts/sinum.sh'
