export CLICOLOR=1
source ~/.bash-aliases

# export PS1="[\\u@\\h \\W]$ "

umask 002

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
# A new shell gets the history lines from all previous shells
#PROMPT_COMMAND='history -a'
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# Don't put duplicate lines in the history.
#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoredups:erasedups
