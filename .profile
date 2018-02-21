eval "$(rbenv init -)"
# export PATH="/usr/local/sbin:$PATH"

export SHELL=/bin/zsh
[ -z "$ZSH_VERSION" ] && exec /bin/zsh -l


# We can also use which to get the dynamic path of zsh which relies on the value of $PATH:
#
# export SHELL=`which zsh`
# [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

# Setting PATH for Python 3.6
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
