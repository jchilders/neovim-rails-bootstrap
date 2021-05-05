# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/.asdfrc"
export ASDF_DATA_DIR="$HOME/.local/share/asdf"
export FZF_DEFAULT_OPTS="--height 30% --layout=reverse --border --tiebreak=end --info=inline --select-1"
export FZF_DEFAULT_COMMAND="fd"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"
export MANPAGER='nvim +Man!'

export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include -I/usr/local/opt/openssl@1.1/include"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
