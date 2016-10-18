#!/usr/bin/env bash

### si-num.sh
  #
  # change a number to its SI-prefixed equivalent
  #
  # (c) Zarek Siegel
  # created 10/16/16 21:25
  #

function sinum() {
	if test $1 = '-h' -o $1 = '--help'; then
		echo 'si-num.sh - change a number to its SI-prefixed equivalent'
		echo 'Usage: sinum <number> [<unit>]'
		exit 0
	fi
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

sinum $@
