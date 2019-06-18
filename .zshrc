# Path to oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# theme
ZSH_THEME="miloshadzic"

# show waiting dots
COMPLETION_WAITING_DOTS="true"

#### User configuration ####

# source oh-my-zsh config
source $ZSH/oh-my-zsh.sh


## Turn off oh-my-zsh updates, let antibody handle them instead
DISABLE_AUTO_UPDATE=true

# Sets up antibody

## define custom plugin directory
export ZSH_CUSTOM=/Users/${USER}/.oh-my-zsh/custom

## bundle plugins using antibody
antibody bundle "
  ${ZSH}/plugins/osx
  ${ZSH}/plugins/git
  ${ZSH}/plugins/gitfast 
  ${ZSH}/plugins/jsontools 
  ${ZSH}/plugins/node 
  ${ZSH}/plugins/safe-paste 
  ${ZSH}/plugins/npm 
  ${ZSH}/plugins/brew
  ${ZSH}/plugins/golang
  ${ZSH_CUSTOM}/plugins/zsh-bash 
  ${ZSH_CUSTOM}/plugins/zsh-you-should-use
  ${ZSH_CUSTOM}/plugins/yadm-zsh
  ${ZSH_CUSTOM}/plugins/fast-syntax-highlighting 
  ${ZSH_CUSTOM}/plugins/zsh-256color 
  ${ZSH_CUSTOM}/plugins/cf
  ${ZSH_CUSTOM}/plugins/zsh-brew-services
  ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ${ZSH_CUSTOM}/plugins/buffalo
" > ~/.zsh_plugins.sh

source ~/.zsh_plugins.sh

# path to rbenv
export PATH="/usr/local/sbin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# sets up Fast Node Manager (fnm)
export PATH=$HOME/.fnm:$PATH
eval `fnm env --multi`

# sets up magnificent console correction app
eval $(thefuck --alias)

# adds selenium webdriver to path
export PATH="$PATH:/Users/${USER}/webdrivers"
export PATH="/usr/local/sbin:$PATH"

# ugggg... Mongo...
export PATH="/data/db/bin:$PATH"

# python3 & pipenv
export PATH="$PATH:/Users/${USER}/Library/Python/3.6/bin"

# python 2
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# Go
export GOPATH=~/go
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

## Exports `go/bin` in order to use go packages
export PATH="$PATH:$GOPATH/bin"

# Enable zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# updates PATH for the Google Cloud SDK
if [ -f '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# Sets up Github Host as default for work purposes
export GITHUB_HOST=github.homedepot.com

# Aliases
## Aliasing hub to git
eval "$(hub alias -s)"

## GitHub personal
alias gitmeHome='git config user.email shane.barringer@outlook.com'
alias homeHost='GITHUB_HOST=github.com'
## GitHub work
alias gitmeWork='git config user.email shane_barringer@homedepot.com'
alias workHost='GITHUB_HOST=github.homedepot.com'

## npm
### npm ssl
alias npm-ssl-true='npm config set strict-ssl true && yarn config set strict-ssl true'
alias npm-ssl-false='npm config set strict-ssl false && yarn config set strict-ssl false'

### npm public
alias npm-public='npm config set registry https://registry.npmjs.org && npm login'

### npm work
alias npm-work='npm config set registry https://npm.artifactory.homedepot.com/artifactory/api/npm/npm/ && npm login && npm-ssl-false'

## typora
alias typora="open -a typora"

## show/hide files hidden files in macOS
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"