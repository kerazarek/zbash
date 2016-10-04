#!/bin/bash

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
