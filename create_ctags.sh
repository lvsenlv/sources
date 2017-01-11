#!/bin/bash

if [ ! -z $1 ];then
    if [ -d $1 ];then
        cd $1
    fi
fi

TAGS_PATH=`pwd`

if [ ! -d ~/.vim ];then
    mkdir ~/.vim
fi

ctags -R -f ~/.vim/tags $TAGS_PATH
echo "*** success to ctags in $TAGS_PATH ***"

