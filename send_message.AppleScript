on theSplit(theString, theDelimiter)
	set oldDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theArray to every text item of theString
	set AppleScript's text item delimiters to oldDelimiters
	return theArray
end theSplit

on run argv
	tell application "System Events"
		tell application "Messages" to activate
		tell process "Messages"
			click menu item "New Message" of menu "file" of menu bar 1
		end tell
		delay 1
		set to_arr to my theSplit(item 1 of argv, " ")
		repeat with to_usr in to_arr
			keystroke to_usr
			keystroke return
		end repeat
		-- keystroke item 1 of argv
		keystroke tab
		keystroke item 2 of argv
		keystroke return
	end tell
end run
