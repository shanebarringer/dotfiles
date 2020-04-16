#!/bin/sh

echo "Setting up Machine..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update


# Install all our dependencies with bundle (See Brewfile)
echo "Installing homebrew packages"
brew tap TheLocehiliosan/yadm
brew install git yadm
brew tap homebrew/bundle
brew install getantibody/tap/antibody
brew bundle

# Make ZSH the default shell environment
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo cp .zshrc.pre-oh-my-zsh .zshrc
sudo chown -R ${USER} .oh-my-zsh .zsh*   

echo "Changing Shell to ZSH"
chsh -s $(which zsh)

# Setup antibody and add custom plugins
mkdir ~/Library/antibody

export ANTIBODY_HOME=~/Library/antibody
export ZSH_CUSTOM=/Users/${USER}/.oh-my-zsh/custom

git clone https://github.com/chrissicool/zsh-bash $ZSH_CUSTOM/plugins/zsh-bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/zsh-you-should-use
git clone https://github.com/chrissicool/zsh-256color $ZSH_CUSTOM/plugins/zsh-256color
git clone https://github.com/1995parham/buffalo.zsh ~/.oh-my-zsh/custom/plugins/buffalo
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
