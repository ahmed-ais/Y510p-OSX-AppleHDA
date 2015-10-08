# Y510p-OSX-AppleHDA

This project aims to make the process of enabling the native AppleHDA.kext on Lenovo Ideapad Y510p very much easier. Instead of tinkering with AppleHDA every new update or waiting for someone to prepare a patched kext, this script will do it for you in a blink of an eye!

## Background
Usually, AppleHDA.kext will not work out of the box with hackintosh and in many cases it can be modified to support the PC audio chip. As far as I am aware of, there are currently two methods to achieve that. The first is to patch AppleHDA.kext and install it to /System/Library/Extensions which can be problematic once OSX is updated as the kext may be overridden with a newer one and the modifications are lost. The second method, introduced by Pike R Alpha in his blog, works by creating a helper/dummy kext that contain the modifications instead of directly editing AppleHDA. This method has the advantage that AppleHDA will be kept clean and the dummy kext will not be overridden by any update so it is a safe-update method.

## How it works
This script is based on Pike R Alpha's idea but it automates the process for Y510p. It will create a dummy kext for AppleHDA, inserts the proper audio codecs and layout, fix Info.plist for Y510p audio device, and install the kext in /S/L/E. All this is done for your pleasure without any interaction from your side. As this is an update-safe procedure, you only need to use this script once after installing OSX.

**Note1: since this script will install the created dummy kext into /S/L/E, it will need root access and have to be run with sudo. I will make an update later on to allow creating the kext without installing it which will not need sudo to run anymore. For now sudo is required and it is harmless (you can investigate the code any time).**

**Note2: patching AppleHDA.kext binary and setting audio layout id is still required and should be done using within Clover's config.plist as described in my guide here http://www.insanelymac.com/forum/topic/303276-guide-for-installing-os-x-yosemite-on-lenovo-ideapad-y510p/page-37#entry2172834**

## Usage
First, download this repository from the link on your right. You can also use Terminal to clone the repo in directly:
`git clone https://github.com/ahmed-ais/Y510p-OSX-AppleHDA.git`

Once you have a copy of the repo (by either methods), navigate to the downloaded folder (make sure to decompress it first if needed) using Terminal then: 

1. Make the script executable: `chmod +x AppleHDA282Creator.sh`
2. Run the script: `sudo ./AppleHDA282Creator.sh`
 
## Credits
Pike R Alpha: https://pikeralpha.wordpress.com/2013/12/17/new-style-of-applehda-kext-patching/ (for the idea of patching AppleHDA this way)

Intruder16: http://www.insanelymac.com/forum/topic/303276-guide-for-installing-os-x-yosemite-on-lenovo-ideapad-y510p/page-8#entry2115444 (for completing the codecs map for Y510p)

