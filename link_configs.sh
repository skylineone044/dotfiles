#!/bin/bash

$PRINT_COLORED "Linking config files..."

# git config --global user.email "skylineone044@gmail.com"
# git config --global user.name "skylineone044"
$PRINT_COLORED "Enabling libsecret for git..."
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

git clone https://github.com/skylineone044/nvim-highlite.git ~/Projects/nvim-highlite
$PRINT_COLORED "Getting oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
$PRINT_COLORED "Getting POWERLEVEL10K..."
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
$PRINT_COLORED "Getting zsh-autosuggestions for oh-my-zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$PRINT_COLORED "Getting zsh-vi-mode for oh-my-zsh..."
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

$PRINT_COLORED "linking neovim..."
ln -s ~/Projects/dotfiles/nvim/ ~/.config/nvim

$PRINT_COLORED "linking paru..."
ln -s ~/Projects/dotfiles/paru/ ~/.config/paru

$PRINT_COLORED "linking legacy vim..."
ln -s ~/Projects/dotfiles/vim/.vimrc ~/.vimrc

$PRINT_COLORED "linking idevim..."
ln -s ~/Projects/dotfiles/vim/.ideavimrc ~/.ideavimrc

$PRINT_COLORED "linking tmux..."
mkdir ~/.tmux
ln -s ~/Projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf

$PRINT_COLORED "linking zsh..."
rm ~/.zshrc
ln -s ~/Projects/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Projects/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

$PRINT_COLORED "linking fd..."
ln -s ~/Projects/dotfiles/fd ~/.config/fd

$PRINT_COLORED "linking touchedd config..."
mkdir ~/.config/touchegg
ln -s ~/Projects/dotfiles/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf

$PRINT_COLORED "linking latte layout..."
ln -s ~/Projects/dotfiles/latte ~/.config/latte

$PRINT_COLORED "linking easyeffects presets..."
ln -s ~/Projects/dotfiles/EQ/easyeffects/ ~/.config/

$PRINT_COLORED "linking konsole..."
ln -s ~/Projects/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/Projects/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme

$PRINT_COLORED "linking alacritty"
ln -s ~/Projects/dotfiles/alacritty ~/.config/

$PRINT_COLORED "linking kitty"
ln -s ~/Projects/dotfiles/kitty ~/.config/

$PRINT_COLORED "Setting global gitignore"
git config --global core.excludesfile ~/Projects/dotfiles/global_gitignore

$PRINT_COLORED "installing fonts..."
mkdir ~/.local/share/fonts
$PRINT_COLORED "copying..."
cp -r ~/Projects/dotfiles/fonts/* ~/.local/share/fonts/
$PRINT_COLORED "linking emoji font config..."
ln -s ~/Projects/dotfiles/fonts/conf.d ~/.config/
mv ~/.config/conf.d ~/.config/fontconfig
$PRINT_COLORED "refreshing font cache..."
fc-cache -f -v

$PRINT_COLORED "set locales..."
echo "hu_HU.UTF-8 UTF-8" | sudo tee -a /etc/config_file
echo "en_SE.UTF-8 UTF-8" | sudo tee -a /etc/config_file
sudo locale-gen

$PRINT_COLORED "changing the default shell to zsh"
chsh -s $(which zsh)
