#!/bin/bash

echo "Linking config files..."

# git config --global user.email "skylineone044@gmail.com"
# git config --global user.name "skylineone044"

git clone https://github.com/skylineone044/nvim-highlite.git ~/Projects/nvim-highlite
echo "Getting oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Getting POWERLEVEL10K..."
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Getting zsh-autosuggestions for oh-my-zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "linking neovim..."
ln -s ~/Projects/dotfiles/nvim/ ~/.config/nvim

echo "linking legacy vim..."
ln -s ~/Projects/dotfiles/vim/.vimrc ~/.vimrc

echo "linking idevim..."
ln -s ~/Projects/dotfiles/vim/.ideavimrc ~/.ideavimrc

echo "linking tmux..."
ln -s ~/Projects/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/Projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Getting TPM"
rm -R ~/Projects/dotfiles/tmux/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# echo "Getting vim-plug"
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# echo "USE :PlugInstall of :PlugUpdate to get vim plugins"

echo "linking zsh..."
rm ~/.zshrc
ln -s ~/Projects/dotfiles/zsh/.zshrc ~/.zshrc
echo "linking fd..."
ln -s ~/Projects/dotfiles/fd ~/.config/fd

echo "linking touchedd config..."
mkdir ~/.config/touchegg
ln -s ~/Projects/dotfiles/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf

echo "linking latte layout..."
ln -s ~/Projects/dotfiles/latte ~/.config/latte

echo "linking easyeffects presets..."
ln -s ~/Projects/dotfiles/EQ/easyeffects/ ~/.config/

echo "linking konsole..."
ln -s ~/Projects/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/Projects/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme

echo "linking alacritty"
ln -s ~/Projects/dotfiles/alacritty ~/.config/

echo "linking kitty"
ln -s ~/Projects/dotfiles/kitty ~/.config/

echo "Setting global gitignore"
git config --global core.excludesfile ~/Projects/dotfiles/global_gitignore

echo "installing fonts..."
mkdir ~/.local/share/fonts
echo "copying..."
cp -r ~/Projects/dotfiles/fonts/* ~/.local/share/fonts/
echo "linking emoji font config..."
ln -s ~/Projects/dotfiles/fonts/conf.d ~/.config/
mv ~/.config/conf.d ~/.config/fontconfig
echo "refreshing font cache..."
fc-cache -f -v
