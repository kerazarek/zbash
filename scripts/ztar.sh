#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 10/15/16 12:28
  #

# cd /Users/zarek/lab/zvina/hepi/

function ztar {
	# exit if no argument
	if test ! $1; then
		echo "!!! no argument given"
		exit 1
	fi
	# current directory, do return to later
	starting_pwd=$(pwd)
	# argument is dir to archive
	dir_in=$1
	# make sure the dir exists
	if test ! -d $dir_in; then
		echo "!!! input dir \`\`$dir_in'' does not exist"
		return 1
	else
		echo
		echo ">>> compressing directory \`\`$dir_in''..."
	fi
	# remove trailing slash if there is one
	dir_in=$(echo $dir_in | perl -pe 's/\/$//;')
	# if dir is a path (has slashes in it), go into parent dir
	if echo $dir_in | grep -q '/'; then
		parent_dir=$(echo $dir_in | perl -pe 's/(.+)\/([^\/]+)$/\1/;')
		dir=$(echo $dir_in | perl -pe 's/(.+)\/([^\/]+)$/\2/;')
		cd $parent_dir
	else
		dir=$dir_in
	fi
	echo pwd: `pwd`
	echo dir: $dir
	# get size of dir for pv
	dir_size=$(du -sk $dir | awk '{print $1}' | xargs -I {} echo "{} * 1024" | bc)
	echo dir_size: $dir_size
	# begin the tar
	echo tar $dir -> $dir.tar.gz
	tar -cf - $dir \
		| pv \
			-s $dir_size \
			-N tar \
		| gzip \
		> $dir.tar.gz
	# rename orig
	mv -v $dir $dir.orig
	# uncompress to check
	echo untar $dir.tar.gz
	pv $dir.tar.gz | tar -zxf -
	mv -v $dir $dir.untar
	# size em up
	untar_dir_size=$(du -sk $dir.untar | awk '{print $1}')
	orig_dir_size=$(du -sk $dir.orig | awk '{print $1}')
	tar_dir_size=$(du -sk $dir.tar.gz |  awk '{print $1}')
	echo untar_dir_size: $untar_dir_size
	echo orig_dir_size: $orig_dir_size
	echo tar_dir_size: $tar_dir_size
	# are two dirs the same?
	if test $untar_dir_size -ne $orig_dir_size; then
		echo "!!! orig and untar are not the same size"
		exit 1
	fi
	# create checksums
	echo creating checksums
	find $dir.orig -type f \
		| xargs -I {} md5 "{}" \
		| perl -pe 's/^.+ = (.+)$/\1/;' \
		>> $dir.orig.md5sum
	find $dir.untar -type f \
		| xargs -I {} md5 "{}" \
		| perl -pe 's/^.+ = (.+)$/\1/;' \
		>> $dir.untar.md5sum
	# compare checksums
	sum_diff=$(diff $dir.orig.md5sum $dir.untar.md5sum)
	if test "$sum_diff"; then
		echo "!!! checksum diff indicates $dir.untar and $dir.orig are not the same"
		diff -r $dir.orig $dir.untar
		exit 1
	else
		echo "cheksum diff indicates $dir.untar and $dir.orig are identical, deleting both"
		rm -rf $dir.orig $dir.untar $dir.orig.md5sum $dir.untar.md5sum
	fi
	# back to original dir
	cd $starting_pwd
}

echo "~ ztar.sh ~"
for dir in $@; do
	ztar $dir
done

# dir_list=$(find . -type d -depth 1)
#
# for d in $dir_list; do
# 	if test ! -f $.tar.gz; then
# 		cd $d
# 		pwd
# 		subdirs=$(find . -type d -depth 1)
# 		for sd in $subdirs; do
# 			echo tar -zcvf $sd.tar.gz $sd
# 			du -sh $sd
# 			tar -zcvf $sd.tar.gz $sd
# 			tar -cf - $d | pv -s $(du -sk $d | awk '{print $1}' | xargs -I {} echo "{} * 1024" | bc) -N tar | gzip > p6.pv.tar.gz
# 			mv -v $sd $sd.ORIG
# 			tar -zxvf $sd.tar.gz
# 			diff $sd $sd.ORIG
# 		done
# 		echo
# 		cd ..
# 	fi
# done
#
# for d in dir_list; do
# 	ls $d
# 	echo tar -zcvf $d.tar.gz $d
# done