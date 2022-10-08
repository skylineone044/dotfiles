#!/bin/bash

print_green "Installing apps..."

print_green "Installing paru..."
DIR=`pwd`
cd ~/Projects
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd $DIR

PACKAGES="
    git
    neovim
    python-neovim
	python-pyxdg
    xclip
    xsel
    wl-clipboard
    vim
    zsh
	zsh-syntax-highlighting
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
    thefuck
    pavucontrol-qt
    ffmpeg
    imagemagic
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

PACKAGE_INSALL_COMMAND="paru -Syu --noconfirm --needed $PACKAGES"
FLATPAK_INSTALL_COMMAND="flatpak install --assumeyes $FLATPAK_APPS"

print_green "Installing packages..."
$PACKAGE_INSALL_COMMAND

print_green "Installing flatpak apps..."
$FLATPAK_INSTALL_COMMAND

