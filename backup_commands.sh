#!/bin/sh

apt install git binutils build-essential vim bison gawk texinfo
rm /bin/sh
ln -s /bin/bash /bin/sh
git clone https://github.com/kyazdani42/ft_linux
cd ft_linux && ./version-check.sh
fdisk /dev/sdb
# fdisk
# gpt label, first part 1MB bios boot, 2nd part -2G linux fs, 3rd part 2G linux swap
mkfs.ext4 /dev/sdb2
mkswap /dev/sdb3
echo "export LFS=/mnt/lfs" >> ~/.profile
mkdir -pv $LFS
mount -v -t ext4 /dev/sdb2 $LFS
swapon -v /dev/sdb3
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources
