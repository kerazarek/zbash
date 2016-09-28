#!/bin/bash

### Listing files
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

# Default options
alias ls='clearform; ls -Gh'

# Shortcuts
alias ll='ls -Gla'
alias la='ls -Ga'
alias lt='ls -Gt'
alias lh='ls -G1t | head'
alias cf='ls | wc -l'
alias lr='ls -Gur'

# Item grabbing
function litem() {
	ls -1t |
	awk -v item=$1 'BEGIN {RS='\n'}; {print $item};'
}
function li() { litem $1; }

# l
function l() {
	if ! test $1; then
		ls -G1t
	elif echo $1 | grep -Eq '^\d+$'; then
		litem $1
	else
		ls -1Gt $1
	fi
}
function l1() { litem 1 ; }
function l2() { litem 2 ; }
function l3() { litem 3 ; }
function l4() { litem 4 ; }
function l5() { litem 5 ; }


# Colors!
export CLICOLOR=1
export LSCOLORS="\
Ex\
fx\
cx\
dx\
bx\
eg\
ed\
ab\
ag\
ac\
ad\
"

################################################################################

# Below from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
	# a black
	# b red
	# c green
	# d brown
	# e blue
	# f magenta
	# g cyan
	# h light grey
	# A bold black, usually shows up as dark grey
	# B bold red
	# C bold green
	# D bold brown, usually shows up as yellow
	# E bold blue
	# F bold magenta
	# G bold cyan
	# H bold light grey; looks like bright white
	# x default foreground or background

	# 1. directory
	# 2. symbolic link
	# 3. socket
	# 4. pipe
	# 5. executable
	# 6. block special
	# 7. character special
	# 8. executable with setuid bit set
	# 9. executable with setgid bit set
	# 10. directory writable to others, with sticky bit
	# 11. directory writable to others, without sticky bit
