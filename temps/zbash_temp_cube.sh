#!/bin/bash

export SCHRODINGER='/opt/schrodinger/suites2014-4/'


################################################################################

# PROMPT

# export PS1='$ zss2002|\A \w >>> '
# export PS1='👍 ︎ zss2002⎡\A⎤ \w ▷▷▷ '


################################################################################

# BASICS





export docs='/Users/zss2002/Documents'
export de='/Users/zss2002/Desktop'

################################################################################

# RSYNC

function zync() {

	src=$1
	dest=$2

	# if echo $src | grep -q '^/'; then
	# 	src=$src
	# elif echo $src | grep -q '^~'; then
	# 	src=$HOME/$src
	# else
	# 	src=$PWD/$src
	# fi
	# # echo $src
	#
	# if echo $dest | grep -q '^/'; then
	# 	dest=$dest
	# elif echo $dest | grep -q '^~'; then
	# 	dest=$HOME/$dest
	# else
	# 	dest=$PWD/$dest
	# fi
	# # echo $dest

	timestamp=`date +%y%m%d_%H%M`
	logfile=/Users/zss2002/logs/rsync_$timestamp.log
	stdoutlog=/Users/zss2002/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zync ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (rsync --avzhP --stats -e ssh --exclude=*.git* --exclude=bin/* --exclude=*DS_Store* --exclude=*/.*)" | tee -a $logfile $stdoutlog
	echo "  > source: 	 ${src}" | tee -a $logfile $stdoutlog
	echo "  > destination: ${dest}" | tee -a $logfile $stdoutlog
	echo "  > rsync log: 	 ${logfile}" | tee -a $logfile $stdoutlog
	echo "  > stdout log:	 ${stdoutlog}" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog
	echo ">>> starting $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

	# logformat='%a %b %B %c %f %G %h %i %l %L %m %M %n %o %p %P %t %u %U'
	# logformat='%i %n%L'

	rsync \
		-avzhP \
		--stats \
		-e ssh \
		--exclude=*.git* \
		--exclude=bin/* \
		--log-file=$logfile \
		--log-file-format='%i (%o) | mod: %M | perms: %B | transd: %b B		| %L%n' \
		$src $dest \
		| tee -a $stdoutlog

	echo "" | tee -a $logfile $stdoutlog
	echo ">>> finished $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

}

function zyncdel() {

	src=$1
	dest=$2

	timestamp=`date +%y%m%d_%H%M`
	logfile=/Users/zss2002/logs/rsync_$timestamp.log
	stdoutlog=/Users/zss2002/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zyncDEL ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (rsync --avzhP --delete --stats -e ssh --exclude=*.git* --exclude=*anaconda*)" | tee -a $logfile $stdoutlog
	echo "  > source: 	 ${src}" | tee -a $logfile $stdoutlog
	echo "  > destination: ${dest}" | tee -a $logfile $stdoutlog
	echo "  > rsync log: 	 ${logfile}" | tee -a $logfile $stdoutlog
	echo "  > stdout log:	 ${stdoutlog}" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog
	echo ">>> starting $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

	rsync \
		-avzhP \
		--delete \
		--stats \
		-e ssh \
		--exclude=*.git* \
		--exclude=*anaconda* \
		--log-file=$logfile \
		--log-file-format='%i (%o) | mod: %M | perms: %B | transd: %b B		| %L%n' \
		$src $dest \
		| tee -a $stdoutlog

	echo "" | tee -a $logfile $stdoutlog
	echo ">>> finished $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

}

function zyncn() {

	src=$1
	dest=$2

	timestamp=`date +%y%m%d_%H%M`
	logfile=/Users/zss2002/logs/rsync_$timestamp.log
	stdoutlog=/Users/zss2002/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zyncDEL ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (rsync --avzhP -n --stats -e ssh --exclude=*.git* --exclude=*anaconda*)" | tee -a $logfile $stdoutlog
	echo "  > source: 	 ${src}" | tee -a $logfile $stdoutlog
	echo "  > destination: ${dest}" | tee -a $logfile $stdoutlog
	echo "  > rsync log: 	 ${logfile}" | tee -a $logfile $stdoutlog
	echo "  > stdout log:	 ${stdoutlog}" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog
	echo ">>> starting $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

	rsync \
		-avzhP \
		-n \
		--stats \
		-e ssh \
		--exclude=*.git* \
		--exclude=*anaconda* \
		--log-file=$logfile \
		--log-file-format='%i (%o) | mod: %M | perms: %B | transd: %b B		| %L%n' \
		$src $dest \
		| tee -a $stdoutlog

	echo "" | tee -a $logfile $stdoutlog
	echo ">>> finished $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

}

function bizync() {

	zync $1 $2
	zync $2 $1

}

function zynczme() {
	zync /Users/zss2002/Documents/namd/min_equil/zme/ zss2002@pascal.med.cornell.edu:~/namd/min_equil/zme/ ;
}

function zyncifd() {
	zync /Users/zss2002/Documents/namd/sert_5ht_ifd/ zss2002@pascal.med.cornell.edu:~/namd/sert_5ht_ifd/ ;
}

function zynccgm() {
	zync /Users/zss2002/Documents/charmmGUI/cg_memb_160829/ zss2002@pascal.med.cornell.edu:~/charmmgui/cg_memb_160829/ ;
}

function zyncncgm() {
	zyncn /Users/zss2002/Documents/charmmGUI/cg_memb_160829/ zss2002@pascal.med.cornell.edu:~/charmmgui/cg_memb_160829/ ;
}

function zynccls() {
	zync zss2002@pascal.med.cornell.edu:~/ /Users/zss2002/Documents/cluster_sync/ ;
}

function zynczb() {
	zync /Users/zss2002/Dropbox/zbash/ zss2002@pascal.med.cornell.edu:~/.zbash/ ;
}

#  %a the remote IP address
#  %b the number of bytes actually transferred
#  %B the permission bits of the file (e.g. rwxrwxrwt)
#  %c the checksum bytes received for this file (only when sending)
#  %f the filename (long form on sender; no trailing "/")
#  %G the gid of the file (decimal) or "DEFAULT"
#  %h the remote host name
#  %i an itemized list of what is being updated
#  %l the length of the file in bytes
#  %L the string " -> SYMLINK", " => HARDLINK", or "" (where SYMLINK or HARDLINK is a filename)
#  %m the module name
#  %M the last-modified time of the file
#  %n the filename (short form; trailing "/" on dir)
#  %o the operation, which is "send", "recv", or "del." (the latter includes the trailing period)
#  %p the process ID of this rsync session
#  %P the module path
#  %t the current date time
#  %u the authenticated username or an empty string
#  %U the uid of the file (decimal)

################################################################################



################################################################################

function timestamp() { date "+%y%m%d_%H%M" ; }
function thisdir() { pwd | awk 'BEGIN{FS="/"}; { print $NF }' ; }

function tgzpwd() {

	dir=`thisdir`
	ts=`timestamp`

	cd ..

	tar -zcvf ${dir}_${ts}.tgz $dir

}

################################################################################

############################
###  PRINTING FUNCTIONS  ###
############################

function print_line() {
	printf "%0.1s" "#"{1..80}
	printf '\n'
}

print_var() {
	for v in "$@"; do
		var_name=$v
		var_value=$(eval echo \$$var_name)
		printf ">>> %-20s = %s\n" "$var_name" "$var_value"
	done
}

print_msg() {
	text=$@
	printf ">>> %s\n" "$text"
}

print_title() {
	text=$@
	full_line=$(printf '%0.1s' "#"{1..80})
	text_length=${#text}
	line_length=$(bc <<< "3 + 2 + $text_length + 2 + 3")
	trimmed_line=${full_line:1:$line_length}
	printf "%s\n###  %s  ###\n%s\n" "$trimmed_line" "$text" "$trimmed_line"
}

function title() { print_title $@ ; }

function cleanup_time() {
	input=$1
	days=$(($input/60/60/24))
	hrs=$(($input/60/60%24))
	min=$(($input/60%60))
	sec=$(($input%60))
	if test $days -gt 0; then printf '%dd:' $days; fi
	if test $hrs -gt 0; then printf '%dh:' $hrs; fi
	if test $min -gt 0; then printf '%dm:' $min; fi
	printf '%ds\n' $sec
}

################################################################################



################################################################################

# macOS COMMANDS

alias o='open'
# alias bb='open -a /Applications/BBEdit.app'
alias bb='bbedit'
alias bedp='bb /Users/zss2002/.bashrc'

# alias vmd='open /Applications/VMD\ 1.9.2.app'
alias vmd='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86'
alias vmdt='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86 -dispdev text -eofexit'
# alias vmdt='vmd -dispdev text -eofexit'

VMDFILECHOOSER=FLTK
export VMDFILECHOOSER

################################################################################

# PATH

export PATH="$PATH:/Applications/NAMD_2.11_MacOSX-x86_64-multicore"

################################################################################

# CLUSTER

alias pascal='ssh zss2002@pascal.med.cornell.edu'
alias pasc='ssh zss2002@pascal.med.cornell.edu'
alias descartes='ssh zss2002@descartes.med.cornell.edu'
alias scumaestro='ssh -X zss2002@scu-maestro.med.cornell.edu'



#

export SCHRODINGER='/opt/schrodinger/suites2016-2'
alias maestro='$SCHRODINGER/maestro'
alias glide='$SCHRODINGER/glide'
alias ifd='$SCHRODINGER/ifd'
alias ligprep='$SCHRODINGER/ligprep'
alias glide='$SCHRODINGER/glide'


alias cgmpost='/Users/zss2002/Documents/charmmGUI/cg_memb_160829/cgm_post.sh'

################################################################################

cp ~/.bashrc ~/Dropbox/zbash/cube/bashrc
# cp ~/Documents/zbash_profile.sh ~/Dropbox/zbash/cube/zbash_profile.sh
# cp ~/Documents/cluster_sync/.zbash ~/Dropbox/zbash/cluster/zbash
cp ~/Documents/cluster_sync/.zbash/temps/zbash_temp_cluster.sh ~/Dropbox/zbash/temps/zbash_temp_cluster.sh

alias snamd='cd /Users/zss2002/Documents/namd/sert_5ht_ifd'




