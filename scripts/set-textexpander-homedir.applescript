on run argv
	set homedir to (item 1 of argv)
	-- set homedir to "/Users/zarek"

	tell application "TextExpander"
		set snipgroup to the group "paths - universal"
		set snips to the snippets of snipgroup
		tell snipgroup
			repeat with snip in snips
				if the abbreviation of snip is "~//" then
					set homesnip to snip
				end if
			end repeat
		end tell
		set the plain text expansion of homesnip to homedir
	end tell
end run