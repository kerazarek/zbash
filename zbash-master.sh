#!/usr/bin/env bash

   #######################
  ###########################
 #####   zbash-master.sh   #####
    ###########################
       #######################

echo $BASH_VERSION

### unifying script joining zbash parts
timestamp=$(date "+%y%m%d_%H%M%S")
if test ! -d ~/logs; then mkdir ~/logs; fi
out_log=~/logs/zbash_source.$timestamp.out.log
err_log=~/logs/zbash_source.$timestamp.err.log

export ZBASH_DIR=~/.zbash
component_shs="
	zbash-comps.sh
	zbash-app-aliases.sh
	zbash-cd.sh
	zbash-cluster.sh
	zbash-datetime.sh
	zbash-defunct.sh
	zbash-dirs.sh
	zbash-du.sh
	zbash-locations.sh
	zbash-ls.sh
	zbash-misc.sh
	zbash-prompt.sh
	zbash-rsync.sh
	zbash-ssh.sh
	zbash-text.sh
	zbash-textexpander.sh
"



sh_i=1
n_scripts=$(echo $component_shs | wc -w)
printf ">>> sourcing %s scripts...\n\t"
line_width=4
for f in $component_shs; do
	# echo ">>> sourcing \`\`$f''"
	# printf "(%d/%d) " $sh_i $n_scripts
	# printf "%-20s " "[$sh_i: $(echo $f | perl -pe 's/^zbash-(.*?)\.sh$/\1/;')]"
	script_stem=$(echo $f | perl -pe 's/^zbash-(.*?)\.sh$/\1/;')
	printf "(%d) %s" $sh_i $script_stem
	if test $sh_i -lt $n_scripts; then
		printf ", "
		line_width=$(bc <<< "$line_width + ${#sh_i} + 3 + ${#script_stem} + 2")
	else
		printf "\n"
	fi

	# if test $(echo "$sh_i % 5" | bc) -eq 0; then printf "\n\t"; fi
	if test $line_width -gt 60; then
		printf "\n\t"
		line_width=4
	fi

	source $ZBASH_DIR/components/$f 1> $out_log 2> $err_log
	((sh_i++))
done

function srcp {
	case $(uname -s) in
		"Darwin")
			source ~/.bash_profile
			;;
		"Linux")
			source ~/.bashrc
			;;
	esac
}

gzip $out_log
gzip $err_log


# echo ">>> out log at $out_log"
# echo ">>> err log at $err_log"

# for f in $ZBASH_DIR/components/*.sh; do



