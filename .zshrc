# Path to your oh-my-zsh installation.
export ZSH=/Users/shane/.oh-my-zsh

# theme
ZSH_THEME="miloshadzic"

# show waiting dots
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git git-extras heroku rails web-search ruby rbenv rake github osx colorize see gitfast history jsontools node osx web-search safe-paste npm zsh-bash)

#### User configuration ####

# set source
source $ZSH/oh-my-zsh.sh

###### HUB CONFIG #######

# Aliasing hub to git
eval "$(hub alias -s)"

###### END HUB CONFIG ######

# path to rbenv
export PATH="/usr/local/sbin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# path to nvm
export NVM_DIR="/Users/shane/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# adds selenium webdriver to path
export PATH="$PATH:/Users/shane/webdrivers"
export PATH="/usr/local/sbin:$PATH"

# ugggg... Mongo...
export PATH="/data/db/bin:$PATH"

# Aliases

## GitHub personal
alias gitmeHome='git config user.email shane.barringer@outlook.com'

## GitHub work
alias gitmeWork='git config user.email shane_barringer@homedepot.com'
