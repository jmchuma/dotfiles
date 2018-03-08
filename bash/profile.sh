# ~/.bash_profile: executed by bash for login shells.

#umask 0026
## Because of my external hdd. There might be a way to do this better but…
umask 0022

if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Android stuff
if [ -d ~/rootdir/android ] ; then
    PATH=~/rootdir/android/platform-tools:~/rootdir/android/tools:"${PATH}"
fi

# rbenv goodies
if [ -d ~/.rbenv ]; then
    PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi

if [ "`uname`" == "Linux" ] ; then
    # texlive manual installation
    if [ -d /usr/local/texlive/2012/bin/i386-linux ] ; then
        PATH=/usr/local/texlive/2012/bin/i386-linux:"${PATH}"
        MANPATH="${MANPATH}":/usr/local/texlive/2012/texmf/doc/man
        INFOPATH="${INFOPATH}":/usr/local/texlive/2012/texmf/doc/info
    fi
else # Darwin stuff
    # I need this for Gradle, since Google decided to drop suppor for 10.7 and
    # release adb for 10.8 or newer.
    export JAVA_HOME=$(/usr/libexec/java_home)
    if [ -d ~/rootdir/gradle ] ; then
        PATH=~/rootdir/gradle/bin:"${PATH}"
    fi

    # BasicTex goodies
    if [ -d /usr/local/texlive/2014basic/bin/x86_64-darwin ] ; then
        PATH=/usr/local/texlive/2014basic/bin/x86_64-darwin:$PATH
        MANPATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Man:$MANPATH"
    fi

    # For Postgress.app
    if [ -d /Applications/Postgres.app ] ; then
        PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
    fi

    # Hombrew goodies
    if command -v brew >/dev/null 2>&1 ; then
        PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
        brew_bash_completion="$(brew --prefix)/Library/Contributions/brew_bash_completion.sh"
        if [ -f $brew_bash_completion ] ; then
            . $brew_bash_completion
        fi
    fi
fi

### Added by the Heroku Toolbelt
[ -d /usr/local/heroku/bin ] && export PATH="/usr/local/heroku/bin:$PATH"

# Cabal, for pandoc and stuff
# Run "cabal update" every once in a while
[ -d $HOME/.cabal/bin ] && export PATH="${HOME}/.cabal/bin:$PATH"

# remove dupes
PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
export PATH
MANPATH="$(printf "%s" "${MANPATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
export MANPATH

# don't put duplicate lines in the history. See bash(1) for more options
# ignore lines starting with whitespace
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="&:[bf]g:cd:cd ..:clear:cp:exit:git diff:git status:ls:make:mv:pwd:vim:"

# Because sometimes Python flips you the bird
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

