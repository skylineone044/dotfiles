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
    man-db
    ctags
    firefox
    pyenv
    fd
    exa
    bat
    fzf
    ripgrep
    mpv
    vlc
    gwenview
    spectacle
    okular
    openssh
    thefuck
    pavucontrol-qt
    ffmpeg
    imagemagick
    rsync
    linux-zen-headers
    code
    code-marketplace
    noto-fonts-emoji
    noto-fonts-emoji-fontconfig
    veracrypt
    flatpak
    libappimage
    latte-dock-git
    vimv-git
    touchegg
    touche
    appimagelauncher
    google-chrome
    adw-gtk3
    clang
    compiler-rt
    python-black
"

FLATPAK_APPS="
    com.github.tchx84.Flatseal
    chat.rocket.RocketChat
    org.gtk.Gtk3theme.adw-gtk3-dark
    org.rncbc.qpwgraph
"

EXTRA_PACKAGES="
    obsidian
    easyeffects
    kolourpaint
    blender
    krita
    gimp
    inkscape
    eog
    kdenlive
    discord
    telegram-desktop
    clion-lldb
    clion-jre
    clion-gdb
    clion-cmake
    clion
    intellij-idea-ultimate-edition
    intellij-idea-ultimate-edition-jre
    pycharm-professional
    webstorm
    webstorm-jre
    steam
    transmission-qt
    nicotine+
    virtualbox
    virtualbox-host-dkms
    libvirt
    piper
"

EXTRA_FLATPAK_APPS="
    com.github.taiko2k.tauonmb
    com.sindresorhus.Caprine
    com.skype.Client
    in.srev.guiscrcpy
    org.libreoffice.LibreOffice
"

PACKAGE_INSALL_COMMAND="paru -Syu --noconfirm --needed"
FLATPAK_INSTALL_COMMAND="flatpak install --assumeyes"

$PRINT_COLORED "Installing packages..."
$PACKAGE_INSALL_COMMAND $PACKAGES

$PRINT_COLORED "Installing flatpak apps..."
$FLATPAK_INSTALL_COMMAND $FLATPAK_APPS

if [ "$1" == "--install-extras" ]
  then
    $PRINT_COLORED "Installing extra packages..."
    $PACKAGE_INSALL_COMMAND $EXTRA_PACKAGES

    $PRINT_COLORED "Installing extra flatpak apps..."
    $FLATPAK_INSTALL_COMMAND $EXTRA_FLATPAK_APPS
fi

$PRINT_COLORED "Enabling services..."
sudo systemctl enable sshd
sudo systemctl start sshd
