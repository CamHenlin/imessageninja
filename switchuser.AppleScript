
on run argv
	do shell script "/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID " & item 1 of argv
	delay 0.8
	tell application "System Events"
		keystroke "user"
		delay 1
		keystroke return
	end tell
end run
