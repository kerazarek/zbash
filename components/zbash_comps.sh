#!/bin/bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

function cornell_cluster_temp() {
	temp=/home/zss2002/.zbash/temps/zbash_temp_cluster.sh
	source $temp
	alias edp="nano $temp"
	alias scp="source ~/.bashrc"
}

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
	pascal.med.cornell.edu)
		COMP=cornell_pascal
		cornell_cluster_temp
		;;
	fido.pug.pbtech)
		COMP=cornell_fido
		cornell_cluster_temp
		;;
	panda2.pbtech)
		COMP=cornell_panda
		cornell_cluster_temp
		;;
	scu-maestro.med.cornell.edu)
		COMP=cornell_scumaestro
		cornell_cluster_temp
		;;
	node[0-9][0-9][0-9].pug.pbtech)
		COMP=cornell_fido_node
		# cornell_cluster_temp
		;;
	node[0-9][0-9][0-9].panda)
		COMP=cornell_panda_node
		# cornell_cluster_temp
		;;
	*)
		COMP=unknown
		echo "!!! unknown COMP \`\`$(uname -n)''"
		;;
esac

export COMP OS
