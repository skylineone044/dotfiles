#!/bin/bash

printf "\n\n\n--- Started linker script..."
printf "\n-- Getting git..."
sudo apt install -y git curl || sudo pacman -S --noconfirm git curl
printf "\n- setting up git..."
git config --global user.email "skylineone044@gmail.com"
git config --global user.name "skylineone044"

printf "\n\n-- getting essentials: tmux, zsh, neovim..."
sudo apt install -y tmux zsh neovim fd || sudo pacman -S --noconfirm tmux zsh neovim fd
printf "\n- getting alacritty..."
sudo apt install -y alacritty || spdo pacman -S --noconfirm alacritty
sudo apt install -y ripgrep || spdo pacman -S --noconfirm ripgrep

printf "\n\n-- Starting..."
printf "\n- getting Dotfiles"
git clone https://gitlab.com/skylineone044/dotfiles.git ~/git/dotfiles
git clone https://github.com/skylineone044/nvim-highlite.git ~/git/nvim-highlite
printf "\n- getting oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf "\n- getting POWERLEVEL10K..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
printf "\n- getting zsh-autosuggestions for oh-my-zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

printf "\n\nUSE TPM AND VIM-PLUG COMMANDS TO GET PLUGINS\n\n"

printf "- linking neovim..."
ln -s ~/git/dotfiles/nvim/ ~/.config/nvim

printf "- linking legacy vim..."
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

printf "- linking idevim..."
ln -s ~/git/dotfiles/vim/.ideavimrc ~/.ideavimrc

printf "\n- linking tmux..."
ln -s ~/git/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

printf "\n- getting TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf "\n- getting vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
printf "USE :PlugInstall of :PlugUpdate to get vim plugins"

printf "\n- refreshing tmux..."
tmux source ~/.tmux.conf
printf "\n-! USE PREFIX+I TO INSTALL TMUX PLUGINS"
printf "\n-! USE PREFIX+U TO UPDATE TMUX PLUGINS"

printf "\n- linking zsh..."
rm ~/.zshrc
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
printf "\n- linking fd..."
ln -s ~/git/dotfiles/fd ~/.config/fd

printf "\n- linking touchedd config..."
mkdir ~/.config/touchegg
ln -s ~/git/dotfiles/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf

printf "\n- linking latte layout..."
ln -s ~/git/dotfiles/latte ~/.config/latte

printf "\n- linking easyeffects presets..."
ln -s ~/git/dotfiles/EQ/easyeffects/ ~/.config/easyeffects/

printf "\n- linking KDE colorschemes..."
ln -s ~/git/stardust/color-schemes/ ~/.local/share/ || rmdir ~/.local/share/color-schemes && ln -s ~/git/stardust/color-schemes/ ~/.local/share/
printf "\n- installing fonts..."
mkdir ~/.local/share/fonts
printf "copying..."
cp ~/git/dotfiles/fonts/* ~/.local/share/fonts/
printf "linking emoji font config..."
ln -s ~/git/dotfiles/fonts/conf.d ~/.config/fontconfig/
printf "refreshing font cache..."
fc-cache -f -v

printf "\n- linking konsole..."
ln -s ~/git/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/git/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme

printf "\n- linking alacritty"
ln -s ~/git/dotfiles/alacritty ~/.config/

printf "\n- linking kitty"
ln -s ~/git/dotfiles/kitty ~/.config/

printf "\n\n-- Getting dependencies..."

printf "\n-- getting vim python helpers..."
printf "\n- getting pylint..."
sudo apt install -y pylint pylint3 || sudo apt install -y python-pylint python3-pylint || sudo apt install -y python2-pylint python-pylint || sudo pacman -S --noconfirm pylint pylint3  || sudo pacman -S --noconfirm python-pylint python3-pylint || sudo pacman -S --noconfirm python2-pylint python-pylint

printf "\n\n-- getting misc tools"
sudo pacman -S --noconfirm exa || sudo apt install -y exa
sudo pacman -S --noconfirm exa || sudo apt install -y bat


printf "\n\n\n--- Done!\n\n\n"
printf "-! USE PREFIX+I TO INSTALL TMUX PLUGINS"
printf "-! USE PREFIX+U TO UPDATE TMUX PLUGINS"
