#!/bin/bash

export PATH=/home/zss2002/bin:$PATH
export R_HOME=/home/zss2002/bin/R-3.2.5

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

alias rm='rm -i'

alias du='du -h'

function zdu {
	du -kc -B 1000 ./* |
	sort -n |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zdu1 {
	du -kc -B 1000 --max-depth=1 ./* |
	sort -n |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zduk {
	du -kc -B 1000 ./* |
	sort -k 2 |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zduk1 {
	du -kc -B 1000 --max-depth=1 ./* |
	sort -k 2 |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zdus {
	du -ksc -B 1000 ./* |
	sort -n |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zdus1 {
	du -ksc -B 1000 --max-depth=1 ./* |
	sort -n |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zdusk {
	du -ksc -B 1000 ./* |
	sort -k 2 |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}
function zdusk1 {
	du -ksc -B 1000 --max-depth=1 ./* |
	sort -k 2 |
	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
}

function sinum() {
	num_in=$1
	unit=$2
	if test ! $unit; then unit=u; fi
	num_e=$(printf "%e" $num_in)
	num_significand=${num_e/e*/}
	num_significand=$(printf "%f" $num_significand)
	num_exponent=${num_e/*e/}
	num_exponent=${num_exponent/+/}
	num_exponent=$(echo $num_exponent | sed 's/^0\{1,\}//')
	if test ! $num_exponent; then num_exponent=0; fi
	if test $num_exponent -le -16; then
		unit=y$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 24 ) )")
	elif test $num_exponent -ge -21 -a $num_exponent -le -19; then
		unit=z$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 21 ) )")
	elif test $num_exponent -ge -18 -a $num_exponent -le -16; then
		unit=a$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 18 ) )")
	elif test $num_exponent -ge -15 -a $num_exponent -le -13; then
		unit=f$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 15 ) )")
	elif test $num_exponent -ge -12 -a $num_exponent -le -10; then
		unit=p$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 12 ) )")
	elif test $num_exponent -ge -9 -a $num_exponent -le -7; then
		unit=n$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 9 ) )")
	elif test $num_exponent -ge -6 -a $num_exponent -le -4; then
		unit=μ$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 6 ) )")
	elif test $num_exponent -ge -3 -a $num_exponent -le -1; then
		unit=m$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 3 ) )")
	elif test $num_exponent -ge 0 -a $num_exponent -le 2; then
		unit=$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent + 0 ) )")
	elif test $num_exponent -ge 3 -a $num_exponent -le 5; then
		unit=k$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 3 ) )")
	elif test $num_exponent -ge 6 -a $num_exponent -le 8; then
		unit=M$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 6 ) )")
	elif test $num_exponent -ge 9 -a $num_exponent -le 11; then
		unit=G$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 9 ) )")
	elif test $num_exponent -ge 12 -a $num_exponent -le 14; then
		unit=T$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 12 ) )")
	elif test $num_exponent -ge 15 -a $num_exponent -le 17; then
		unit=P$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 15 ) )")
	elif test $num_exponent -ge 18 -a $num_exponent -le 20; then
		unit=E$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 18 ) )")
	elif test $num_exponent -ge 21 -a $num_exponent -le 23; then
		unit=Z$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 21 ) )")
	elif test $num_exponent -ge 24; then
		unit=Y$unit
		num_out=$(bc <<< "$num_significand * ( 10 ^ ( $num_exponent - 24 ) )")
	fi
	# num_out=$(echo $num_out | sed 's/0\{1,\}$//')
	# num_out=$(echo $num_out | sed 's/\.$/.0/')
	num_out=$(printf "%.1f" $num_out)
	output="$num_out $unit"

	# printf "%-20s: %s\n" num_in $num_in
	# printf "%-20s: %s\n" num_e $num_e
	# printf "%-20s: %s\n" num_significand $num_significand
	# printf "%-20s: %s\n" num_exponent $num_exponent
	# printf "%-20s: %s\n" num_out $num_out
	# printf "%-20s: %s\n" unit $unit
	# printf "%-20s: %s\n" output "$output"

	echo $output

}

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

function zdu() {
	tmp=./zdu.$(date "+%s").tmp
	depth="--max-depth=0"
	sort="-n"
	for arg in "$@"; do
		if echo $arg | grep -Eq '^-?d'; then
			depth=$arg
			depth=${depth/-/}
			depth=${depth/d/}
			depth="--max-depth=$depth"
		elif echo $arg | grep -Eq '^-?s'; then
			sort=$arg
			sort=${sort/-/}
			sort=${sort/s/}
			case $sort in
				n) sort="-n" ;;
				k) sort="-k 2" ;;
			esac
		fi
	done
	du \
		-b \
		-c \
		--time \
		--time-style=+%y%m%d_%H%M%S \
		$depth \
		./* \
		> $tmp
	cat $tmp | sort $sort > $tmp.2
	printf "%s -\t%s\t%s\n" "SIZE" "PATH" "MODTIME" > $tmp.3
	while read entry; do
		size=$(echo $entry | awk '{print $1}')
		time=$(echo $entry | awk '{print $2}')
		path=$(echo $entry | awk '{print $3}')
		size=$(sinum $size B)
		size=$(printf "%s%3s" $size)
		echo "\"$size\"" >> $tmp.sizes
		echo "\"$time\"" >> $tmp.times
		echo "\"$path\"" >> $tmp.paths
		printf "%s\t%s\t%s\n" "$size" "$path" "$time" >> $tmp.3
	done < $tmp.2
	size_len=$(cat $tmp.sizes)
	time_len=$(cat $tmp.times)
	path_len=$(cat $tmp.paths)
	size_len=$(max_list_len $size_len)
	time_len=$(max_list_len $time_len)
	path_len=$(max_list_len $path_len)
	awk '{printf "%'$size_len's %-2s - %-'$path_len's - %-'$time_len's\n", $1, $2, $3, $4;}' $tmp.3
	rm -f ${tmp}*
}

alias h='history | less +G'

# alias zync='rsync -avzh --stats'

alias c='clear'

alias less='less -S'

alias jq='/home/zss2002/bin/jq-linux64 --tab'

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

function j() { ls | grep "$1" | grep ".out" ; }
lj() { less +S `j $1` ; }

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
alias slogs='cd ~/logs/namd/sert_5ht_ifd/'
alias snamd='cd ~/namd/sert_5ht_ifd/'
function qifd() {
	if echo $1 | grep -Eq '^(1a|1b|1c|2a[1-6]|2b[1-3]|3|3_[0-9]+)$'; then
		qsub -N ifd_me_$1 scripts/qsub_sert_5ht_ifd.sh $1
	else
		echo "!!! bad phase"
	fi
}

alias cgmpost='/home/zss2002/charmmgui/cg_memb_160829/cgm_post.sh'

#~~~~

source ~/.maestro_2016-2

#~~~~

#/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore-CUDA/namd2
#/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore/namd2

alias namd2='/zenodotus/hwlab/store/mac2109/src/NAMD_2.11_Linux-x86_64-multicore/namd2'

function qjobs() { qstat -u '*' ; }

# alias qzme='cd /home/zss2002/namd/min_equil/zme; qsub /home/zss2002/namd/min_equil/zme/qsub_zme.sh'
alias qzme='qsub qsub_zme.sh 2b1_start'

#~~~

alias grep_err='/home/zss2002/namd/min_equil/zme/grep_err.sh'

#~~~

alias vmdt='vmd -dispdev text -eofexit'
