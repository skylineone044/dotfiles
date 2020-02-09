#!/bin/bash

printf "\n\n\n--- Started linker script..."
printf "\n-- Getting git..."
sudo apt install -y git curl || sudo pacman -S --noconfirm git curl
printf "\n- setting up git..."
git config --global user.email "tokodioli@gmail.com"
git config --global user.name "skylineone044"

printf "\n\n-- getting essentials: tmux, zsh, neovim..." 
#sudo apt install -y tmux zsh vim || sudo pacman -S --noconfirm tmux zsh vim
sudo apt install -y tmux zsh neovim || sudo pacman -S --noconfirm tmux zsh neovim
printf "\n- getting alacritty..."
sudo apt install -y alacritty || sudo pacman -S --noconfirm alacritty

printf "\n\n-- Starting..." 
#printf "\n-- Cloning repos..." 
#git clone --recurse-submodules https://gitlab.com/skylineone044/dotfiles.git
printf "\n- getting Dotfiles" 
git clone https://gitlab.com/skylineone044/dotfiles.git ~/git/dotfiles
printf "\n- getting oh-my-zsh" 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf "\n- getting POWERLEVEL10K..." 
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

printf "\n\nUSE TPM AND VUNDLE COMMANDS TO GET PLUGINS\n\n" 

#printf "- linking vim..." 
#ln -s ~/git/dotfiles/vim/.vim ~/.vim
#ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

printf "- linking neovim..." 
ln -s ~/git/dotfiles/nvim/ ~/.config/nvim

printf "\n- linking tmux..." 
ln -s ~/git/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

printf "\n- getting TPM" 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# VUNDLE DEPRECATED
#printf "\n- getting Vundle" 
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

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

printf "\n- linking latte layout..." 
ln -s ~/git/dotfiles/latte ~/.config/latte

printf "\n- installing fonts..." 
mkdir ~/.local/share/fonts
printf "copying..." 
cp ~/git/dotfiles/"Inconsolata Nerd Font Complete.otf" ~/.local/share/fonts/
printf "refreshing font cache..." 
fc-cache -f -v

printf "\n- linking konsole..." 
ln -s ~/git/dotfiles/konsole/ZSH_FTW.profile ~/.local/share/konsole/ZSH_FTW.profile
ln -s ~/git/dotfiles/konsole/skykonsole.colorscheme ~/.local/share/konsole/skykonsole.colorscheme

printf "\n- linking alacritty"
ln -s ~/git/dotfiles/alacritty ~/.config/alacritty

printf "\n\n-- Getting dependencies..." 

printf "\n-- getting vim python helpers..." 
printf "\n- getting pylint..." 
sudo apt install -y pylint pylint3 || sudo apt install -y python-pylint python3-pylint || sudo apt install -y python2-pylint python-pylint || sudo pacman -S --noconfirm pylint pylint3  || sudo pacman -S --noconfirm python-pylint python3-pylint || sudo pacman -S --noconfirm python2-pylint python-pylint
printf "\n- getting python-jedi" 
sudo apt install -y python-jedi python3-jedi || sudo apt install -y python2-jedi python-jedi || sudo pacman -S  --noconfirm python-jedi python3-jedi || sudo pacman -S  --noconfirm python2-jedi python-jedi

#printf "\n\n-- getting chromium" 
#sudo apt install -y chromium-browser || sudo pacman -S --noconfirm chromium-browser
printf "\n\n-- getting lsd" 
sudo pacman -S --noconfirm lsd || sudo snap install lsd


printf "\n\n\n--- Done!\n\n\n" 
printf "-! USE PREFIX+I TO INSTALL TMUX PLUGINS" 
printf "-! USE PREFIX+U TO UPDATE TMUX PLUGINS" 
