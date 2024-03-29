#alias vi="vim"
#alias vi="vim"
#alias vim="xterm -name xterm-edit -e vim"
#alias gdb="xterm -name xterm-edit -e gdb"
#alias e="vi"
#alias ls="ls --color=tty"
alias ll="ls -lH"
alias la="ls -a"
alias ssh="ssh -X"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias cmake_debug='cmake -DBUILD_SHARED_LIBS="ON" -DCMAKE_BUILD_TYPE="Debug" ..'
alias cmake_release='cmake -DBUILD_SHARED_LIBS="OFF" -DCMAKE_BUILD_TYPE="Release" ..'
alias tcpdump='sudo tcpdump'
alias cgrep='grep -R --exclude-dir=.svn --include=*.cpp --include=*.h'

alias preview='open /Applications/Preview.app'
alias conduce='/opt/mct/sluice/bin/sluice-run -r -D'
alias condev='./condev'
