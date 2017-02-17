on adding folder items to this_folder after receiving added_items
	try
		tell application "Finder"
			--get the name of the folder
			set the folder_name to the name of this_folder
			repeat with x in added_items
				copy name of x as string to FileName
				set FileName to quoted form of FileName
				-- screenshots are png files so we check the extension
				if FileName ends with ".png'" then
					set result to do shell script ("/screen.sh " & FileName)
					if result contains "Success" then
						set alert_message to ("Converted to Screenshot to Text, View?" & return & return) as Unicode text
						display dialog the alert_message buttons {"Yes", "No"} default button 2 with icon 1 giving up after dialog_timeout
						set the user_choice to the button returned of the result
						if user_choice is "Yes" then
							tell application "Finder"
								--go to the desktop
								activate
								--open the folder
								open this_folder
								--select the items
								reveal x
							end tell
						end if
					end if
				end if
			end repeat
		end tell
	end try
end adding folder items to
