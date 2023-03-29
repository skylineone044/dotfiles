#!/bin/bash

$PRINT_COLORED "Setting system configurations..."

$PRINT_COLORED ""
$PRINT_COLORED "Applying pacman confings..."
echo "[options]" | sudo tee -a /etc/pacman.conf
echo "Color" | sudo tee -a /etc/pacman.conf
echo "CheckSpace" | sudo tee -a /etc/pacman.conf
echo "VerbosePkgLists" | sudo tee -a /etc/pacman.conf
echo "ParallelDownloads = 20" | sudo tee -a /etc/pacman.conf

$PRINT_COLORED ""
$PRINT_COLORED "Applying swappiness ..."
echo "vm.swappiness = 1" | sudo tee /etc/sysctl.d/99-swappiness.conf

$PRINT_COLORED ""
$PRINT_COLORED "Blacklisting pcspkr..."
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf

$PRINT_COLORED ""
$PRINT_COLORED "Setting default cpu count for make..."
CPU_COUNT=`grep -c ^processor /proc/cpuinfo`
echo "MAKEFLAGS=\"-j$CPU_COUNT\"" | sudo tee -a /etc/makepkg.conf

$PRINT_COLORED ""
$PRINT_COLORED "Enabling services..."
sudo systemctl enable power-profiles-daemon.service

