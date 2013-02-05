# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Android stuff
if [ -d ~/Applications/android-sdk ] ; then
    PATH=~/Applications/android-sdk/platform-tools:~/Applications/android-sdk/tools:"${PATH}"
fi


# rbenv goodies
if [ -d ~/.rbenv ]; then
    PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi

if [ "`uname`" == "Linux" ] ; then
    # Turn off the bell for console
    setterm -blength 0

    # Turn off the bell for x
    #xset b off

    # TODO meter $XDG_DATA_* en bashrc
else # Darwin stuff
    #
    LSCOLORS=ExGxFxDxCxegedabagacad
    export LSCOLORS

    # MacTex goodies
    if [ -d /usr/texbin ] ; then
        PATH=/usr/texbin:"${PATH}"
    fi

    # Hombrew goodies
    PATH="/usr/local/bin:${PATH}"
    . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ignore lines starting with whitespace
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="&:[bf]g:cd:cd ..:clear:exit:ls:make:pwd:vim"

# see "help shopt" and shopt section in bash(1) for more info
# Check window size after a process completes. Update LINES and COLUMNS if necessary.
shopt -s checkwinsize
# makes BASH append rather than overwrite history on disk
shopt -s histappend

# avoids clobberting http://en.wikipedia.org/wiki/Clobbering
# Use use the >| operator to ignore the noclobber.
set -o noclobber

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# For git
git_info() {
    local s=

    git status &> /dev/null

    if [[ $? == 0 ]] ; then
        local d=$(git rev-parse --git-dir 2>/dev/null ) b= r= a=
        if [[ -n "${d}" ]] ; then
            if [[ -d "${d}/../.dotest" ]] ; then
                if [[ -f "${d}/../.dotest/rebase" ]] ; then
                    r="rebase"
                elif [[ -f "${d}/../.dotest/applying" ]] ; then
                    r="am"
                else
                    r="???"
                fi
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/.dotest-merge/interactive" ]] ; then
                r="rebase-i"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -d "${d}/../.dotest-merge" ]] ; then
                r="rebase-m"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -f "${d}/MERGE_HEAD" ]] ; then
                r="merge"
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/BISECT_LOG" ]] ; then
                    r="bisect"
                    b=$(git symbolic-ref HEAD 2>/dev/null )"???"
            else
                r=""
                b=$(git symbolic-ref HEAD 2>/dev/null )
            fi

            if git status | grep -q '^# Changed but not updated:' ; then
                a="${a}*"
            fi

            if git status | grep -q '^# Changes not staged for commit:' ; then
                a="${a}*"
            fi

            if git status | grep -q '^# Changes to be committed:' ; then
                a="${a}+"
            fi

            if git status | grep -q '^# Untracked files:' ; then
                a="${a}?"
            fi

            b=${b#refs/heads/}
            b=${b// }
            [[ -n "${r}${b}${a}" ]] && s="(g ${r:+${r}:}${b}${a:+ ${a}})"
        fi
    fi

    echo -n "$s"
}

# For bazaar
#bzr_info() {
#    local s=
#    if [[ -d ".bzr" ]] ; then
##        bzr info -v
#        #s="(BZR $(bzr status 2>/dev/null |grep -q -v '^(unknown:|added:)' && echo -n "*")\
#        s="(BZR $(bzr status 2>/dev/null |grep -q 'modified' && echo -n "*")\
#$(bzr status 2>/dev/null |grep -q 'added:' && echo -n "+")\
#$(bzr status 2>/dev/null |grep -q 'removed:' && echo -n "-")\
#$(bzr status 2>/dev/null |grep -q 'unknown:' && echo -n "?")\
#$(bzr status 2>/dev/null |grep -q '^!' && echo -n "!")) "
#
#        echo -n "$s"
#    fi
#}

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

        echo -n "$s"
    fi
}

# working copy info
# TODO use this to check if which VCS are used and call the apropiate functions
wc_info() {
    local s=

    echo -n "$s"
}

# Color always on !!!!!
PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;33m\]\w\[\e[1;37m\] \$(svn_info)\$(git_info)\n$\[\e[0m\] "
PS2='\[\e[1;37m\]>\[\e[0m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"; history -a'
        ;;
    *)
        PROMPT_COMMAND='history -a'
        ;;
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

