# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively load bash_profile to set up $PATH and
# other stuff before exiting.
if [ -z "$PS1" ] ; then
    . ~/.bash_profile
    return
fi

case $(uname) in
    Linux)
        # Turn off the bell for console
        setterm -blength 0

        # Turn off the bell for x
        #xset b off

        # TODO meter $XDG_DATA_* en bashrc
        ;;

    Darwin)
        # Tell the terminal about the working directory at each prompt.
        # From OS X 10.7 /etc/bashrc
        if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
            update_terminal_cwd() {
                # Identify the directory using a "file:" scheme URL,
                # including the host name to disambiguate local vs.
                # remote connections. Percent-escape spaces.
                local SEARCH=' '
                local REPLACE='%20'
                local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
                printf '\e]7;%s\a' "$PWD_URL"
            }
            PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
        fi
        #
        LSCOLORS=exgxfxdxcxegedabagacad
        export LSCOLORS
        ;;

    *)
        echo "Unknown OS $(uname)"
        ;;
esac

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

            # Changes in woring tree
            local porcelain=$(git status --porcelain)
            if echo "$porcelain" | grep -q '^.[MD]' ; then
                a="${a}*"
            fi

            # Changes added to index
            if echo "$porcelain" | grep -q '^[AMDRC]' ; then
                a="${a}+"
            fi

            # Untracked files
            if echo "$porcelain" | grep -q '^??' ; then
                a="${a}?"
            fi

            b=${b#refs/heads/}
            b=${b// }
            [[ -n "${r}${b}${a}" ]] && s="(g ${r:+${r}:}${b}${a:+ ${a}})"
        fi
    fi

    echo -n "$s"
}

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
blue="\[\e[0;34m\]"
cyan="\[\e[0;36m\]"
green="\[\e[0;32m\]"
no_color="\[\e[0m\]"
white="\[\e[0;37m\]"
yellow="\[\e[0;33m\]"

#PS1="$green\u@\h$no_color $yellow\w$white \$(svn_info)\$(git_info)\n\$$no_color "
PS1="$cyan\u@\h$no_color $blue\w$white \$(svn_info)\$(git_info)\n\$$no_color "
PS2="$white>$no_color "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"; history -a'
        ;;
    *)
        PROMPT_COMMAND='history -a'
        ;;
esac

# To use pip on the global environment
syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

[ -f /usr/local/bin/virtualenvwrapper.sh ] && . /usr/local/bin/virtualenvwrapper.sh

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

