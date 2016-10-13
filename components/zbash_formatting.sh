#!/usr/bin/env bash

TERM=xterm-256color
function form() {
	# zbash_formatting="$ZHOME/.zbash_formatting.sh"
	zbash_formatting="$ZBASH_DIR/components/zbash_formatting.sh"
	echo -en $($zbash_formatting $@);
}

function verbose_message() {

	echo "~~~~~v~e~r~b~o~s~e~~~m~o~d~e~~~~~"
	echo
	echo ">>> -$OPTION was triggered!"
	printf "      %-12s : %s\n" "OPTION" "$OPTION"
	printf "      %-12s : %s\n" "DESCRIPTION" "$DESCRIPTION"
	printf "      %-12s : %s\n" "OPTIND" "$OPTIND"
	printf "      %-12s : %s\n" "OPTARG" "$OPTARG"
	printf "      %-12s : %s\n" "OPTERR" "$OPTERR"
	echo

}

export PS1_FORMATTING=""
function output() {

# 	if test $PS1_FORMATTING; then
# 		# FORMATTED_OUTPUT="$FORMATTED_OUTPUT$(echo -en "\\[${FORMATTING}\\]")"
# 		if test $verbose; then
# 			verbose_message >&2
# 			echo -n ' --> printing: ``\[' >&2
# 			echo -n $(printf %q $FORMATTING | xargs printf %s | sed 's/\$//') >&2
# 			printf "\\\]''\n\n" >&2
# 		else
# 			echo -en "\\[${FORMATTING}\\]"
# 		fi
# 	else
# 		# FORMATTED_OUTPUT="$FORMATTED_OUTPUT$(printf %s ${FORMATTING})"
# 		if test $verbose; then
# 			verbose_message >&2
# 			echo -n ' --> printing: ``' >&2
# 			echo -n $(printf %q $FORMATTING | xargs printf %s | sed 's/\$//') >&2
# 			printf "''\n\n" >&2
# 		else
# 			echo -en "\\\[$FORMATTING\\\]"
# 		fi
# 	fi

# 	echo -en "\\[${FORMATTING}\\]"
	echo -n
}

# echo "$@"
# if test $verbosity; then echo verbose; else echo not verbose; fi

function outputtt() {
	echo -en $FORMATTING
}

FORMATTING=""
while getopts ":pcbuUsSo:g:t:nvh" OPTION; do
	case "$OPTION" in
		p)
			DESCRIPTION="PS1 formatting (for tput)"
# 			export PS1_FORMATTING=true
			output
			;;
		c)
			DESCRIPTION="clear formatting (tput sgr0)"
			FORMATTING=$(tput sgr0)
# 			echo -en $(tput sgr0)
			echo -en "\\[$(tput sgr0)\\]"
			output
			;;
		b)
			DESCRIPTION="format bold (tput bold)"
			FORMATTING=$(tput bold)
# 			echo -en $(tput bold)
			echo -en "\\[$(tput bold)\\]"
			output
			;;
		u)
			DESCRIPTION="underline (tput smul)"
			FORMATTING=$(tput smul)
# 			echo -en $(tput smul)
			echo -en "\\[$(tput smul)\\]"
			output
			;;
		U)
			DESCRIPTION="exit underline mode (tput rsmul)"
			FORMATTING=$(tput rmul)
# 			echo -en $(tput rmul)
			echo -en "\\[$(tput rmul)\\]"
			output
			;;
		s)
			DESCRIPTION="standout (reversed) mode (tput smso)"
			FORMATTING=$(tput smso);
# 			echo -en $(tput smso)
			echo -en "\\[$(tput smso)\\]"
			output
			;;
		S)
			DESCRIPTION="exit standout mode (tput rmso)"
			FORMATTING=$(tput rmso);
# 			echo -en $(tput rmso)
			echo -en "\\[$(tput rmso)\\]"
			output
			;;
		o)
			DESCRIPTION="foreground coloring (8 bit)"
			color=$OPTARG
			FORMATTING="\\[\\e[38;5;${color}m\\]"
# 			echo -en "\\e[38;5;${color}m"
			echo -en "\\[\\e[38;5;${color}m\\]"
			output
			outputtt
			;;
		g)
			DESCRIPTION="background coloring (8 bit)"
			color=$OPTARG
			FORMATTING="\\e[48;5;${color}m"
# 			echo -en "\\e[48;5;${color}m"
			echo -en "\\[\\e[48;5;${color}m\\]"
			output
			;;
		t)
			DESCRIPTION="text to format"
			text=$OPTARG
			FORMATTING=$(printf "%s" "$text")
			printf "%s" "$text"
			output
			;;
		n)
			DESCRIPTION="new line"
			text="\\n"
			FORMATTING=$(printf "%s" "$text")
			printf "%s" "$text"
			output
			;;
		v)
			DESCRIPTION="increased verbosity"
			verbose=true
# 			printf "\n%s\n" "~~~ zbash_formatting.sh: Verbose Mode ~~~"
			output
			;;
		h)
			DESCRIPTION="help message"
			output
			;;
		\?)
			DESCRIPTION="Shortcuts for coloring or text"
			if echo $OPTARG | grep -Eq '[0-9]{1,3}'; then
				color=$OPTARG
				FORMATTING=\\e[38;5;${color}m
# 				echo -en \\e[38;5;${color}m
				echo -en "\\[\\e[38;5;${color}m\\]"
			else
				text=$OPTARG
				FORMATTING=$(printf "%s" "$text")
				printf "%s" "$text"
				echo -en "\\[$(printf "%s" "$text")\\]"
			fi
			output
			;;
	esac
done


function clearform() {
	echo -n $(echo $(form -c) | sed -e 's/\\\[//' -e 's/\\\]//') ;
}
