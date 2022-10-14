#!/bin/bash

$PRINT_COLORED "Installing apps..."

$PRINT_COLORED "Installing paru..."
DIR=`pwd`
cd ~/Projects
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd $DIR

PACKAGES="
	base-devel
    git
    openssh
    vim
    neovim
    python-neovim
	python-pyxdg
    xclip
    xsel
    wl-clipboard
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
    openssh
    thefuck
    pavucontrol-qt
    ffmpeg
    imagemagick
    linux-zen-headers
    code
    code-marketplace
    flatpak
	libappimage
    latte-dock-git
	vimv-git
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

$PRINT_COLORED "Installing packages..."
$PACKAGE_INSALL_COMMAND

$PRINT_COLORED "Installing flatpak apps..."
$FLATPAK_INSTALL_COMMAND

$PRINT_COLORED "Enabling services..."
sudo systemctl enable sshd
sudo systemctl start sshd
