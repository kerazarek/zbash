#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

# Default human readability
alias df='df -h'
alias du='du -h'

# python du equivalent
chmod +x "$ZBASH_DIR/scripts/pydu.py"
function pydu() {
	pydu_script="$ZBASH_DIR/scripts/pydu.py"
	$pydu_script $@
}

# z's pretty du
function zdu() {
	tmp=./zdu.$(date "+%s").tmp
	[[ $(uname -s) == 'Linux' ]] && depth_arg="--max-depth=0"
	[[ $(uname -s) == 'Darwin' ]] && depth_arg="-d 0"
	sort="-n"
	for arg in "$@"; do
		if echo $arg | grep -Eq '^-d'; then
			depth_arg=$arg
			depth_arg=${depth_arg/-/}
			depth_arg=${depth_arg/d/}
			[[ $(uname -s) == 'Linux' ]] && depth_arg="--max-depth=$depth_arg"
			[[ $(uname -s) == 'Darwin' ]] && depth_arg="-d $depth_arg"
		elif echo $arg | grep -Eq '^-s'; then
			sort=$arg
			sort=${sort/-/}
			sort=${sort/s/}
			case $sort in
				n) sort="-n" ;;
				k) sort="-k 2" ;;
			esac
		elif [[ -d $arg ]]; then
			query_dir="$arg"
		fi
	done
	query_dir=${query_dir:-.}
	# echo time_arg $time_arg
	# echo depth_arg $depth_arg
	# echo query_dir $query_dir
	# echo tmp $tmp
	du \
		-k \
		-c \
		$time_arg \
		$depth_arg \
		$query_dir \
		> $tmp
	cat $tmp | sort $sort > $tmp.2
	printf "%s -\t%s\t%s\n" "SIZE" "PATH" "MODTIME" > $tmp.3
	[[ $(uname -s) == 'Linux' ]] && time_arg="--time --time-style=+%y%m%d_%H%M%S"
	[[ $(uname -s) == 'Darwin' ]] && time_arg=""
	while read entry; do
		size=$(echo $entry | awk '{print $1}')
		time=$(echo $entry | awk '{print $2}')
		path=$(echo $entry | awk '{print $3}')
		size=$(( size * 1000 ))
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

# defunct (?)
# function zdu {
# 	du -kc -B 1000 ./* |
# 	sort -n |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zdu1 {
# 	du -kc -B 1000 --max-depth=1 ./* |
# 	sort -n |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zduk {
# 	du -kc -B 1000 ./* |
# 	sort -k 2 |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zduk1 {
# 	du -kc -B 1000 --max-depth=1 ./* |
# 	sort -k 2 |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zdus {
# 	du -ksc -B 1000 ./* |
# 	sort -n |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zdus1 {
# 	du -ksc -B 1000 --max-depth=1 ./* |
# 	sort -n |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zdusk {
# 	du -ksc -B 1000 ./* |
# 	sort -k 2 |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
# function zdusk1 {
# 	du -ksc -B 1000 --max-depth=1 ./* |
# 	sort -k 2 |
# 	awk '{printf "%'"'"'15d kB - %s\n", $1, $2}'
# }
