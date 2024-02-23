#~/.bash_aliases

eval "$(dircolors -b)"
alias ls='ls -AFh --color=auto'
alias pstree='pstree -ca'

alias su='su -l'

# Calls rm, trash-cli or does nothing, depending on the option
# chosen by the user.
# Called from an alias of rm to avoid using rm by mistake.
rm_wrapper () {
    RED='\e[1;31m'
    COLOR_OFF='\e[0m'
    BOLD_WHITE='\e[1;37m'

    echo -e "${RED}Did you say rm?!${COLOR_OFF}"
    echo "What do really wanna do?"
    echo "[1] rm"
    echo "[2] trash-cli"
    echo "[3] quit"

    while read ; do

        case $REPLY in
            1)
                echo "OK, 'rm -i' it is then…"
                rm -i $@
                break
                ;;
            2)
                echo "To the trash can!"
                trash $@
                break
                ;;
            3)
                echo "Let's pretend this never happened"
                return
                ;;
            *)
                echo "You must enter 1 for rm, 2 for trash-cli, or 3 to quit."
                ;;
         esac
    done
}

# Since Bash aliases are only used in interactive shells
# this should not affect scripts that expect to use rm.
# To use rm directly, prepend a backslash to bypass the alias:
# \rm --options files
alias rm='rm_wrapper'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'
alias grep='grep --color=auto'
alias python='python -t'

alias poweroff='systemctl poweroff --now'
