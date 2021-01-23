#!/bin/sh

echo "Resetting crashcounter"
fts-set steamlink.crashcounter 0

echo "Mounting stuff"
mount -t proc proc /mnt/disk/proc
mount -o rbind /sys /mnt/disk/sys
mount -o rbind /dev /mnt/disk/dev

zImage="zImage";
sync

echo "Executing stuff"
insmod /mnt/disk/boot/kexec_load.ko
chroot /mnt/disk/ /usr/bin/kexec -l /boot/${zImage} --initrd /boot/initramfs-linux-steam.img --dtb /boot/berlin2cd-valve-steamlink.dtb --command-line "root=/dev/sda1 rootwait rw init=/lib/systemd/systemd console=ttyS0,115200n8 usbcore.autosuspend=-1"
chroot /mnt/disk/ /usr/bin/kexec -e
