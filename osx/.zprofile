
# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/kvl/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kvl/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/kvl/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kvl/google-cloud-sdk/completion.bash.inc'; fi

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi
