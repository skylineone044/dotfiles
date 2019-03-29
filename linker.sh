#!/usr/bin/sh
echo Started linker script...

echo linking vim...
ln -s ~/git/dotfiles/vim/.vim ~/.vim
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

echo linking tmux...
ln -s ~/git/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo linking zsh...
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh

echo linking latte layout...
ln -s ~/git/dotfiles/latte ~/.config/latte

