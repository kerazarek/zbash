#!/usr/bin/env bash

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
	/bin/ls -1t |
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

function less1() { less +G `l1`; }
function less2() { less +G `l2`; }
function less3() { less +G `l3`; }
function less4() { less +G `l4`; }
function less5() { less +G `l5`; }

lessf() { less +F $1 ; }

function lessf1() { less +F `l1`; }
function lessf2() { less +F `l2`; }
function lessf3() { less +F `l3`; }
function lessf4() { less +F `l4`; }
function lessf5() { less +F `l5`; }

function cd1() { cd `l1`; }
function cd2() { cd `l2`; }
function cd3() { cd `l3`; }
function cd4() { cd `l4`; }
function cd5() { cd `l5`; }

function j() { ls | grep "$1" | grep ".out" ; }
lj() { less +S `j $1` ; }

sls() { /bin/ls -t | grep $1 | awk 'BEGIN{RS='\n'}; {print $1}' ; }
lessls() { less `sls $1` ; }

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
