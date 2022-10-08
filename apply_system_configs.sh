#!/bin/bash

echo "Setting system configurations..."

ehco ""
echo "Applying pacman confings..."
echo "Color" | sudo tee -a /etc/pacman.conf
echo "CheckSpace" | sudo tee -a /etc/pacman.conf
echo "VerbosePkgLists" | sudo tee -a /etc/pacman.conf
echo "ParallelDownloads = 20" | sudo tee -a /etc/pacman.conf

ehco ""
echo "Applying swappiness ..."
echo "vm.swappiness = 1" | sudo tee /etc/sysctl.d/99-swappiness.conf

ehco ""
echo "Setting default cpu count for make..."
CPU_COUNT=`grep -c ^processor /proc/cpuinfo`
echo "MAKEFLAGS=\"-j$CPU_COUNT\"" | sudo tee -a /etc/makepkg.conf

