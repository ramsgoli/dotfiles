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
if [ -e ~/.config/nvim/init.vim ] then
	read -p "Found an existing ~/.config/nvim/init.vim file. Would you like to override it? [y|n]" ANSWER
	if [ $ANSWER = (y|Y) ] then
		rm ~/.config/nvim/init.vim
		ln -s ./init.vim ~/.config/nvim/init.vim 
	fi
else
	ln -s ./init.vim ~/.config/nvim/init.vim 
echo "done"

echo "Installing neovim's plugins with PlugInstall..."
nvim --headless +PlugInstall +qa
echo "done"

echo "Installing zsh and setting it to your default shell..."
brew install zsh zsh-completions
chsh -s /bin/zsh
echo "done"

echo "Installing oh-my-szh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "done"

echo "Linking zshrc..."
if [ -e ~/.zshrc ] then
	read -p "Found an existing ~/.zshrc file. Would you like to override it? [y|n]" ANSWER
	if [ $ANSWER = (y|Y) ] then
		rm ~/.zshrc
		ln -s ./zshrc ~/.zshrc
	fi
else
	ln -s ./zshrc ~/.zshrc
echo "done"

echo "Setting up your git credentials..."
read -p "Enter your name for git commits" NAME
read -p "Enter your github email" EMAIL

git config --gloal user.name "${NAME}"
git config --global user.email "${EMAIL}"

echo "We will install Git and the osxkeychain helper using homebrew"
brew install git
git config --global credential.helper oxskeychain

APPLICATIONS=(
	iterm2
	alfred
	spotify
	notion
	docker
)
echo "Installing the following applications: ${APPLICATIONS[@]} in parallel..."

echo "${APPLICATIONS[@]}" | xargs -n 1 -P 2 brew cask install

echo "================"
echo "    All Done!   "
echo "================"
