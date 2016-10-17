#!/bin/bash

 #################################
### Zarek's Custom Bash Profile ###
###################################
  ####  ~/.zbash_profile.sh  ####
    ###########################



### Basic Commands ###

# Filesystem
alias ls='ls -Gh'
alias l='ls -G'
alias lr='ls -Gur'
alias ll='ls -Gla'
alias lt='ls -Gt'
alias la='ls -a'
alias cf='ls | wc -l'
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias back='cd -'
alias bk='cd -'
alias rm='rm -i'
alias me='chmod 755'
alias pdw='pwd'
alias pwd_list='pwd_list=$( for file in ./*; do echo \"$file\"; done )'
#export LSLIST="$( cat $ligs/$LIGSET/$LIGSET.txt )"
# Other basics
alias c='clear'
alias h='history'
alias df='df -h'
alias du='du -h'
alias mon='tail -f -n15'
alias hi='echo hi'
alias hello='echo "Hello world"'
# Editing Profile
alias edprof='nano /Users/zarek/.zbash_profile.sh'
alias edp='edprof'
alias scprof='source /Users/zarek/.bash_profile'
alias scp='scprof'
alias bbedp='bbedit ~/.zbash_profile.sh'
alias bedp='bbedit ~/.zbash_profile.sh'


### Global Variables ###
# export ME='zmunn'

# Command prompt
# export PS1="[z\$]\A| \w >>> "
#export PS1="[z\$] \A|\! \w---> "
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

	# REGULAR COLOR     |  # BOLD COLOR
	#----------------------------------------
	# Black       0;30  |  Dark Gray     1;30
	# Blue        0;34  |  Light Blue    1;34
	# Green       0;32  |  Light Green   1;32
	# Cyan        0;36  |  Light Cyan    1;36
	# Red         0;31  |  Light Red     1;31
	# Purple      0;35  |  Light Purple  1;35
	# Brown       0;33  |  Yellow        1;33
	# Light Gray  0;37  |  White         1;37

	# COLORED TEXT:
	#	'\[\033[#;##m\] text'
	#		e.g. '\[\033[0;36m\] cyan colored text'

	# BACKGROUNDS:
	#	'\[\033[##m\] text'
	#		e.g. '\[\033[37m\] white backgrounded text'

	# Combos: e.g. '\[\033[31;1;32m\] green text on red background'

	# e.g. export PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "

# tester:
# \[\033[0m\]regular text
# \[\033[0;30m\]Black - 0;30
# \[\033[1;30m\]Dark Gray - 1;30
# \[\033[0;34m\]Blue - 0;34
# \[\033[1;34m\]Light Blue - 1;34
# \[\033[0;32m\]Green - 0;32
# \[\033[1;32m\]Light Green - 1;32
# \[\033[0;36m\]Cyan - 0;36
# \[\033[1;36m\]Light Cyan - 1;36
# \[\033[0;31m\]Red - 0;31
# \[\033[1;31m\]Light Red - 1;31
# \[\033[0;35m\]Purple - 0;35
# \[\033[1;35m\]Light Purple - 1;35
# \[\033[0;33m\]Brown - 0;33
# \[\033[1;33m\]Yellow - 1;33
# \[\033[0;37m\]Light Gray - 0;37
# \[\033[1;37m\]White - 1;37
#
# \[\033[30m\]Black - 30
# \[\033[30m\]Dark Gray - 30
# \[\033[34m\]Blue - 34
# \[\033[34m\]Light Blue - 34
# \[\033[44m\]\[\033[0;30m\]Green - 32
# \[\033[32m\]Light Green - 32
# \[\033[36m\]Cyan - 36
# \[\033[36m\]Light Cyan - 36
# \[\033[31m\]Red - 31
# \[\033[31m\]Light Red - 31
# \[\033[35m\]Purple - 35
# \[\033[35m\]Light Purple - 35
# \[\033[33m\]Brown - 33
# \[\033[33m\]Yellow - 33
# \[\033[37m\]Light Gray - 37
# \[\033[37m\]White - 37

