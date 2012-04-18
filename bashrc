# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Modify the PATH here. Maybe u'll ned to run
# something that it's not on the default PATH.
# Rewrite this checking for $HOME
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
    export PATH
elif [ -d ~/Applications/bin ] ; then
    PATH=~/Applications/bin:"${PATH}"
    export PATH
fi

# For fink. This goes here because it modifies $PATH
if [ -f /sw/bin/init.sh ]; then
    . /sw/bin/init.sh
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ "`uname`" == "Linux" ] ; then
    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return
    # Make bash check its window size after a process completes.
    # Updates LINES and COLUMNS if necessary.
    shopt -s checkwinsize

    # Turn off the bell for console
    setterm -blength 0

    # Turn off the bell for x
    #xset b off

    # TODO meter $XDG_DATA_* en bashrc
else # for the time being if only Linux or Darwin for me
    # This is here so I won't need to populate
    # the default instalation of Python with crap
    #if [ -d ~/local/python ] ; then
    #   PYTHONPATH=~/local/python:"${PYTHONPATH}"
    #   export PYTHONPATH
    #elif [ -d ~/Applications/Python ] ; then
    #   PYTHONPATH="${PYTHONPATH}":~/Applications/Python
    #   export PYTHONPATH
    #fi

    # Turn off the bell for console
    #setterm -blength 0

    # Turn off the bell for x
    #xset b off

    # LSCOLORS
    # a :: black
    # b :: red
    # c :: green
    # d :: brown
    # e :: blue
    # f :: magenta
    # g :: cyan
    # h :: light grey
    # A :: bold black, usually shows up as dark grey
    # B :: bold red
    # C :: bold green
    # D :: bold brown, usually shows up as yellow
    # E :: bold blue
    # F :: bold magenta
    # G :: bold cyan
    # H :: bold light grey; looks like bright white
    # x :: default foreground or background
    #
    # Note that the above are standard ANSI colors.  The actual display may differ depending on the
    # color capabilities of the terminal in use. The order of the attributes are as follows:
    # 1.   directory
    # 2.   symbolic link
    # 3.   socket
    # 4.   pipe
    # 5.   executable
    # 6.   block special
    # 7.   character special
    # 8.   executable with setuid bit set
    # 9.   executable with setgid bit set
    # 10.  directory writable to others, with sticky bit
    # 11.  directory writable to others, without sticky bit
    #
    # The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default background for regular
    # directories, black foreground and red back-ground for setuid executables, etc.
    LSCOLORS=ExGxFxDxCxegedabagacad
    export LSCOLORS
fi # end of Darwin stuff

##### COMMON STUFF ####

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# see "help shopt" for more info
# makes BASH append rather than overwrite history on disk
shopt -s histappend
# Make bash check its window size after a process completes.
# Updates LINES and COLUMNS if necessary.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# For git
git_info() {
    local s=

    #if [[ -d ".git" ]] ; then
    git status &> /dev/null
    # git is buggy and instead of 0 when successful it returns1
    # change this whenever it's fixed
    #if [[ $? == 0 ]] ; then
    if [[ $? == 0 || $? == 1 ]] ; then
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
bzr_info() {
    local s=
    if [[ -d ".bzr" ]] ; then
#        bzr info -v
        #s="(BZR $(bzr status 2>/dev/null |grep -q -v '^(unknown:|added:)' && echo -n "*")\
        s="(BZR $(bzr status 2>/dev/null |grep -q 'modified' && echo -n "*")\
$(bzr status 2>/dev/null |grep -q 'added:' && echo -n "+")\
$(bzr status 2>/dev/null |grep -q 'removed:' && echo -n "-")\
$(bzr status 2>/dev/null |grep -q 'unknown:' && echo -n "?")\
$(bzr status 2>/dev/null |grep -q '^!' && echo -n "!")) "

        echo -n "$s"
    fi
}

# For mercurial
#hg_info() {
#    local s=
#
#    if [[ -d ".hg" ]] ; then
#
#    fi
#
#    echo -n "$s"
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

        # get the revision number
        #local r=$(svn info 2>/dev/null |sed -n -e '/^Revision: \([0-9]*\).*$/s//\1/p' )
        # add a star if something has changed
        #s="s$r$(svn status 2>/dev/null |grep -q -v '^?' && echo -n "*" )"
        # add a plus if something was added
        #s="($s$(svn status 2>/dev/null |grep -q '^?' && echo -n "+" )) "

        echo -n "$s"
    fi

}
# Para que muestre info de svn en el promt
# TODO review this to see if there something useful
#ps_scm_f() {
#    local s=
#        if [[ -d ".svn" ]] ; then
#        local r=$(svn info | sed -n -e '/^Revision: \([0-9]*\).*$/s//\1/p' )
#        s="(r$r$(svn status | grep -q -v '^?' && echo -n "*" ))"
#    else
#            local d=$(git rev-parse --git-dir 2>/dev/null ) b= r= a=
#            if [[ -n "${d}" ]] ; then
#                if [[ -d "${d}/../.dotest" ]] ; then
#                if [[ -f "${d}/../.dotest/rebase" ]] ; then
#                    r="rebase"
#                    elif [[ -f "${d}/../.dotest/applying" ]] ; then
#                        r="am"
#                else
#                    r="???"
#                    fi
#                    b=$(git symbolic-ref HEAD 2>/dev/null )
#                elif [[ -f "${d}/.dotest-merge/interactive" ]] ; then
#                r="rebase-i"
#                b=$(<${d}/.dotest-merge/head-name)
#            elif [[ -d "${d}/../.dotest-merge" ]] ; then
#                    r="rebase-m"
#                    b=$(<${d}/.dotest-merge/head-name)
#                elif [[ -f "${d}/MERGE_HEAD" ]] ; then
#                r="merge"
#                b=$(git symbolic-ref HEAD 2>/dev/null )
#            elif [[ -f "${d}/BISECT_LOG" ]] ; then
#                    r="bisect"
#                    b=$(git symbolic-ref HEAD 2>/dev/null )"???"
#                else
#                r=""
#                b=$(git symbolic-ref HEAD 2>/dev/null )
#            fi
#
#                if git status | grep -q '^# Changed but not updated:' ; then
#                a="${a}*"
#            fi
#
#                if git status | grep -q '^# Changes to be committed:' ; then
#                a="${a}+"
#            fi
#
#                if git status | grep -q '^# Untracked files:' ; then
#                a="${a}?"
#            fi
#
#                b=${b#refs/heads/}
#            b=${b// }
#                [[ -n "${r}${b}${a}" ]] && s="(${r:+${r}:}${b}${a:+ ${a}})"
#        fi
#    fi
#        s="${s}${ACTIVE_COMPILER}"
#    s="${s:+${s} }"
#        echo -n "$s"
#}

# working copy info
# TODO use this to check if which VCS are used and call the apropiate functions
wc_info() {
    local s=

    echo -n "$s"
}

# Color always on !!!!!
PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;33m\]\w\[\e[1;37m\] \$(svn_info)\$(bzr_info)\$(git_info)\n$\[\e[0m\] "
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

