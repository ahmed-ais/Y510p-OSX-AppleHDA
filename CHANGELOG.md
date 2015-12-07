## 1.1.0 (2015-12-07)

Features:

  - the script will terminate if detected OS X version is niether 10.10.x nor 10.11.x to prevent miss-use if ran under different version (which is not supported).

Bugfixes:

  - fixed incorrect kext version in dummy kext's Info.plist which prevented the kext from loading

Performance:

  - more accurate method to fix kexts permissions after installing the dummy kext is adopted.

## 1.0.0 (2015-10-14)

Initial Release:

  - a tool to create and install a dummy kext to enable AppleHDA on Y510p for Yosemite and El Capitan
