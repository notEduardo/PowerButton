#!/bin/bash

# Main - hide or unhide files
if $(defaults read com.apple.finder CreateDesktop);
then
	defaults write com.apple.finder CreateDesktop false
    # Quit the following apps
    osascript -e 'quit app "Home"'
    osascript -e 'quit app "Messages"'
    osascript -e 'quit app "Maps"'
    osascript -e 'quit app "Music"'
    osascript -e 'quit app "Safari"'
    osascript -e 'quit app "GitHub Desktop"'
    osascript -e 'quit app "Postman"'
    osascript -e 'quit app "Terminal"'
    osascript -e 'quit app "VirtualBox"'
    osascript -e 'quit app "Visual Studio Code"'
    osascript -e 'quit app "Unity Hub"'
    osascript -e 'quit app "Gimp-2.10"'
    osascript -e 'quit app "Find My"'
    osascript -e 'quit app "Activity Monitor"'
    osascript -e 'quit app "System Preferences"'
    osascript -e 'quit app "App Store"'
    osascript -e 'quit app "Google Chrome"'
    osascript -e 'quit app "Discord"'
    osascript -e 'quit app "MAMP"'
    osascript -e 'quit app "Notes"'
    osascript -e 'quit app "Xcode"'
    osascript -e 'quit app "zoom.us"'
    osascript -e 'quit app "Preview"'
    osascript -e 'quit app "Facetime"'
    osascript -e 'quit app "Calendar"'
    killall Finder
    osascript -e 'tell application "Finder" to close windows'
else
	defaults write com.apple.finder CreateDesktop true
    killall Finder
fi

# Time - check time of day
echo $(date +"The time is %H:%M");
theTime=$(date +"The time is %H:%M");
theHour=$(date +"%H");
echo $theHour;
if [ $theHour -ge 0 ] && [ $theHour -le 11 ]
then
    greeting="Good Morning"
elif [ $theHour -ge 12 ] && [ $theHour -le 17 ] 
then 
    greeting="Good Afternoon"
else
    greeting="Good Evening"
fi
echo $greeting;

# Speak - welcomes and goodbyes
if $(defaults read com.apple.finder CreateDesktop);
then
    # Welcome - time
    say -v Ava $greeting" Eduardo"
    say -v Ava $theTime
    
else
    # Goodbye - time
    say -v Ava "Goodbye Eduardo have a "$greeting
fi

exit "0";