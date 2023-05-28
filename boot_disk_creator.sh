#!/bin/bash
echo "ArchLinux BootMedium Creator for Steamlink"
echo "Based on https://www.reddit.com/r/Steam_Link/comments/fgew5x/running_archlinux_on_steam_link_revisited/"
echo ""
sudo blkid
echo ""
echo "Please enter /dev/ address of your USB disk from above."
echo "For example /dev/sdb1"
echo "CAUTION! That device will be formatted and you will lose any data in there!"
read devaddress
sudo umount $devaddress
echo [1/11] formatting $devaddress
sudo mkfs.ext3 $devaddress
echo [2/11] mounting $devaddress to /media/disk
sudo mkdir -p /media/disk/
sudo mount $devaddress /media/disk
echo [3/11] "Downloading and unpacking userspace to /media/disk"
curl -Lo arch_userspace.tar.gz http://os.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz
sudo tar -xvpf  arch_userspace.tar.gz -C /media/disk/
echo [4/11] "Copying kexec_load.ko"
sudo cp kexec_load.ko /media/disk/boot/
echo [5/11] "Copying zImage"
sudo cp zImage /media/disk/boot/
echo [6/11] "Copying initramfs"
sudo cp initramfs-linux-steam.img /media/disk/boot/
echo [7/11] "Copying berlin2cd-valve-steamlink.dtb"
sudo cp berlin2cd-valve-steamlink.dtb /media/disk/boot/
echo [8/11] "Copying  kexec and 755 on kexec"
sudo cp kexec /media/disk/usr/bin
sudo chmod 755 /media/disk/usr/bin/kexec
echo [9/11] "Copying 5.4.24 to modules"
sudo cp -r 5.4.24/ /media/disk/lib/modules/
echo [10/11] "Copying run.sh and 755 on it"
sudo mkdir -p /media/disk/steamlink/factory_test/
sudo cp run.sh /media/disk/steamlink/factory_test/
sudo chmod 755 /media/disk/steamlink/factory_test/run.sh
echo [11/11] "Finally creating ssh folder"
sudo mkdir -p /media/disk/steamlink/config/system/
sudo echo "True" > /media/disk/steamlink/config/system/enable_ssh.txt
echo "Completed, unmounting disk. This may take a while."
sudo umount -l $devaddress
echo "Cleaning up ... "
sudo rm -rf /media/disk
echo  "Completed. Please remove the USB disk and insert it into steamlink."

