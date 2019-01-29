# Path to oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# zsh-nvm settings
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# theme
ZSH_THEME="miloshadzic"

# show waiting dots
COMPLETION_WAITING_DOTS="true"

#### User configuration ####
# set source
source $ZSH/oh-my-zsh.sh

# Sets up antibody
## Load antibody
source <(antibody init)

## set antibody home
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"


## bundle plugins using antibody
antibody bundle "
  ${ZSH} path:plugins/osx 
  ${ZSH} path:plugins/gitfast 
  ${ZSH} path:plugins/jsontools 
  ${ZSH} path:plugins/node 
  ${ZSH} path:plugins/safe-paste 
  ${ZSH} path:plugins/npm 
  ${ZSH} path:plugins/brew 
  ${ZSH_CUSTOM}/plugins/zsh-nvm
  ${ZSH_CUSTOM}/plugins/zsh-bash 
  ${ZSH_CUSTOM}/plugins/zsh-you-should-use
  ${ZSH_CUSTOM}/plugins/yadm-zsh
  ${ZSH_CUSTOM}/plugins/fast-syntax-highlighting 
  ${ZSH_CUSTOM}/plugins/zsh-256color 
  ${ZSH_CUSTOM}/plugins/cf
  ${ZSH_CUSTOM}/plugins/zsh-brew-services
"


###### HUB CONFIG #######
# Aliasing hub to git
eval "$(hub alias -s)"
###### END HUB CONFIG ######

# path to rbenv
export PATH="/usr/local/sbin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# path to nvm
export NVM_DIR="/Users/${USER}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


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

# Exports `go/bin` in order to use go packages
export PATH="$PATH:$GOPATH/bin"


# Aliases
## GitHub personal
alias gitmeHome='git config user.email shane.barringer@outlook.com'
## GitHub work
alias gitmeWork='git config user.email shane_barringer@homedepot.com'
## npm public
alias npm-public='npm config set registry https://registry.npmjs.org && npm login'
## npm work
alias npm-work='npm config set registry https://npm.artifactory.homedepot.com/artifactory/api/npm/npm/ && npm login'

# loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  \

# updates PATH for the Google Cloud SDK.
if [ -f '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc'; fi

