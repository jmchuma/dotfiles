#~/.bash_aliases

if [ "$TERM" != "dumb" ]; then
    if [ "`uname`" == "Darwin" ]; then
        alias ls='ls -AFG'
    elif [ "`uname`" == "Linux" ]; then
        alias ls='ls -Ah --color=auto'
        #alias ifconfig='sudo /sbin/ifconfig'
        #alias ifup='sudo /sbin/ifup'
        #alias ifdown='sudo /sbin/ifdown'
        #alias iwconfig='sudo iwconfig'
        #alias iwlist='sudo iwlist'

        alias install='sudo aptitude -R install'
        alias purge='sudo aptitude --purge-unused purge'
        #alias aptitude='sudo aptitude'

        #alias apt-cache='sudo apt-cache'
        #alias apt-get='sudo apt-get'
        #alias dpkg='sudo dpkg'
        #alias gdebi='sudo gdebi'
        #alias gdebi-gtk='sudo gdebi-gtk'
        #alias pecl='sudo pecl'
        #alias pear='sudo pear'
        alias pstree='pstree -ca'
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'
alias grep='grep --color'

#alias su='su -l'
alias su='su -s'

