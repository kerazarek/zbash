#!/usr/bin/env bash

### zbash-text.sh - text transformations
  #
  # (c) Zarek Siegel
  # created 10/16/16 21:49
  #

# shell formatting script
TERM=xterm-256color
chmod +x "$ZBASH_DIR/scripts/form.sh"
function form() {
	form_script="$ZBASH_DIR/scripts/form.sh"
	echo -en $($form_script $@);
}

# clear formatting
function clearform() {
	echo -n $(echo $(form -c) | sed -e 's/\\\[//' -e 's/\\\]//') ;
}

# python formatting script
chmod +x "$ZBASH_DIR/scripts/pyform.py"
function pyform() {
	pyform_script="$ZBASH_DIR/scripts/pyform.py"
	$pyform_script $@
}

# convert SI numbers
chmod +x "$ZBASH_DIR/scripts/sinum.sh"
alias sinum='$ZBASH_DIR/scripts/sinum.sh'

# convert SI numbers (python version)
chmod +x "$ZBASH_DIR/scripts/pynum.py"
alias pynum='$ZBASH_DIR/scripts/pynum.py'
