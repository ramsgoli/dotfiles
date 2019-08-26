#!/bin/bash

echo "============================"
echo " Ram Goli's startup script!"
echo "    Use at your own risk"
echo "============================"

currDir=$(pwd)

read -p "Installing homebrew. Press y to continue or any other key to skip. " ANS
if [[ $ANS = y ]]
then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "done"
fi

read -p "Installing neovim. Press y to continue or any other key to skip. " ANS
if [[ $ANS = y ]]
then
	brew install neovim
	echo "done"
fi

echo "Linking neovim's config file to ./init.vim..."
if [ -e ~/.config/nvim/init.vim ]
then
	read -p "Found an existing ~/.config/nvim/init.vim file. Would you like to override it? [y|n]" ANSWER
	if [ $ANSWER = y ]
	then
		rm ~/.config/nvim/init.vim
		ln -s ${currDir}/init.vim ~/.config/nvim/init.vim 
	fi
else
	mkdir -p ~/.config/nvim
	ln -s ${currDir}/init.vim ~/.config/nvim/init.vim 
fi
echo "done"

echo "Installing zsh and setting it to your default shell..."
brew install zsh zsh-completions
chsh -s /bin/zsh
echo "done"
echo "Installing oh-my-szh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "done"

PLUGINS=(
	https://github.com/unixorn/warhol.plugin.zsh.git
)
echo "Installing the following oh my zsh plugins: ${PLUGINS[@]}"
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/unixorn/warhol.plugin.zsh.git warhol
cd ${currDir}

echo "Linking zshrc..."
if [ -e ~/.zshrc ]
then
	read -p "Found an existing ~/.zshrc file. Would you like to override it? [y|n]" ANSWER
	if [ $ANSWER = y ]
	then
		rm ~/.zshrc
		ln -s ${currDir}/.zshrc ~/.zshrc
	fi
else
	ln -s ${currDir}/.zshrc ~/.zshrc
fi
echo "now sourcing it..."
source ~/.zshrc
echo "done"

echo "Installing NVM, a version manager for node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.zshrc

echo "Installing the latest version of node"
nvm install node

echo "Installing golang"
brew install go

echo "Installing neovim's plugins with PlugInstall..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
echo "done"


echo "Setting up your git credentials..."
read -p "Enter your name for git commits: " NAME
read -p "Enter your github email: " EMAIL

git config --global user.name "${NAME}"
git config --global user.email "${EMAIL}"

echo "We will install Git and the osxkeychain helper using homebrew"
brew install git
git config --global credential.helper osxkeychain

APPLICATIONS=(
	iterm2
	alfred
	spotify
	notion
	docker
)
echo "Installing the following applications: ${APPLICATIONS[@]}..."

for APP in "${APPLICATIONS[@]}"
do
	brew cask install "${APP}"
done

echo "================"
echo "    All Done!   "
echo "================"
