#!/bin/bash

echo "Installing apps..."

echo "Installing paru..."
# DIR=`pwd`
# cd ~/Projects
# sudo pacman -S --needed base-devel
# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si
# cd $DIR

PACKAGES="
    git
    neovim
    vim
    zsh
    tmux
    alacritty
    nodejs
    htop
    firefox
    pyenv
    fd
    exa
    bat
    ripgrep
    mpv
	vlc
    pavucontrol-qt
    code
    code-marketplace
    flatpak
	libappimage
    latte-dock-git
	touchegg
	touche
	appimagelauncher
    google-chrome
	"

FLATPAK_APPS="
	com.github.tchx84.Flatseal
    chat.rocket.RocketChat
    org.gtk.Gtk3theme.adw-gtk3-dark
    org.rncbc.qpwgraph
"

PACKAGE_INSALL_COMMAND="paru -Syu --noconfirm $PACKAGES"
FLATPAK_INSTALL_COMMAND="flatpak install --assumeyes $FLATPAK_APPS"

echo "Installing packages..."
$PACKAGE_INSALL_COMMAND

echo "Installing flatpak apps..."
$FLATPAK_INSTALL_COMMAND

