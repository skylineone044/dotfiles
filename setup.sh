#!/bin/bash

echo \n\n\n--- Started linker script...
echo \n-- Getting git...
sudo apt install -y git curl || sudo pacman -S --noconfirm git curl
echo \n- setting up git...
git config --global user.email "tokodioli@gmail.com"
git config --global user.name "skylineone044"

echo \n\n-- getting essentials: tmux, zsh, vim...
sudo apt install -y tmux zsh vim || sudo pacman -S --noconfirm tmux zsh vim
echo \n- installing fonts...
mkdir ~/.local/share/fonts
echo copying...
cp ~/git/dotfiles/"Inconsolata Nerd Font Complete Mono.otf" ~/.local/share/fonts/
echo refreshing font cache...
fc-cache -f -v

echo \n\n-- Starting...
echo \n-- Cloning repos...
#git clone --recurse-submodules https://gitlab.com/skylineone044/dotfiles.git
echo \n- getting Dotfiles
git clone https://gitlab.com/skylineone044/dotfiles.git ~/git/dotfiles
echo \n- getting oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo \n- getting POWERLEVEL9K...
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo \n\nUSE TPM AND VUNDLE COMMANDS TO GET PLUGINS\n\n

echo - linking vim...
ln -s ~/git/dotfiles/vim/.vim ~/.vim
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

echo \n- linking tmux...
ln -s ~/git/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo \n- getting TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo \n- getting Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo \n- linking zsh...
rm ~/.zshrc
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc

echo \n- linking latte layout...
ln -s ~/git/dotfiles/latte ~/.config/latte

echo \n\n-- getting powerline fonts...
cd ~/git/
git clone https://github.com/powerline/fonts.git --depth=1
echo \n- installing powerline fonts...
cd fonts
./install.sh

echo \n- linking konsole...
ln -s ~/git/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/git/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme



echo \n\n-- Getting dependencies...

echo \n-- getting vim python helpers...
echo \n- getting pylint...
sudo apt install -y pylint pylint3 || sudo apt install -y python-pylint python3-pylint || sudo apt install -y python2-pylint python-pylint || sudo pacman -S --noconfirm pylint pylint3  || sudo pacman -S --noconfirm python-pylint python3-pylint || sudo pacman -S --noconfirm python2-pylint python-pylint
echo \n- getting python-jedi
sudo apt install -y python-jedi python3-jedi || sudo apt install -y python2-jedi python-jedi || sudo pacman -S  --noconfirm python-jedi python3-jedi || sudo pacman -S  --noconfirm python2-jedi python-jedi

echo \n\n-- getting chromium
sudo apt install -y chromium-browser || sudo pacman -S --noconfirm chromium-browser



echo \n\n\n--- Done!\n\n\n
