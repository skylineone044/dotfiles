#!/bin/bash

echo --- Started linker script...
echo -- Getting git...
sudo apt install -y git || sudo pacman -S --noconfirm git
echo setting up git...
git config --global user.email "tokodioli@gmail.com"
git config --global user.name "skylineone044"

echo -- Starting...
mkdir ~/git
cd  ~/git/
echo -- Cloning repos...
git clone --recurse-submodules https://gitlab.com/skylineone044/dotfiles.git

echo - linking vim...
ln -s ~/git/dotfiles/vim/.vim ~/.vim
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

echo - linking tmux...
ln -s ~/git/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo - linking zsh...
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh

echo - linking latte layout...
ln -s ~/git/dotfiles/latte ~/.config/latte

echo -- getting powerline fonts...
cd ~/git/
git clone https://github.com/powerline/fonts.git --depth=1
echo - installing powerline fonts...
cd fonts
./install.sh

echo - linking konsole...
ln -s ~/git/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/git/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme


echo -- Getting dependencies...
echo - getting POWERLEVEL9K...
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo -- getting essentials: tmux, zsh, vim...
sudo apt install -y tmux zsh vim || sudo pacman -S --noconfirm tmux zsh vim
echo -- getting vim python helpers...
echo - getting pylint...
sudo apt install -y pylint pylint3 || sudo apt install -y python-pylint python3-pylint || sudo apt install -y python2-pylint python-pylint || sudo pacman -S --noconfirm pylint pylint3  || sudo pacman -S --noconfirm python-pylint python3-pylint || sudo pacman -S --noconfirm python2-pylint python-pylint
echo - getting python-jedi
sudo apt install -y python-jedi python3-jedi || sudo apt install -y python2-jedi python-jedi || sudo pacman -S  --noconfirm python-jedi python3-jedi || sudo pacman -S  --noconfirm python2-jedi python-jedi

echo -- getting chromium
sudo apt install -y chromium-browser || sudo pacman -S --noconfirm chromium-browser

echo --- Done!

