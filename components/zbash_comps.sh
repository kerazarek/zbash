#!/bin/bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

case $(uname -n) in
	zmunn)
		COMP=zmunn
		;;
	leo)
		COMP=leo
		;;
	mac178101.med.cornell.edu)
		COMP=cube
		temp=/Users/zss2002/Dropbox/zbash/temps/zbash_temp_cube.sh
		source $temp
		;;
	*)
		COMP=unknown
		echo "!!! unknown COMP \`\`$(uname -n)''"
		;;
esac

export COMP OS
