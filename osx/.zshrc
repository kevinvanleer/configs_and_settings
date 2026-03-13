#set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Reduce ESC key delay from 0.4s to 0.01s
export KEYTIMEOUT=1



source ~/.zalias

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

# Fix for vi-mode prompt jumping
zle-keymap-select() {
    STARSHIP_KEYMAP=$KEYMAP
    zle reset-prompt
}
zle -N zle-keymap-select

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kvl/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kvl/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kvl/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kvl/tools/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export AWS_DEFAULT_PROFILE=AdministratorAccess-067245055136
export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kvl/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# bun completions
[ -s "/Users/kvl/.bun/_bun" ] && source "/Users/kvl/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# direnv hook for directory-specific environments
eval "$(direnv hook zsh)"
