#!/bin/sh

if [ $# -eq 0 ]; then
    echo "false"
    exit 0
fi

os=`uname -s`

case $os in 
Linux)
    cp="xclip -sel clip"
    ;;
Darwin)
    cp="pbcopy"
    ;;
*)
    echo "error"
    exit 1
    ;;
esac

for fn in $@
do
    case $fn in 
    *.py | *.sh)
        comment="# $fn"
        ;;
    *.c)
        comment="// $fn"
        ;;
    *.java)
        comment="// $fn"
        ;;
    *.html)
        comment="<!--...--> $fn"
        ;;
    esac

    echo "$comment"
    cat $fn
    echo
done | $cp
