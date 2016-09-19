#!/bin/bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

case $(uname -n) in
	zmunn.local)
		COMP=zmunn
		temp=/Users/zarek/Dropbox/zbash/temps/zbash_temp_zmunn.sh
		source $temp
		alias edp="nano $temp"
		alias scp="source ~/.bash_profile"
		;;
	leo)
		COMP=leo
		temp=/home/zarek/Dropbox/zbash/temps/zbash_temp_zmunn.sh
		source $temp
		alias edp="nano $temp"
		alias scp="source ~/.bashrc"
		;;
	mac178101.med.cornell.edu)
		COMP=cube
		temp=/Users/zss2002/Dropbox/zbash/temps/zbash_temp_cube.sh
		source $temp
		alias edp="nano $temp"
		alias scp="source ~/.bashrc"
		;;
	*)
		COMP=unknown
		echo "!!! unknown COMP \`\`$(uname -n)''"
		;;
esac

export COMP OS
