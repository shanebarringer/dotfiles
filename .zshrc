# Path to oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

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
  ${ZSH}/plugins/osx
  ${ZSH}/plugins/gitfast 
  ${ZSH}/plugins/jsontools 
  ${ZSH}/plugins/node 
  ${ZSH}/plugins/safe-paste 
  ${ZSH}/plugins/npm 
  ${ZSH}/plugins/brew 
  ${ZSH_CUSTOM}/plugins/zsh-bash 
  ${ZSH_CUSTOM}/plugins/zsh-you-should-use
  ${ZSH_CUSTOM}/plugins/yadm-zsh
  ${ZSH_CUSTOM}/plugins/fast-syntax-highlighting 
  ${ZSH_CUSTOM}/plugins/zsh-256color 
  ${ZSH_CUSTOM}/plugins/cf
  ${ZSH_CUSTOM}/plugins/zsh-brew-services
  ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
"


###### HUB CONFIG #######
# Aliasing hub to git
eval "$(hub alias -s)"
###### END HUB CONFIG ######

# path to rbenv
export PATH="/usr/local/sbin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# sets up fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env --multi`

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

## npm

### npm ssl
alias npm-ssl-true='npm config set strict-ssl true && yarn config set strict-ssl true'
alias npm-ssl-false='npm config set strict-ssl false && yarn config set strict-ssl false'

### npm public
alias npm-public='npm config set registry https://registry.npmjs.org && npm login'

### npm work
alias npm-work='npm config set registry https://npm.artifactory.homedepot.com/artifactory/api/npm/npm/ && npm login && npm-ssl-false'

# updates PATH for the Google Cloud SDK.
if [ -f '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mxb5594/Downloads/google-cloud-sdk/path.zsh.inc'; fi