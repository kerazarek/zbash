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
		;;



esac

export COMP OS