# also tput: http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/

# 	Regular:
# 		\[$(tput setaf 0)\]0: Black
# 		\[$(tput setaf 1)\]1: Red
# 		\[$(tput setaf 2)\]2: Green
# 		\[$(tput setaf 3)\]3: Yellow
# 		\[$(tput setaf 4)\]4: Blue
# 		\[$(tput setaf 5)\]5: Magenta
# 		\[$(tput setaf 6)\]6: Cyan
# 		\[$(tput setaf 7)\]7: White\[$(tput sgr0)\]
# 	Bold:\[$(tput bold)\]
# 		\[$(tput setaf 0)\]0: Black
# 		\[$(tput setaf 1)\]1: Red
# 		\[$(tput setaf 2)\]2: Green
# 		\[$(tput setaf 3)\]3: Yellow
# 		\[$(tput setaf 4)\]4: Blue
# 		\[$(tput setaf 5)\]5: Magenta
# 		\[$(tput setaf 6)\]6: Cyan
# 		\[$(tput setaf 7)\]7: White\[$(tput sgr0)\]
# 	Background Colors:
# 		\[$(tput setab 0)\]0: Black\[$(tput sgr0)\]
# 		\[$(tput setab 1)\]1: Red\[$(tput sgr0)\]
# 		\[$(tput setab 2)\]2: Green\[$(tput sgr0)\]
# 		\[$(tput setab 3)\]3: Yellow\[$(tput sgr0)\]
# 		\[$(tput setab 4)\]4: Blue\[$(tput sgr0)\]
# 		\[$(tput setab 5)\]5: Magenta\[$(tput sgr0)\]
# 		\[$(tput setab 6)\]6: Cyan\[$(tput sgr0)\]
# 		\[$(tput setab 7)\]7: White\[$(tput sgr0)\]

# export PS1="\[$(tput sgr0)\]\
# \[$(tput setab 5)\]\
# \[$(tput setaf 1)\]\
# «𝕫»\
# \[$(tput sgr0)\]\
#  \
# \[$(tput bold)\]\
# \[$(tput setaf 3)\]\
# $(date '+%y%m%d_%H%M')\
# \[$(tput sgr0)\]\
#  \
# \[$(tput setaf 3)\]\
# \w\
# \[$(tput sgr0)\]\
#  \
# \[$(tput bold)\]\
# \[$(tput setaf 2)\]\
# ▷▷▷\
# \[$(tput sgr0)\]\[$(tput setaf 6)\] "
# # \[$(tput sgr0)\] "

export PS1="\[$(tput sgr0)\]\
\[$(tput setab 5)\]\
\[$(tput setaf 1)\]\
{\h}\
\[$(tput sgr0)\]\
 \
\[$(tput bold)\]\
\[$(tput setaf 3)\]\
$(date '+%y%m%d_%H%M')\
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
\[$(tput sgr0)\]\[$(tput setaf 6)\] "

# export PS1="\[\033[1;31m\][z\$]\A| \[\033[1;35m\]\w >>> \[\033[0m\]"

# LS

