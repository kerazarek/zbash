#!/usr/bin/env bash

   #######################
  ###########################
 #####   zbash_master.sh   #####
    ###########################
       #######################

echo $BASH_VERSION

### unifying script joining zbash parts
timestamp=$(date "+%y%m%d_%H%M%S")
out_log=~/logs/zbash_source.$timestamp.out.log
err_log=~/logs/zbash_source.$timestamp.err.log

export ZBASH_DIR=~/.zbash
component_shs="
	zbash_comps.sh
	zbash_app_aliases.sh
	zbash_cd.sh
	zbash_cluster.sh
	zbash_datetime.sh
	zbash_defunct.sh
	zbash_dirs.sh
	zbash_du.sh
	zbash_formatting.sh
	zbash_locations.sh
	zbash_ls.sh
	zbash_misc.sh
	zbash_prompt.sh
	zbash_rsync.sh
	zbash_textexpander.sh
	zbash_ssh.sh
"
sh_i=1
n_scripts=$(echo $component_shs | wc -w)
printf ">>> sourcing %s scripts...\n\t"
line_width=4
for f in $component_shs; do
	# echo ">>> sourcing \`\`$f''"
	# printf "(%d/%d) " $sh_i $n_scripts
	# printf "%-20s " "[$sh_i: $(echo $f | perl -pe 's/^zbash_(.*?)\.sh$/\1/;')]"
	script_stem=$(echo $f | perl -pe 's/^zbash_(.*?)\.sh$/\1/;')
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

# gzip $out_log
# gzip $err_log


# echo ">>> out log at $out_log"
# echo ">>> err log at $err_log"

# for f in $ZBASH_DIR/components/*.sh; do



