export XDG_DATA_HOME="$HOME/.local/share"

export JC_DOTFILES_HOME="$HOME/workspace/dotfiles"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:$JC_DOTFILES_HOME/scripts"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

# export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"

export FZF_DEFAULT_OPTS="--height 30% --border --tiebreak=index --info=inline --select-1"
export FZF_DEFAULT_COMMAND="fd"

export MANPAGER='nvim +Man!'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
