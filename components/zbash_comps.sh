#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

function cornell_cluster_temp() {
	ZBASH_DIR=/home/zss2002/.zbash
	ZBASH_TEMP=$ZBASH_DIR/temps/zbash_temp_cluster.sh
	source $ZBASH_TEMP
	alias edp='nano $ZBASH_TEMP'
	alias srcp='source ~/.bashrc'
}

case $(uname -n) in
	zmunn.local)
		COMP=zmunn
		ZBASH_DIR=/Users/zarek/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash_temp_zmunn.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		alias srcp='source ~/.bash_profile'
		;;
	leo)
		COMP=leo
		ZBASH_DIR=/home/zarek/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash_temp_zmunn.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		alias srcp='source ~/.bashrc'
		;;
	mac178101.med.cornell.edu)
		COMP=cube
		ZBASH_DIR=/Users/zss2002/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash_temp_cube.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		alias srcp='source ~/.bashrc'
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

export OS COMP ZBASH_DIR ZBASH_TEMP
