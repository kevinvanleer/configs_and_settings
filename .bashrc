export CLICOLOR=1
source ~/.bash-aliases
set -o vi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# export PS1="[\\u@\\h \\W]$ "

export PS1='\[\e[1;32m\]\h:\W \u\$\[\e[0m\] '
umask 002

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
# A new shell gets the history lines from all previous shells
#PROMPT_COMMAND='history -a'
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# Don't put duplicate lines in the history.
#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoredups:erasedups

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig":${PKG_CONFIG_PATH}

export PATH=${PATH}:${HOME}/scripts
