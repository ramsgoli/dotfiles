#!/bin/bash

echo "============================"
echo " Ram Goli's startup script!"
echo "    Use at your own risk"
echo "============================"

currDir=$(pwd)

# check if Homebrew installed
echo "Checking if Homebrew is installed..."
which -s brew
if [[ $? != 0 ]]; then
  echo "Homebrew not found. Installing..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Found Homebrew."
fi

echo "Checking if Neovim is installed..."
which -s nvim
if [[ $? != 0 ]]; then
  echo "Neovim not found. Installing..."
	brew install neovim
else
  echo "Found Neovim."
fi

echo "Linking Neovim config file..."
if [[ -d ~/.config/nvim ]]
then
	read -p "Found an existing Neovim config at ~/.config/nvim. Would you like to override it? [y|n]" ANSWER
	if [[ $ANSWER = y ]]
	then
		rm -rf ~/.config/nvim
		ln -s ${currDir} ~/.config/nvim
	fi
else
	mkdir -p ~/.config/nvim
	ln -s ${currDir} ~/.config/nvim
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

echo "Now installing a couple more packages with brew"

PACKAGES=(
	fzf
	ripgrep
	firebase-cli
	docker
	hugo
)

for package in "${PACKAGES[@]}"
do
	brew install "${package}"
done

echo Installing useful key bindings and fuzzy completion for fzf
$(brew --prefix)/opt/fzf/install
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

echo "================"
echo "    All Done!   "
echo "================"
