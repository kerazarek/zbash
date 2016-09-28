#!/bin/bash

 #################################
### Zarek's Custom Bash Profile ###
###################################
  ####  ~/.zbash_profile.sh  ####
    ###########################


### Which computer?

export OS=`uname -s`
export OS_RELEASE=`uname -r`
export OS_VERSION=`uname -v`
export NODE=`uname -n`

case $HOSTNAME in
	"zmunn.local")
		COMP="zmunn"
		ZHOME="/Users/zarek"
		ZBASH_DIR="/Users/zarek/Dropbox/zbash"
		;;
	"zarek-Parallels-Virtual-Platform")
		COMP="parallels"
		ZHOME="/media/psf/Home"
		ZBASH_DIR="$ZHOME/Dropbox/zbash"
		;;
	"pascal.med.cornell.edu")
		COMP="cornell-pascal"
		;;
	"leo")
		COMP="leo"
		ZBASH_DIR="$HOME/Dropbox/zbash"
		;;
	*)
		COMP="unknown"
		echo "!!! Couldn't figure out what computer this is"
		;;
esac

export COMP ZHOME ZBASH_DIR

case $OS in
	"Linux")
		alias open='nautilus'
		;;
	"Darwin")
		;;
esac

### Formatting
TERM=xterm-256color
function form() {
	# zbash_formatting="$ZHOME/.zbash_formatting.sh"
	zbash_formatting="$ZBASH_DIR/components/zbash_formatting.sh"
	echo -en $($zbash_formatting $@);
}

### PROMPT

# export PS1="\
# $(form -c -p -USc -b -g201 -o88 -t {$COMP} -c) \
# $(form -p -o208 -t \\D{%y%m%d_%H%M%S} -c) \
# $(form -p -o226 -t \\w -c) \
# $(form -p -b -o46)\
# ▷▷▷\
# $(form -p -c) \
# $(form -p -o51)\
# "


### Basic Commands ###

# Filesystem
# alias mv='mv -i'
alias ls='ls -Gh'
alias l='ls -G'
alias lr='ls -Gur'
alias ll='ls -Gla'
alias lt='ls -Gt'
alias la='ls -a'

function cf() {
	dir=$1
	if ! test $dir; then dir=$PWD; fi
	ls $dir | wc -l
}

# Other basics
alias c='clear'
alias h='history'
alias df='df -h'
alias du='du -h'
alias mon='tail -f -n15'
alias hi='echo hi'
alias hello='echo "Hello world"'
# Editing Profile
# alias edprof='nano $ZHOME/.zbash_profile.sh'
alias edprof='nano /Users/zarek/Dropbox/zbash/temps/zbash_temp_zmunn.sh'
alias edp='edprof'
alias scprof='source ~/.bash_profile'
alias scp='scprof'
alias bedp='bbedit /Users/zarek/Dropbox/zbash/temps/zbash_temp_zmunn.sh'


# Grep Options
# export GREP_OPTIONS="--color=auto"
# Personal Directories
export apps='/Applications'
export lib='/Library'
export de='/Users/zarek/Desktop'
export dl='/Users/zarek/Downloads'
export docs='/Users/zarek/Documents'
export pics='/Users/zarek/Pictures'
export trash='/Users/zarek/.Trash'
export codez='/Users/zarek/codez'
export _in='/Users/zarek/_IN_'
export werk='/Users/zarek/Documents/Wesleyan/spring2016'
export oned='/Users/zarek/OneDrive'
export zgithub='/Users/zarek/GitHub'
export zqs='/Users/zarek/GitHub/zQS'
export lastfm='/Users/zarek/GitHub/lastfm'
# Lab Directories
export lab='/Users/zarek/lab'
export lab_in='/Users/zarek/lab/labIN'
export scriptz='/Users/zarek/lab/scriptz'
export pytsop='/Users/zarek/lab/scriptz/pytsop'
export dck='/Users/zarek/lab/Docking'
export p300='/Users/zarek/lab/Docking/p300'
export hepi='/Users/zarek/lab/Docking/hepi'
export grids='/Users/zarek/AaTaylorLab/Docking/gridboxes'
export ligs='/Users/zarek/AaTaylorLab/Docking/ligsets'
export thesis='/Users/zarek/lab/THESIS'
export thesistex='/Users/zarek/lab/THESIS/THESIS.tex'
export thesisbibs='/Users/zarek/lab/THESIS/thesis_refs.bib'
export gtl='/Users/zarek/GitHub/TaylorLab'
export zvi='/Users/zarek/lab/zvina'
export scs='$zvi/scripts'
export cluster='/Users/zarek/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/cluster\ \(greentail\)'
# AutoDockTools
export U24='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24'
export pl4='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py'
export pr4='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py'
export q2b='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/pdbqt_to_pdb.py'
export pvr='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/process_VinaResult.py -p'


