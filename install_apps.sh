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
    acpi_call-dkms
    adw-gtk3
    alacritty
    appimagelauncher
    base-devel
    bat
    clang
    code
    code-marketplace
    compiler-rt
    ctags
    docker
    docker-buildx
    docker-compose
    exa
    fd
    ffmpeg
    firefox
    flatpak
    fzf
    git
    google-chrome
    gwenview
    htop
    imagemagick
    kdeconnect
    latte-dock-git
    libappimage
    linux-zen-headers
    man-db
    mpv
    neovim
    nodejs
    noto-color-emoji-fontconfig
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    npm
    okular
    openssh
    pavucontrol-qt
    power-profiles-daemon
    pyenv
    python-black
    python-neovim
    python-pyxdg
    python-virtualenv
    ripgrep
    rsync
    spectacle
    thefuck
    tmux
    touche
    touchegg
    veracrypt
    vim
    vimv-git
    vlc
    wl-clipboard
    xclip
    xsel
    zsh
    zsh-syntax-highlighting
"

FLATPAK_APPS="
    chat.rocket.RocketChat
    com.github.tchx84.Flatseal
    org.gtk.Gtk3theme.adw-gtk3-dark
    org.rncbc.qpwgraph
"

EXTRA_PACKAGES="
    blender
    clion
    clion-cmake
    clion-gdb
    clion-jre
    clion-lldb
    discord
    easyeffects
    eog
    gimp
    inkscape
    intellij-idea-ultimate-edition
    intellij-idea-ultimate-edition-jre
    kdenlive
    kolourpaint
    krita
    libvirt
    nicotine+
    obsidian
    piper
    pycharm-professional
    steam
    telegram-desktop
    transmission-qt
    virtualbox
    virtualbox-host-dkms
    webstorm
    webstorm-jre
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
