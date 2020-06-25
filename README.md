# wlan1-mon

YOU CAN ALSO READ THIS MESSAGE - IN COLOR - BY RUNNING ./wlan1-mon.sh -h IN YOUR TERMINAL.

THIS SCRIPT HAS BEEN VERIFIED WORKING ON KALI LINUX 2020.2 (BOOT & LIVE) AND SHOULD WORK ALL RIGHT WITH UBUNTU DISTRIBUTIONS AS WELL.


This is a simple script to initialize your tp-link TL-WN722N V2/V3 adapter (wlan#), so that it can be used as a monitoring and injecting asset.
This script doesn't mess in any way with the network-manager settings or the other adapters. Everything else will stay as is.
It needs to always be run as user root - not via sudo. Anything else will simply fail, possibly deleting useful files in the midst.
So, before ./wlan1-mon.sh, make sure to have switched using su.
 
You don't need to have the required driver previously downloaded or installed. And, even if you do, this script will still work.