# LSCOLORS        The value of this variable describes what color to use for which
# 			 attribute when colors are enabled with CLICOLOR.  This string is a
# 			 concatenation of pairs of the format fb, where f is the foreground
# 			 color and b is the background color.
#
# 			 The color designators are as follows:
#
# 				   a     black
# 				   b     red
# 				   c     green
# 				   d     brown
# 				   e     blue
# 				   f     magenta
# 				   g     cyan
# 				   h     light grey
# 				   A     bold black, usually shows up as dark grey
# 				   B     bold red
# 				   C     bold green
# 				   D     bold brown, usually shows up as yellow
# 				   E     bold blue
# 				   F     bold magenta
# 				   G     bold cyan
# 				   H     bold light grey; looks like bright white
# 				   x     default foreground or background
#
# 			 Note that the above are standard ANSI colors.  The actual display may
# 			 differ depending on the color capabilities of the terminal in use.
#
# 			 The order of the attributes are as follows:
#
# 				   1.   directory
# 				   2.   symbolic link
# 				   3.   socket
# 				   4.   pipe
# 				   5.   executable
# 				   6.   block special
# 				   7.   character special
# 				   8.   executable with setuid bit set
# 				   9.   executable with setgid bit set
# 				   10.  directory writable to others, with sticky bit
# 				   11.  directory writable to others, without sticky bit
#
# 			 The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and
# 			 default background for regular directories, black foreground and red
# 			 background for setuid executables, etc.

LSCOLORS="\
Ex\
fx\
cx\
dx\
bx\
eg\
ed\
ab\
ag\
ac\
ad\
"
export LSCOLORS

