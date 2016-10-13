#!/usr/bin/env bash

### Date and time
  #
  # (c) Zarek Siegel
  # created 2016/09/28
  #

function dt() {
	case $1 in
		""|6|d6|dt|d) dt_fmt="%y%m%d" ;;
		8|d8) dt_fmt="%Y%m%d" ;;
		10|dtm|dm|d10) dt_fmt="%Y%m%d_%H%M" ;;
		12|dtms|dms|d12) dt_fmt="%Y%m%d_%H%M%S" ;;
		t|tm|t4|tm4) dt_fmt="%H%M" ;;
		ts|tms|t6|tm6) dt_fmt="%H%M%S" ;;
		/) dt_fmt="%Y/%m/%d" ;;
		/:) dt_fmt="%Y/%m/%d %H:%M" ;;
		:) dt_fmt="%H:%M" ;;
		u|U) dt_fmt="%s" ;;
		%*) dt_fmt="$1" ;;
		*) dt_fmt="%$1" ;;
	esac
	date "+$dt_fmt"
}

alias d='dt 6'
alias d6='dt 6'
alias dtm='dt 10'
alias d10='dt 10'
alias dtms='dt 12'
alias d12='dt 12'
