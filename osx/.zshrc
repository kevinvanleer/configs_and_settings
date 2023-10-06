set -o vi

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kvl/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kvl/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kvl/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kvl/tools/google-cloud-sdk/completion.zsh.inc'; fi
