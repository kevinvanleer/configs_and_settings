eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"

export PATH=$PATH:$HOME/tools/flutter/bin

# Created by `pipx` on 2022-07-26 13:23:20
# Copied from .bashrc
export PATH="$PATH:/Users/kvl/.local/bin"
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

#Rust packages
export PATH="$HOME/.cargo/bin:$PATH"

# Dart packages
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
