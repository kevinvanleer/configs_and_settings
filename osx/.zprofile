

##
# Your previous /Users/kvl/.bash_profile file was backed up as /Users/kvl/.bash_profile.macports-saved_2015-01-22_at_14:44:38
##

# MacPorts Installer addition on 2015-01-22_at_14:44:38: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/usr/local/opt/ruby/bin:/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/kvl/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kvl/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/kvl/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kvl/google-cloud-sdk/completion.bash.inc'; fi

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
#export PATH="$HOME/.cargo/bin:$PATH"

if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi
