# Path to oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# theme
ZSH_THEME="miloshadzic"

# show waiting dots
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git git-extras heroku rails web-search ruby rbenv rake github osx colorize see gitfast history jsontools node osx web-search safe-paste npm zsh-bash asciidoctor you-should-use yadm zsh-syntax-highlighting vscode mysql-colorize fast-syntax-highlighting zsh-autosuggestions zsh-256color fly cf brew zsh-brew-services)

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
export NVM_DIR="/Users/${USER}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# check for local node version ()
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# adds selenium webdriver to path
export PATH="$PATH:/Users/${USER}/webdrivers"
export PATH="/usr/local/sbin:$PATH"

# ugggg... Mongo...
export PATH="/data/db/bin:$PATH"

# python3 & pipenv
export PATH="$PATH:/Users/${USER}/Library/Python/3.6/bin"

# python 2
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# Aliases
## GitHub personal
alias gitmeHome='git config user.email shane.barringer@outlook.com'

## GitHub work
alias gitmeWork='git config user.email shane_barringer@homedepot.com'

## npm public
alias npm-public='npm config set registry https://registry.npmjs.org && npm login'

## npm work
alias npm-work='npm config set registry https://npm.artifactory.homedepot.com/artifactory/api/npm/npm/ && npm login'

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
