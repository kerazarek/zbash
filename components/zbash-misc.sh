#!/usr/bin/env bash

### Misc
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

# Terminal
if uname -s | grep -q 'Darwin'; then
	tabs -4
fi
alias c='clear'

# Interactive function
alias mv='mv -i'
alias rm='rm -i'

# PWD
alias pdw='pwd'
alias pwd_list='pwd_list=$( for file in ./*; do echo \"$file\"; done )'

# Permissions
alias me='chmod +x'

# History
alias h='history | less +G'
export HISTSIZE=10000
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '
export HISTCONTROL=ignoreboth
export HISTIGNORE="history:pwd:exit:df:du:ll:ls"

# Shell options
shopt -s autocd
#shopt -s cdable_vars
shopt -s direxpand

# Bash completion
# mac
if uname -s | grep -q "Darwin"; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
	  . $(brew --prefix)/etc/bash_completion
	fi
# linux
fi

# File type
function typeof() {
	arg=$1

	if test -f $arg; then
		type=file
		if test -x $arg; then
			type=executable
		fi
	elif test -d $arg; then
		type=dir
	elif test -L $arg; then
		type=symlink
	else
		echo "!!! invalid argument given to typeof()"
	fi

	echo $type

}

# Get the length of the longest item in a list
function max_list_len() {
	list="$@"
	len=0
	for item in $list; do
		if test ${#item} -gt $len; then
			len=${#item}
		fi
	done
	echo $len
}

# ztar - my special lil version of tar for compressing directories
function ztar() {
	$ZBASH_DIR/scripts/ztar.sh $@
}

# bak.sh
function bak() {
	$ZBASH_DIR/scripts/bak.sh $@
}
