# plugin manager
# https://github.com/zdharma/zinit
# source ~/.zinit/bin/zinit.zsh

# z - fast directory switching
. /usr/local/etc/profile.d/z.sh

# when no args are given to z, or z returns no results, use fzf
unalias z &> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --nth 2.. +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')" || exit 1
}

# prompt
eval "$(starship init zsh)"

foreach file (
  settings.zsh
  aliases.zsh
  exports.zsh
  fzf-widgets.zsh
  widgets.zsh
) {
  source $ZDOTDIR/config/$file
}
unset file

# Source the completions installed by homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
