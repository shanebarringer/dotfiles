eval "$(rbenv init -)"
# export PATH="/usr/local/sbin:$PATH"

export SHELL=/bin/zsh
[ -z "$ZSH_VERSION" ] && exec /bin/zsh -l


# We can also use which to get the dynamic path of zsh which relies on the value of $PATH:
#
# export SHELL=`which zsh`
# [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
