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
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo cp .zshrc.pre-oh-my-zsh .zshrc
sudo chown -R ${USER} .oh-my-zsh .zsh*   

echo "Changing Shell to ZSH"
chsh -s $(which zsh)

# install current node versions
echo "Installing nvm and latest version of node"
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node
nvm use node

# Set macOS preferences
# We will run this last because this will reload the shell
echo "Updating macOS settings"
source .macos
