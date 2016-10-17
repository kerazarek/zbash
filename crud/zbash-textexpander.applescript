#!/bin/bash

argv_command='on run argv
	set snipgroup to ( item 1 of argv )
	set torf to false
	tell app "TextExpander"
		set snipgroup to group "paths - cube"
		set the expansion enabled of snipgroup to torf
		-- display dialog snipgroup
	end tell
end run'

if test $HOME = "/Users/zarek"; then
	snipgroup="paths - zmunn"
	osascript -e "$argv_command" "$snipgroup"
elif test $HOME = "/Users/zss2002"; then
	snipgroup="paths - cube"
	#osascript -e $argv_command
	echo hi2
fi

# tell app "Terminal" to display dialog "Hello World"

# tell application "TextExpander"
#  set theGroup to group "My Snippets"
#  set theSnippets to snippets of theGroup
#  repeat with theSnip in theSnippets
#  if ((content type of theSnip) = rich_text) then
#  set the content type of theSnip to plain_text
#  end if
#  end repeat
# end tell