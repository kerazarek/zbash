#!/bin/bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

if test -t 0; then
	export PS1="\
$(form -c -p -USc -b -g201 -o88 -t {$COMP} -c) \
$(form -p -o208 -t \\D{%y%m%d_%H%M%S} -c) \
$(form -p -o226 -t \\w -c) \
$(form -p -o2 -t \[\\\!\] -c)\
$(form -p -b -o46)\
>\
$(form -p -c) \
$(form -p -o51)\
"
fi
