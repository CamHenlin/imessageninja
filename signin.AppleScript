
on run argv

	tell application "Messages"
		activate
		delay 1

		tell application "System Events" to click button 1 of group 1 of window 1 of application "Messages"

		tell application "System Events" to keystroke item 1 of argv
		tell application "System Events" to keystroke tab
		delay 0.25
		tell application "System Events" to keystroke item 2 of argv

		tell application "System Events"
			tell process "Messages"
				set tElements to entire contents of window "Messages"
				repeat with tElement in tElements
					if (exists attribute "AXIdentifier" of tElement) then
						if value of attribute "AXIdentifier" of tElement = "_NS:118" then click tElement
					end if
				end repeat
			end tell
		end tell
	end tell


end run