#!/usr/bin/env bash

###
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

# if test -t 0; then
# 	export PS1="\
# $(form -c -p -USc -b -g201 -o88 -t {$COMP} -c) \
# $(form -p -o208 -t \\D{%y%m%d_%H%M%S} -c) \
# $(form -p -o226 -t \\w -c) \
# $(form -p -o2 -t \[\\\!\] -c)\
# $(form -p -b -o46)\
# >\
# $(form -p -c) \
# $(form -p -o51)\
# "
# fi
#
# echo $PS1
#
#

PS1=\
"\[{compfmt}\]{$COMP}\[{clearfmt}\] \
\[{datefmt}\]\\D{%y%m%d_%H%M%S}\[{clearfmt}\] \
\[{cwdfmt}\]\\w\[{clearfmt}\] \
\[{histfmt}\][\!]\[{clearfmt}\]\
\[{arrowfmt}\]>\[{clearfmt}\] \
\[{promptfmt}\]"

# compfmt=$(pyform -c 0 -o -f 88 -b 201 -n -t )
# [[ $COMP == 'fido' ]] && compfmt=$(pyform -c 0 -o -f 88 -b 201 -n -t )

compfmt=$(pyform -c 0 -o -f 88 -b 201 -n -t )
datefmt=$(pyform -c 0 -f 208 -b def -n -t )
cwdfmt=$(pyform -c 0 -f 226 -b def -n -t )
histfmt=$(pyform -c 0 -f 2 -b def -n -t )
arrowfmt=$(pyform -c 0 -o -f 46 -b def -n -t )
promptfmt=$(pyform -c 0 -f 51 -b def -n -t )
clearfmt=$(pyform -c 2 -n -t)


if [[ $COMP =~ ^fido.* ]]; then
	compfmt=$(pyform -c 0 -o -f 18 -b 33 -n -t )
	datefmt=$(pyform -c 0 -f 129 -b def -n -t )
	cwdfmt=$(pyform -c 0 -f 124 -b def -n -t )
	histfmt=$(pyform -c 0 -f 11 -b def -n -t )
	arrowfmt=$(pyform -c 0 -o -f 226 -b def -n -t )
	# promptfmt=$(pyform -c 0 -f 46 -b def -n -t )
elif [[ $COMP == 'pascal' ]]; then
	compfmt=$(pyform -c 0 -o -f 22 -b 48 -n -t )
	datefmt=$(pyform -c 0 -f 51 -b def -n -t )
	cwdfmt=$(pyform -c 0 -f 129 -b def -n -t )
	histfmt=$(pyform -c 0 -f 124 -b def -n -t )
	arrowfmt=$(pyform -c 0 -o -f 11 -b def -n -t )
	# promptfmt=$(pyform -c 0 -f 226 -b def -n -t )
elif [[ $COMP =~ ^panda.* ]]; then
	compfmt=$(pyform -c 0 -o -f 52 -b 9 -n -t )
	datefmt=$(pyform -c 0 -f 129 -b def -n -t )
	cwdfmt=$(pyform -c 0 -f 51 -b def -n -t )
	histfmt=$(pyform -c 0 -f 46 -b def -n -t )
	arrowfmt=$(pyform -c 0 -o -f 226 -b def -n -t )
	# promptfmt=$(pyform -c 0 -f 208 -b def -n -t )
fi

if [[ $COMP =~ fido_node.+ ]]; then
	compfmt=$(pyform -c 0 -o -f 18 -b 33 -v -n -t )
elif [[ $COMP =~ panda_node.+ ]]; then
	compfmt=$(pyform -c 0 -o -f 52 -b 9 -v -n -t )
fi


PS1=${PS1/\{compfmt\}/$compfmt}
PS1=${PS1/\{datefmt\}/$datefmt}
PS1=${PS1/\{cwdfmt\}/$cwdfmt}
PS1=${PS1/\{histfmt\}/$histfmt}
PS1=${PS1/\{arrowfmt\}/$arrowfmt}
PS1=${PS1/\{promptfmt\}/$promptfmt}
PS1=${PS1//\{clearfmt\}/$clearfmt}

[[ -t 0 ]] && export PS1

