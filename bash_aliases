#~/.bash_aliases

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
#        alias eclipse='/opt/eclipse/eclipse'
#        alias tilda_conf='tilda -C'
    fi
fi

alias su='su -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'
alias grep='grep --color'
alias python='python -t'

#alias gcc='gcc -ansi -g -Wall'

#alias mplayer_tiny='mplayer -lavdopts lowres=1'
#alias mplayer_slow='mplayer -lavdopts lowres=1:fast:skiploopfilter=all'
#alias mplayer_slow='mplayer -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all'
#alias mplayer_zoom='mplayer -zoom'

