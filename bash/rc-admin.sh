# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Modify the PATH here. Maybe u'll ned to run
# something that it's not on the default PATH.
# Rewrite this checking for $HOME
if [ -d /sbin ] ; then
    PATH=/sbin:$PATH
fi

if [ -d /usr/sbin ] ; then
    PATH=/usr/sbin:$PATH
fi

if [ -d ~/bin ] ; then
    PATH=~/bin:$PATH
fi

export PATH

# for fink. Makes no sense for Linux but may be needed for
# OS X scripts.
if [ -f /sw/bin/init.sh ]; then
    . /sw/bin/init.sh
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# Make bash check its window size after a process completes.
# Updates LINES and COLUMNS if necessary.
shopt -s checkwinsize


if [ "`uname`" == "Linux" ] ; then
    # Turn off the bell for console
    setterm -blength 0

    # Turn off the bell for x
    #xset b off
else # It's Darwin
    # Pretty colors for ls output
    LSCOLORS=ExGxFxDxCxegedabagacad
    export LSCOLORS
fi


# don't put duplicate lines in the history. See bash(1) for more options
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth:erasedups

# For subversion
svn_info() {
    local s=
    if [[ -d ".svn" ]] ; then
        # add an s (for subversion) and revison number
        # add a star (*) if the are changes on a versioned file
        # add an exclamation (!) if a versionde file has disapered
        # add a plus (+) if there are unversioned files
        s="(s$(svn info 2>/dev/null |sed -n -e '/^Revisi[oó]n: \([0-9]*\).*$/s//\1/p')\
$(svn status 2>/dev/null |grep -q -v '^?' && echo -n "*")\
$(svn status 2>/dev/null |grep -q '^!' && echo -n "!")\
$(svn status 2>/dev/null |grep -q '^?' && echo -n "+")) "
    fi

    echo -n "$s"
}

# Color always on !!!!!
PS1="\[\e[1;31m\]\u@\h\[\e[0m\] \[\e[1;33m\]\w \[\e[1;37m\]\$(svn_info)\n$\[\e[0m\] "
PS2='\[\e[1;37m\]>\[\e[0m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
        ;;
    *) ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f ~/bash_completion ]; then
    . ~/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

