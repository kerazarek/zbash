#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

alias srcp='source ~/.bashrc'

function cornell_cluster_temp() {
	ZBASH_DIR=/home/zss2002/.zbash
	ZBASH_TEMP=$ZBASH_DIR/temps/zbash-temp-cluster.sh
	source $ZBASH_TEMP
	alias edp='nano $ZBASH_TEMP'
}

case $(uname -n) in
	zmunn.local)
		COMP=zmunn
		IS_CLUSTER=0
		ZBASH_DIR=/Users/zarek/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash-temp-zmunn.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		alias srcp='source ~/.bash_profile'
		;;
	leo)
		COMP=leo
		IS_CLUSTER=0
		ZBASH_DIR=/home/zarek/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash-temp-zmunn.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		;;
	mac178101.med.cornell.edu)
		COMP=cube
		IS_CLUSTER=0
		ZBASH_DIR=/Users/zss2002/.zbash
		ZBASH_TEMP=$ZBASH_DIR/temps/zbash-temp-cube.sh
		source $ZBASH_TEMP
		alias edp='nano $ZBASH_TEMP'
		;;
	pascal.med.cornell.edu)
		COMP=pascal
		IS_CLUSTER=1
		cornell_cluster_temp
		;;
	fido.pug.pbtech)
		COMP=fido
		IS_CLUSTER=1
		cornell_cluster_temp
		;;
	panda2.pbtech)
		COMP=panda
		IS_CLUSTER=1
		cornell_cluster_temp
		;;
	scu-maestro.med.cornell.edu)
		COMP=scumaestro
		IS_CLUSTER=1
		cornell_cluster_temp
		;;
	node[0-9][0-9][0-9].pug.pbtech)
		COMP=$(uname -n | perl -pe 's/(\w+)\.pug.pbtech/fido_\1/;')
		IS_CLUSTER=1
		# cornell_cluster_temp
		;;
	node[0-9][0-9][0-9].panda)
		COMP=$(uname -n | perl -pe 's/(\w+)\.panda/panda_\1/;')
		IS_CLUSTER=1
		# cornell_cluster_temp
		;;
	*)
		COMP=unknown
		IS_CLUSTER=0
		echo "!!! unknown COMP \`\`$(uname -n)''"
		;;
esac

alias srczb='source $ZBASH_DIR/zbash-master.sh'

export OS COMP ZBASH_DIR ZBASH_TEMP IS_CLUSTER
