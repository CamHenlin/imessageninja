on run argv
	tell application "System Events"
		tell application "Messages" to activate
		tell process "Messages"
			click menu item "New Message" of menu "file" of menu bar 1
		end tell
		delay 1
		keystroke item 1 of argv
		keystroke tab
		keystroke item 2 of argv
		keystroke return
	end tell
end run