### Command Line Programs and Utilities ###

# Opening Files and Apps
alias o='open'
alias bb='open -a /Applications/BBEdit.app'
alias te='open -a /Applications/TextEdit.app'
alias fd='open -R'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias pymol='/Applications/MacPyMOL.app/Contents/MacOS/MacPyMOL'
# Interpreters
alias py='/anaconda/pkgs/python-2.7.10-0/bin/python2.7'
alias py34='/anaconda/pkgs/python-3.4.3-0/bin/python3.4'
export py34='//anaconda/envs/python34/bin/python'
export py27='//anaconda/envs/python27/bin/python'
# Compilers
alias pdl='pdflatex'
# alias mkthesis='cd ~/lab/THESIS/main; pdflatex THESIS; bibtex THESIS; makeglossaries THESIS; pdflatex THESIS; pdflatex THESIS; open THESIS.pdf; rm -f THESIS.log THESIS.bbl THESIS.blg THESIS.glg THESIS.gls THESIS.aux THESIS.glo THESIS.glsdefs THESIS.lof THESIS.lot THESIS.out THESIS.tdo THESIS.toc THESIS.ist'
alias mkthesis='/Users/zarek/lab/THESIS/main/make_thesis_pdf.sh'
alias cvin='/Users/zarek/lab/VinaTutorial/VinaTutorial_compile.sh'

### CD shortcuts ###

# Personal shortcuts
alias apps='cd /Applications'
alias lib='cd /Library'
alias de='cd /Users/zarek/Desktop'
alias dl='cd /Users/zarek/Downloads'
alias docs='cd /Users/zarek/Documents'
alias pics='cd /Users/zarek/Pictures'
alias trash='cd /Users/zarek/.Trash'
alias codez='cd /Users/zarek/codez'
alias _in='cd /Users/zarek/_IN_'
alias werk='cd /Users/zarek/Documents/Wesleyan/spring2016'
alias zqs='cd $zqs'
# Lab Shortcuts
alias lab='cd /Users/zarek/lab'
alias lab_in='cd /Users/zarek/lab/labIN'
alias scriptz='cd /Users/zarek/lab/scriptz'
alias pytsop='cd /Users/zarek/lab/scriptz/pytsop'
alias dck='cd /Users/zarek/lab/Docking'
alias p300='cd /Users/zarek/lab/Docking/p300'
alias hepi='cd /Users/zarek/lab/Docking/hepi'
alias grids='cd /Users/zarek/AaTaylorLab/Docking/gridboxes'
alias ligs='cd /Users/zarek/AaTaylorLab/Docking/ligsets'
alias thesis='cd /Users/zarek/lab/THESIS'
alias gtl='cd /Users/zarek/GitHub/TaylorLab'
alias zvi='cd /Users/zarek/lab/zvina'
alias scs='cd $zvi/scripts/'

# Taylor Lab Programs
alias at='/Library/MGLTools/latest/bin/pythonsh'
alias b='/usr/local/bin/babel'
alias hbp='/Applications/LigPlus/lib/exe_mac/hbplus'
# AutoDockTools
alias pl4='at $pl4'
alias pr4='at $pr4'
alias q2b='at $q2b'
alias pvr='at $pvr'
# Script aliases
alias zvina='$zvi/scripts/main.py'
alias zv='$zvi/scripts/main.py'
# Old script aliases
alias tsop='$scriptz/pytsop/ex.sh'
# alias pdb_cleanup='/Users/zarek/codez/pdb_cleanup.sh'
# alias csvify='/Users/zarek/codez/pdb_to_csv.sh'
# alias pv='/Users/zarek/GitHub/TaylorLab/post_vina.py'
# source /Users/zarek/lab/scriptz/pytsop/basic_funcs.sh
# Logging on to the cluster
alias cl='ssh zsiegel@cottontail.wesleyan.edu'
export cl='sftp://zsiegel@cottontail.wesleyan.edu/home/zsiegel'
# alias cl='ssh zsiegel@greentail.wesleyan.edu'
# export cl='sftp://zsiegel@greentail.wesleyan.edu/home/zsiegel'



