set -o vi

source ~/.zalias

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vv=/Applications/Neovide.app/Contents/MacOS/neovide
export NEOVIDE_FRAMELESS=true
export NEOVIDE_FRAME=none

eval "$(starship init zsh)"

