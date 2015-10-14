# Y510p-OSX-AppleHDA

This project aims to make the process of enabling the native AppleHDA.kext on Lenovo Ideapad Y510p very much easier. Instead of tinkering with AppleHDA every new update or waiting for someone to prepare a patched kext, this script will do it for you in a blink of an eye!

## Background
Usually, AppleHDA.kext will not work out of the box with hackintosh and in many cases it can be modified to support the PC audio chip. As far as I am aware of, there are currently two methods to inject and patch AppleHDA.kext. The first methods works by using a patching version of the actual AppleHDA.kext and install it to /System/Library/Extensions replacing the original one. This method can be problematic once OS X is updated as the kext may be overridden with a newer one and the modifications are lost. Once that happens, you will have to wait for someone to patch the new AppleHDA.kext for you or to install the older version which is not right. Therefor, this method is considered non update-safe and is not recommended and is not covered here.

The seocnd method introduced by Pike R Alpha in his blog, works by creating a helper/dummy kext that contain the modifications instead of directly editing AppleHDA. This method has the advantage that AppleHDA will be kept clean and the dummy kext will not be overridden by any update so it is a safe-update method.

In addition to injecting and patching AppleHDA.kext, we also need to define the audio layout in DSDT or Clover and finally to install a kext to fix audio loss after sleep/wake.

## Getting AppleHDA to Work
So we will use the second method to inject and patch AppleHDA.kext leaving the original file intact. First, download this repository from the link on your right. You can also use Terminal to clone the repo in directly:
`git clone https://github.com/ahmed-ais/Y510p-OSX-AppleHDA.git`

Once you have a copy of the repo (by either methods), navigate using Terminal to the downloaded folder (make sure to decompress it first if needed).

### Injecting Audio Codecs
From Terminal, do the following:
- Make the script executable: `chmod +x AppleHDA282Creator.sh`
- Run the script: `sudo ./AppleHDA282Creator.sh`

Once the script finishes (usually instantly), a new kext will already be created in /S/L/E with the name 'AppleHDA282.kext' which is the required dummy kext.

**Note: since this script will install the created dummy kext into /S/L/E, it will need root access and have to be run with sudo. I will make an update later on to allow creating the kext without installing it which will not need sudo to run anymore. For now sudo is required and it is harmless (you can investigate the code any time to make sure it is safe).**

###  Patching the AppleHDA.kext binary
Put the patches from the attached plist files in your Clover's config.plist to hot-patch AppleHDA.kext binary:
- For Yosemite, use the patches from applehda_10.10_config.plist
- For El Capitan, use the patches from applehda_10.11_config.plist

### Defining Audio Layout
To define the audio layout we will use Clover again. Open config.plist, scroll to Devices, and set the Audio section according to the attched plist file (either one, they are both the same for this part).

### Fixing Audio Loss after Sleep/Wake
This is important but simple. Head over Rehabman's fork of CodecCommander, download and install the kext without any modifications. Link: https://bitbucket.org/RehabMan/os-x-eapd-codec-commander.

## License
Since this work is based on others work as stated above and credited below. It should be mentioned that Pike requires to link his license for anywork based on his work. This is Pike's license: https://pikeralpha.wordpress.com/license/.
 
## Credits
Pike R Alpha: https://pikeralpha.wordpress.com/2013/12/17/new-style-of-applehda-kext-patching/ (for the idea of patching AppleHDA this way)

Intruder16: http://www.insanelymac.com/forum/topic/303276-guide-for-installing-os-x-yosemite-on-lenovo-ideapad-y510p/page-8#entry2115444 (for completing the codecs map for Y510p)

Rehabman: https://bitbucket.org/RehabMan/os-x-eapd-codec-commander (for providing his fork CodecCommander)
