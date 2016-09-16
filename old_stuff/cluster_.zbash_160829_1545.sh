#!/bin/bash

# export PS1='$ zss2002|\A \w >>> '
# export PS1='$ zss2002⎡\A⎤ \w ▷▷▷ '

if test -t 0; then
	export PS1="\
\[$(tput sgr0)\]\
\[$(tput setab 5)\]\
\[$(tput setaf 1)\]\
{\h}\
\[$(tput sgr0)\]\
 \
\[$(tput bold)\]\
\[$(tput setaf 3)\]\
\D{%y%m%d_%H%M}\
\[$(tput sgr0)\]\
 \
\[$(tput setaf 3)\]\
\w\
\[$(tput sgr0)\]\
 \
\[$(tput setaf 2)\]\
[\!]\
\[$(tput bold)\]\
>\
\[$(tput sgr0)\]\[$(tput setaf 6)\] \
"
fi

#~~~~

alias edp='nano ~/.zbash'
alias scp='source ~/.bashrc'
alias b='cd -'
alias ..='cd ..'
alias u='cd ..'
alias uu='cd ../..'

alias mv='mv -i'

alias ls='ls -Gh'
alias l='ls -1t'
# alias l1='ls -1'
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -t'
alias lh='l | head -n 25'
alias lless='l | less'
alias lll='ls -laGt | less'

function lj() {
	job=$1
	less +G `ls | grep "$job"`
}



alias rm='rm -i'

alias du='du -h'

function zdu {
	du -kc ./* |
	sort -n |
	awk '{printf "%'"'"'15d B - %s\n", $1, $2}'
}
function zdus {
	du -ksc ./* |
	sort -n |
	awk '{printf "%'"'"'15d B - %s\n", $1, $2}'
}

alias h='history | less +G'

# alias zync='rsync -avzh --stats'

alias c='clear'

alias less='less -S'

alias jq='/home/zss2002/jq-linux64 --tab'

#~~~~

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad # default

#~~~~

function litem() {

	ls -1t |
	awk -v item=$1 \
		'BEGIN {RS='\n'};
		{print $item}'

}

function l1() { litem 1; }
function l2() { litem 2; }
function l3() { litem 3; }
function l4() { litem 4; }
function l5() { litem 5; }

function less1() { less `l1`; }
function less2() { less `l2`; }
function less3() { less `l3`; }
function less4() { less `l4`; }
function less5() { less `l5`; }

function cd1() { cd `l1`; }
function cd2() { cd `l2`; }
function cd3() { cd `l3`; }
function cd4() { cd `l4`; }
function cd5() { cd `l5`; }

#~~~~

function timestamp() { date "+%y%m%d_%H%M" ; }
function thisdir() { pwd | awk 'BEGIN{FS="/"}; { print $NF }' ; }

function tgzpwd() {

	dir=`thisdir`
	ts=`timestamp`

	cd ..

	tar -zcvf ${dir}_${ts}.tgz $dir

}

#~~~~

alias pan='ssh panda2.pbtech'
alias pug='ssh fido'

#~~~~

alias zme='cd ~/namd/min_equil/zme/'
alias logs='cd ~/logs/'
alias nlogs='cd ~/logs/namd/'

#~~~~

source ~/maestro_2016-2

#~~~~

#/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore-CUDA/namd2
#/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore/namd2

alias namd2='/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore/namd2'

function qjobs() { qstat -u '*' ; }

# alias qzme='cd /home/zss2002/namd/min_equil/zme; qsub /home/zss2002/namd/min_equil/zme/qsub_zme.sh'
alias qzme='qsub qsub_zme.sh 2b1_start'
