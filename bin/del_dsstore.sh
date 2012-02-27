#!/bin/bash
#
# Recursively deletes all the .DS_Store and Thumbs.db files starting on the
# specified location if there is no argument it deletes the ones under $HOME
#
# Options:
# --path: the path. If not present use .
# --ms: if present seek only for Thumbs.db
# --apple: if present seek only for .DS_Store
# --file: specify the file to delete
# If --ms, --apple and --file are note specified
# delete both .DS_Store and Thumbs.db
#

ls_store() {
    find "$HOME" -name ".DS_Store" -depth -exec ls {} \;
}

ls_thumbs() {
    find "$HOME" -name "Thumbs.db" -depth -exec ls {} \;
}

rm_store() {
    find "$HOME" -name ".DS_Store" -depth -exec rm {} \;
}

rm_thumbs() {
    find "$HOME" -name "Thumbs.db" -depth -exec rm {} \;
}


while true; do 
    echo -en "\e[1;34mQUE QUIERE HACER?\n\t1) Listar\n\t2) Borrar\n\t3) Salir\n>>> \e[0m"
    read ANS

    case $ANS in
        1) FN="LISTAR";
           ;;
        2) FN="BORRAR";
           ;;
        3) exit
           ;;
        *) echo -e "\e[1;31mOPCION INCORRECTA\e[0m"
           continue
           ;;
    esac

    while true; do
        echo -en "\e[1;34mQUE QUIERE $FN?\n\t1) .DS_Store\n\t2) Thumb.db\n\t3) Ambos\n\t4) Salir\n>>> \e[0m"

        read ANS

        case $ANS in
            1) if [ $FN ==  "LISTAR" ]; then
                    ls_store
                else
                    rm_store
                fi

               break
               ;;
            2) if [ $FN == "LISTAR" ]; then
                    ls_thumbs
                else
                    rm_thumbs
                fi
               
               break
               ;;
            3) if [ $FN ==  "LISTAR" ]; then
                    ls_store
                    ls_thumbs
                else
                    rm_store
                    rm_thumbs
                fi

               break
               ;;
            4) exit
              ;;
            *) echo -e "\e[1;31mOPCION INCORRECTA\e[0m"
               continue
               ;;
        esac
    done
done

