#!/bin/bash

echo "============================"
echo " Ram Goli's startup script!"
echo "    Use at your own risk"
echo "============================"

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "done"

echo "Installing neovim..."
brew install neovim
echo "done"

echo "Linking neovim's config file to ./init.vim..."
ln -s ./init.vim ~/.config/nvim/init.vim 
echo "done"

echo "Installing neovim's plugins with PlugInstall..."
nvim --headless +PlugInstall +qa
echo "done"

echo "Installing zsh and setting it to your default shell..."
brew install zsh zsh-completions
chsh -s /bin/zsh
echo "done"

echo "Linking zshrc..."
ln -s ./zshrc ~/.zshrc
echo "done"
