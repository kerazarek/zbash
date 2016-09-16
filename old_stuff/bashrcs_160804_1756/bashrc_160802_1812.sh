#!/bin/bash

export SCHRODINGER='/opt/schrodinger/suites2014-4/'

source /Users/zss2002/Documents/zbash_profile.sh

##########################################################################################

# PROMPT

# export PS1='$ zss2002|\A \w >>> '
# export PS1='👍 ︎ zss2002⎡\A⎤ \w ▷▷▷ '


##########################################################################################

# BASICS

alias edp='nano /Users/zss2002/.bashrc'
alias scp='source /Users/zss2002/.bashrc'
alias b='cd -'
alias ..='cd ..'
alias u='cd ..'
alias uu='cd ../..'

alias mv='mv -i'

alias ls='ls -Gh'
alias l='ls -1'
alias l1='ls -1'
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -t'

alias rm='rm -i'

alias du='du -h'

alias h='history | less +G'

function zync() {
	src=$1
	dest=$2
	timestamp=`date +%y%m%d_%H%M`
	logfile=/Users/zss2002/logs/rsync_$timestamp.log
# 	logformat='%a %b %B %c %f %G %h %i %l %L %m %M %n %o %p %P %t %u %U'
# 	logformat='%i %n%L'
	rsync \
		-avzhP \
		--stats \
		-e ssh \
		--exclude=*.git* \
		--log-file=$logfile \
		--log-file-format='%i (%o) | mod: %M | perms: %B | transd: %b B		| %L%n' \
		$src $dest \
		| tee -a $logfile
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
              
# alias zync='timestamp=(date +%y%m%d_%H%M); logfile=/Users/zss2002/logs/rsync_$timestamp.log; rsync -avzhP --stats -e ssh --exclude=*.git* --log-file=$logfile'

alias c='clear'

export docs='/Users/zss2002/Documents'
export de='/Users/zss2002/Desktop'

##########################################################################################

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad # default
# export LSCOLORS=GxFxCxDxBxegedabagaced

# Below from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
	# a black
	# b red
	# c green
	# d brown
	# e blue
	# f magenta
	# g cyan
	# h light grey
	# A bold black, usually shows up as dark grey
	# B bold red
	# C bold green
	# D bold brown, usually shows up as yellow
	# E bold blue
	# F bold magenta
	# G bold cyan
	# H bold light grey; looks like bright white
	# x default foreground or background

	# 1. directory
	# 2. symbolic link
	# 3. socket
	# 4. pipe
	# 5. executable
	# 6. block special
	# 7. character special
	# 8. executable with setuid bit set
	# 9. executable with setgid bit set
	# 10. directory writable to others, with sticky bit
	# 11. directory writable to others, without sticky bit

##########################################################################################

# macOS COMMANDS

alias o='open'
# alias bb='open -a /Applications/BBEdit.app'
alias bb='bbedit'
alias bedp='bb /Users/zss2002/.bashrc'

# alias vmd='open /Applications/VMD\ 1.9.2.app'
alias vmd='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86'
alias vmdt='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86 -dispdev text -e'

VMDFILECHOOSER=FLTK 
export VMDFILECHOOSER

##########################################################################################

# PATH

export PATH="$PATH:/Applications/NAMD_2.11_MacOSX-x86_64-multicore"
export PATH="$PATH:/Applications/solvate_1.0"

##########################################################################################

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











