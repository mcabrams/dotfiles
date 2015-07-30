node_dir=./node
export PATH=/usr/local/bin:$PATH
export LC_CTYPE="utf-8" #http://stackoverflow.com/questions/4975973/gem-update-unable-to-convert-xe7-to-utf-8-in-conversion-from-ascii-8bit-to-u
# export HISTFILE=~/.bash-history-${ITERM_SESSION_ID} #http://code.google.com/p/iterm2/issues/detail?id=1183

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.aliases" ]]         && source "$HOME/.aliases"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
export PATH="$node_dir/bin":$PATH