# 
# # History Options
# export HISTSIZE=10000
# export HISTFILESIZE=1000000
# export HISTTIMEFORMAT='%b %d %I:%M %p '
# export HISTCONTROL=ignoreboth
# export HISTIGNORE="history:pwd:exit:df:du:ll:ls"
# # Grep Options
# export GREP_OPTIONS="--color=auto"
# # Personal Directories
# export apps='/Applications'
# export lib='/Library'
# export de='/Users/zarek/Desktop'
# export dl='/Users/zarek/Downloads'
# export docs='/Users/zarek/Documents'
# export pics='/Users/zarek/Pictures'
# export trash='/Users/zarek/.Trash'
# export codez='/Users/zarek/codez'
# export _in='/Users/zarek/_IN_'
# export werk='/Users/zarek/Documents/Wesleyan/spring2016'
# export oned='/Users/zarek/OneDrive'
# export zgithub='/Users/zarek/GitHub'
# export zqs='/Users/zarek/GitHub/zQS'
# export lastfm='/Users/zarek/GitHub/lastfm'
# # Lab Directories
# export lab='/Users/zarek/lab'
# export lab_in='/Users/zarek/lab/labIN'
# export scriptz='/Users/zarek/lab/scriptz'
# export pytsop='/Users/zarek/lab/scriptz/pytsop'
# export dck='/Users/zarek/lab/Docking'
# export p300='/Users/zarek/lab/Docking/p300'
# export hepi='/Users/zarek/lab/Docking/hepi'
# export grids='/Users/zarek/AaTaylorLab/Docking/gridboxes'
# export ligs='/Users/zarek/AaTaylorLab/Docking/ligsets'
# export thesis='/Users/zarek/lab/THESIS'
# export thesistex='/Users/zarek/lab/THESIS/THESIS.tex'
# export thesisbibs='/Users/zarek/lab/THESIS/thesis_refs.bib'
# export gtl='/Users/zarek/GitHub/TaylorLab'
# export zvi='/Users/zarek/lab/zvina'
# export scs='$zvi/scripts'
# export cluster='/Users/zarek/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/cluster\ \(greentail\)'
# # AutoDockTools
# export U24='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24'
# export pl4='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py'
# export pr4='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py'
# export q2b='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/pdbqt_to_pdb.py'
# export pvr='/Library/MGLTools/latest/MGLToolsPckgs/AutoDockTools/Utilities24/process_VinaResult.py -p'
# 
# 
# ### Command Line Programs and Utilities ###
# 
# # Opening Files and Apps
# alias o='open'
# alias bb='open -a /Applications/BBEdit.app'
# alias te='open -a /Applications/TextEdit.app'
# alias fd='open -R'
# alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
# alias pymol='/Applications/MacPyMOL.app/Contents/MacOS/MacPyMOL'
# # Interpreters
# alias py='/anaconda/pkgs/python-2.7.10-0/bin/python2.7'
# alias py34='/anaconda/pkgs/python-3.4.3-0/bin/python3.4'
# export py34='//anaconda/envs/python34/bin/python'
# export py27='//anaconda/envs/python27/bin/python'
# # Compilers
# alias pdl='pdflatex'
# # alias mkthesis='cd ~/lab/THESIS/main; pdflatex THESIS; bibtex THESIS; makeglossaries THESIS; pdflatex THESIS; pdflatex THESIS; open THESIS.pdf; rm -f THESIS.log THESIS.bbl THESIS.blg THESIS.glg THESIS.gls THESIS.aux THESIS.glo THESIS.glsdefs THESIS.lof THESIS.lot THESIS.out THESIS.tdo THESIS.toc THESIS.ist'
# alias mkthesis='/Users/zarek/lab/THESIS/main/make_thesis_pdf.sh'
# alias cvin='/Users/zarek/lab/VinaTutorial/VinaTutorial_compile.sh'
# 
# ### CD shortcuts ###
# 
# # Personal shortcuts
# alias apps='cd /Applications'
# alias lib='cd /Library'
# alias de='cd /Users/zarek/Desktop'
# alias dl='cd /Users/zarek/Downloads'
# alias docs='cd /Users/zarek/Documents'
# alias pics='cd /Users/zarek/Pictures'
# alias trash='cd /Users/zarek/.Trash'
# alias codez='cd /Users/zarek/codez'
# alias _in='cd /Users/zarek/_IN_'
# alias werk='cd /Users/zarek/Documents/Wesleyan/spring2016'
# alias zqs='cd $zqs'
# # Lab Shortcuts
# alias lab='cd /Users/zarek/lab'
# alias lab_in='cd /Users/zarek/lab/labIN'
# alias scriptz='cd /Users/zarek/lab/scriptz'
# alias pytsop='cd /Users/zarek/lab/scriptz/pytsop'
# alias dck='cd /Users/zarek/lab/Docking'
# alias p300='cd /Users/zarek/lab/Docking/p300'
# alias hepi='cd /Users/zarek/lab/Docking/hepi'
# alias grids='cd /Users/zarek/AaTaylorLab/Docking/gridboxes'
# alias ligs='cd /Users/zarek/AaTaylorLab/Docking/ligsets'
# alias thesis='cd /Users/zarek/lab/THESIS'
# alias gtl='cd /Users/zarek/GitHub/TaylorLab'
# alias zvi='cd /Users/zarek/lab/zvina'
# alias scs='cd $zvi/scripts/'
# 
# # Taylor Lab Programs
# alias at='/Library/MGLTools/latest/bin/pythonsh'
# alias b='/usr/local/bin/babel'
# alias hbp='/Applications/LigPlus/lib/exe_mac/hbplus'
# # AutoDockTools
# alias pl4='at $pl4'
# alias pr4='at $pr4'
# alias q2b='at $q2b'
# alias pvr='at $pvr'
# # Script aliases
# alias zvina='$zvi/scripts/main.py'
# alias zv='$zvi/scripts/main.py'
# # Old script aliases
# alias tsop='$scriptz/pytsop/ex.sh'
# # alias pdb_cleanup='/Users/zarek/codez/pdb_cleanup.sh'
# # alias csvify='/Users/zarek/codez/pdb_to_csv.sh'
# # alias pv='/Users/zarek/GitHub/TaylorLab/post_vina.py'
# # source /Users/zarek/lab/scriptz/pytsop/basic_funcs.sh
# # Logging on to the cluster
# alias cl='ssh zsiegel@cottontail.wesleyan.edu'
# export cl='sftp://zsiegel@cottontail.wesleyan.edu/home/zsiegel'
# # alias cl='ssh zsiegel@greentail.wesleyan.edu'
# # export cl='sftp://zsiegel@greentail.wesleyan.edu/home/zsiegel'
# 
# 
# 
# 



