# ZYNC
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
	logfile=/Users/zarek/logs/rsync_$timestamp.log
	stdoutlog=/Users/zarek/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zync ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (rsync --avzhP --stats -e ssh --exclude=*OneDrive* --exclude*Volumes*)" | tee -a $logfile $stdoutlog
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
		--exclude=*OneDrive* --exclude=*Volumes* \
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
	logfile=/Users/zarek/logs/rsync_$timestamp.log
	stdoutlog=/Users/zarek/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zyncDEL ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (rsync --avzhP --delete --stats -e ssh --exclude=*OneDrive* --exclude*Volumes*)" | tee -a $logfile $stdoutlog
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
		--exclude=*OneDrive* \
		--exclude=*Volumes* \
		--log-file=$logfile \
		--log-file-format='%i (%o) | mod: %M | perms: %B | transd: %b B		| %L%n' \
		$src $dest \
		| tee -a $stdoutlog

	echo "" | tee -a $logfile $stdoutlog
	echo ">>> finished $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

}

function suzyncdel() {

	src=$1
	dest=$2

	timestamp=`date +%y%m%d_%H%M`
	logfile=/Users/zarek/logs/rsync_$timestamp.log
	stdoutlog=/Users/zarek/logs/rsync_stdout_$timestamp.log

	echo "" | tee $logfile $stdoutlog
	echo ">>> zyncDEL ${timestamp}" | tee -a $logfile $stdoutlog
	echo "    (sudo rsync --avzhP --delete --stats -e ssh --exclude=*OneDrive* --exclude*Volumes*)" | tee -a $logfile $stdoutlog
	echo "  > source: 	 ${src}" | tee -a $logfile $stdoutlog
	echo "  > destination: ${dest}" | tee -a $logfile $stdoutlog
	echo "  > rsync log: 	 ${logfile}" | tee -a $logfile $stdoutlog
	echo "  > stdout log:	 ${stdoutlog}" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog
	echo ">>> starting $(date '+%y%m%d_%H%M%S [%s]')" | tee -a $logfile $stdoutlog
	echo "" | tee -a $logfile $stdoutlog

	sudo rsync \
		-avzhP \
		--delete \
		--stats \
		-e ssh \
		--exclude=/Users/zarek/OneDrive* \
		--exclude=/Volumes* \
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

function vzync() {
	case $1 in
		T|Transcend)
			tobackup="/Volumes/Transcend/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/Transcend/"
			;;
		T|Transcend)
			tobackup="/Volumes/Transcend/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/Transcend/"
			;;
		D|Dropbox)
			tobackup="/Users/zarek/Dropbox/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/cutie/"
			;;
		i|iCloud)
			tobackup="/Users/zarek/Library/Mobile Documents/com~apple~CloudDocs/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/cutie/"
			;;
		z|zmunn)
			tobackup="/Users/zarek/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/cutie/"
			;;
		h|zh|zmunnhome)
			tobackup="/"
			vaultbackup="/Volumes/\[ðəvɑl̴t̚\]/drive_backups/cutie/"
			;;


	esac

	read -p "zync /Volumes/$1/ /Volumes/[ðəvɑl̴t̚]/drive_backups/$1/ ??" answer

	if test $answer = "y"; then
		zync /Volumes/$1/ /Volumes/[ðəvɑl̴t̚]/drive_backups/$1/
	else
		exit 0
	fi
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




function crun() {
	infile=$1
	outfile=${infile/.c/.o}
	clang $infile -o $outfile
	chmod +x $outfile
	./$outfile
}














kill -WINCH $$
tabs -4

