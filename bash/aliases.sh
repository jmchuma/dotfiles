#~/.bash_aliases

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable color output for cetain commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ "$TERM" != "dumb" ]; then
    if [ "`uname`" == "Darwin" ]; then
        alias ls='ls -AFGh'
        alias mytop='top -o cpu -O rsize'
        alias topCPU='top -o cpu'
        alias topRM='top -o rsize'
        alias topVM='top -o vsize'
        alias Preview='open -a Preview'
        alias VLC='open -a VLC'
        alias 0xED='open -a 0xED'
        alias TextEdit='open -a TextEdit'
        alias Firefox='open -a Firefox'
    elif [ "`uname`" == "Linux" ]; then
        alias ls='ls -AFh --color=auto'
        alias pstree='pstree -ca'
    fi
fi

#commom
alias su='su -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'
alias grep='grep --color=auto'
alias python='python -t'

#alias gcc='gcc -ansi -g -Wall'

#alias mplayer_tiny='mplayer -lavdopts lowres=1'
#alias mplayer_slow='mplayer -lavdopts lowres=1:fast:skiploopfilter=all'
#alias mplayer_slow='mplayer -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all'
#alias mplayer_zoom='mplayer -zoom'

