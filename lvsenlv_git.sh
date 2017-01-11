#!/bin/bash

function echo_message()
{
    echo "
    *** please input an available number ***

    1. git clone git@github.com:lvsenlv/c_test.git
    2. git clone git@github.com:lvsenlv/sources.git
    3. git clone git@github.com:lvsenlv/vim_config.git
    4. git clone git@github.com:lvsenlv/ubuntu_config.git
    5. git clone git@github.com:lvsenlv/jz2440.git
    "
    return 0
}

expr $1 + 10 &> /dev/null 
if [ $? != 0 ];then
    echo_message
    exit 1
fi

if [[ -z $1 || $1 -lt 1 || $1 -gt 5 ]];then
    echo_message
    exit 1
fi

case $1 in 
    1 )
        git clone git@github.com:lvsenlv/c_test.git
        ;;
    2 )
        git clone git@github.com:lvsenlv/sources.git
        ;;
    3 )
        git clone git@github.com:lvsenlv/vim_config.git
        ;;
    4 )
        git clone git@github.com:lvsenlv/ubuntu_config.git
        ;;
    5 )
        git clone git@github.com:lvsenlv/jz2440.git
        ;;
    * )
        ;;
esac

