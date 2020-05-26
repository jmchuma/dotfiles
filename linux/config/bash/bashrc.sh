# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
## If not running interactively load bash_profile to set up $PATH and
## other stuff before exiting.
case $- in
    *i*) ;;
      *) return;;
# TODO rethink this, it may cause a loop since .bash_profile
# would prbably source .bashrc
#      *) . ~/.bash_profile
#          return;;
esac

# For git
git_info() {
    git status &> /dev/null

    if [[ $? == 0 ]] ; then
        echo -n "[git]"
    fi
}

# Turn off the bell for console
setterm -blength 0

# Turn off the bell for x
#xset b off

# Don't put duplicate lines in the history.
# Ignore lines starting with whitespace.
# See bash(1) for more options.
# export is only needed in .bash_profile, .bash_login and .profile since
# those are read only at login time. export makes the variable available
# to the forked processes.
#export HISTCONTROL="ignoreboth:erasedups"
HISTCONTROL="ignoreboth:erasedups"
# TODO review is I shold also ignore…
#export HISTIGNORE="&:[bf]g:cp:git diff:git status:ls:make:mv"
HISTIGNORE="*apt list *":cd:"cd ":"cd ..":clear:clea:exir:exit:"firefox*":free:"free -h":help:"help *":history:"history *":ls:"ls -l":lsblk:"lsblk *":man:"man *":ps:"ps aux":pwd:ranger:"rm -f *":"rm -drf *":"*shutdown*":vim:startx
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100
HISTFILESIZE=2000

# see "help shopt" and shopt section in bash(1) for more info
# makes BASH append rather than overwrite history on disk
shopt -s histappend

# Check window size after a process completes. Update LINES and COLUMNS
# if necessary.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# avoids clobberting http://en.wikipedia.org/wiki/Clobbering
# Use use the >| operator to ignore the noclobber.
set -o noclobber

# make less more friendly for non-text input files, see lesspipe(1)
# TODO what's the difference?
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h \[\e[01;34m\]\w\[\e[0m\] $(git_info)\n\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w $(git_info)\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
# TODO which one should I use?
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"; history -a'
        ;;
    *)
        PROMPT_COMMAND='history -a'
        ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# TODO which one should I use?
## START OLD_CODE
# I think this was becuase of OS X
#if [ -f ~/bash_completion ]; then
#    . ~/bash_completion
#elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi
## END OLD_CODE
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

