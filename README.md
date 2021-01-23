# steamlink-archlinux
Create Archlinux boot medium for steamlink with one script!
Archlinux with linux 5.4.24

## Steps

1. Run `boot_device_creator.sh` from bash(terminal) 
2. Create `steamlink/config/system/enable_ssh.txt` and write `true` in the .txt file for enabling ssh.

Be careful while specifying device addresses as the script WILL wipe all of data of that device. Any data lost or any harm done is your own responsibility.

## Default passwords:

### Default user
User: `alarm`
password: `alarm`

### Root user
User: `root`
password: `root`


## Misc
Based on  https://www.reddit.com/r/Steam_Link/comments/fgew5x/running_archlinux_on_steam_link_revisited/
