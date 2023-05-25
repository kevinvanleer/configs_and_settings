set -o vi

source ~/.zalias

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/scripts:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Flutter -- copied from bashrc
export PATH=$PATH:$HOME/Library/flutter/bin

# Created by `pipx` on 2022-07-26 13:23:20
# Copied from .bashrc
export PATH="$PATH:/Users/kvl/.local/bin"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Rust packages
export PATH="$HOME/.cargo/bin:$PATH"

# Dart packages
export PATH="$PATH":"$HOME/.pub-cache/bin"

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vv=/Applications/Neovide.app/Contents/MacOS/neovide
export NEOVIDE_FRAMELESS=true
export NEOVIDE_FRAME=none

eval "$(starship init zsh)"

