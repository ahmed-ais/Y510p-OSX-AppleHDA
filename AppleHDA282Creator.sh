#!/bin/bash

# save current working directory
cwd=$(pwd)

# clear display
clear

# make sure there is no instance of AppleHDA282.kext in /S/L/E
sudo rm -R /System/Library/Extensions/AppleHDA282.kext

echo "Creating dummy AppleHDA kext that contains proper codecs ..."
sudo cp -R /System/Library/Extensions/AppleHDA.kext /System/Library/Extensions/AppleHDA282.kext
cd /System/Library/Extensions/AppleHDA282.kext/Contents
sudo rm -R PlugIns
sudo rm -R _CodeSignature
sudo rm Resources/*.xml.zlib
sudo rm -rf Resources/*.lproj
sudo rm version.plist
sudo rm MacOS/AppleHDA
sudo ln -s /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA MacOS/AppleHDA
cd $cwd
sudo cp layout3.xml.zlib /System/Library/Extensions/AppleHDA282.kext/Contents/Resources/
sudo cp Platforms.xml.zlib /System/Library/Extensions/AppleHDA282.kext/Contents/Resources/
sudo sed -i "" 's/272.50/999.1.1fc1/' /System/Library/Extensions/AppleHDA282.kext/Contents/Info.plist
sudo sed -i "" '/<string>IOHDACodecFunction<\/string>/r HDAfix.txt' /System/Library/Extensions/AppleHDA282.kext/Contents/Info.plist

echo "Clearing kernel extensions cache ..."
sudo touch /System/Library/Extensions

echo "Done! please reboot ..."