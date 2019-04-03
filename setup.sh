#!/bin/bash

echo --- Started linker script...
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
sudo apt install tmux zsh vim || sudo pacman -S tmux zsh vim
echo -- getting vim python helpers...
echo - getting pylint...
sudo apt install python-pylint python3-pylint || sudo apt install python2-pylint python-pylint || sudo pacman -S python-pylint python3-pylint || sudo pacman -S python2-pylint python-pylint
echo - getting python-jedi
sudo apt install python-jedi python3-jedi || sudo apt install python2-jedi python-jedi || sudo pacman -S python-jedi python3-jedi || sudo pacman -S python2-jedi python-jedi

echo --- Done!

