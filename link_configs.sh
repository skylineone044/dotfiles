#!/bin/bash

print_green "Linking config files..."

# git config --global user.email "skylineone044@gmail.com"
# git config --global user.name "skylineone044"

git clone https://github.com/skylineone044/nvim-highlite.git ~/Projects/nvim-highlite
print_green "Getting oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
print_green "Getting POWERLEVEL10K..."
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
print_green "Getting zsh-autosuggestions for oh-my-zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

print_green "linking neovim..."
ln -s ~/Projects/dotfiles/nvim/ ~/.config/nvim

print_green "linking paru..."
ln -s ~/Projects/dotfiles/paru/ ~/.config/paru

print_green "linking legacy vim..."
ln -s ~/Projects/dotfiles/vim/.vimrc ~/.vimrc

print_green "linking idevim..."
ln -s ~/Projects/dotfiles/vim/.ideavimrc ~/.ideavimrc

print_green "linking tmux..."
ln -s ~/Projects/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/Projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf

print_green "Getting TPM"
rm -R ~/Projects/dotfiles/tmux/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# print_green "Getting vim-plug"
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# print_green "USE :PlugInstall of :PlugUpdate to get vim plugins"

print_green "linking zsh..."
rm ~/.zshrc
ln -s ~/Projects/dotfiles/zsh/.zshrc ~/.zshrc
print_green "linking fd..."
ln -s ~/Projects/dotfiles/fd ~/.config/fd

print_green "linking touchedd config..."
mkdir ~/.config/touchegg
ln -s ~/Projects/dotfiles/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf

print_green "linking latte layout..."
ln -s ~/Projects/dotfiles/latte ~/.config/latte

print_green "linking easyeffects presets..."
ln -s ~/Projects/dotfiles/EQ/easyeffects/ ~/.config/

print_green "linking konsole..."
ln -s ~/Projects/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/Projects/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme

print_green "linking alacritty"
ln -s ~/Projects/dotfiles/alacritty ~/.config/

print_green "linking kitty"
ln -s ~/Projects/dotfiles/kitty ~/.config/

print_green "Setting global gitignore"
git config --global core.excludesfile ~/Projects/dotfiles/global_gitignore

print_green "installing fonts..."
mkdir ~/.local/share/fonts
print_green "copying..."
cp -r ~/Projects/dotfiles/fonts/* ~/.local/share/fonts/
print_green "linking emoji font config..."
ln -s ~/Projects/dotfiles/fonts/conf.d ~/.config/
mv ~/.config/conf.d ~/.config/fontconfig
print_green "refreshing font cache..."
fc-cache -f -v
