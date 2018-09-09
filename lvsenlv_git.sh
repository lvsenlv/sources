#!/bin/bash

RepositoryCount=10
function echo_message()
{
    echo "
    *** please input an available number ***

    1. git clone git@github.com:lvsenlv/sources.git
    2. git clone git@github.com:lvsenlv/ubuntu_config.git
    3. git clone git@github.com:lvsenlv/vim_config.git
    4. git clone git@github.com:lvsenlv/c_projects.git
    5. git clone git@github.com:lvsenlv/c_test.git
    6. git clone git@github.com:lvsenlv/eServer.git
    7. git clone git@github.com:lvsenlv/easy_chat_server.git
    8. git clone git@github.com:lvsenlv/s3c2440a.git
    9. git clone git@github.com:lvsenlv/encrypt.git
    10. git clone git@github.com:lvsenlv/libparser.git
    "
    return 0
}

expr $1 + 10 &> /dev/null 
if [ $? != 0 ];then
    echo_message
    exit 1
fi

if [[ -z $1 || $1 -lt 1 || $1 -gt $RepositoryCount ]];then
    echo_message
    exit 1
fi

case $1 in 
    1 )
        git clone git@github.com:lvsenlv/sources.git
        ;;
    2 )
        git clone git@github.com:lvsenlv/ubuntu_config.git
        ;;
    3 )
        git clone git@github.com:lvsenlv/vim_config.git
        ;;
    4 )
        git clone git@github.com:lvsenlv/c_projects.git
        ;;
    5 )
        git clone git@github.com:lvsenlv/c_test.git
        ;;
    6 )
        git clone git@github.com:lvsenlv/eServer.git
        ;;
    7 )
        git clone git@github.com:lvsenlv/easy_chat_server.git
        ;;
    8 )
        git clone git@github.com:lvsenlv/s3c2440a.git
        ;;
    9 )
        git clone git@github.com:lvsenlv/encrypt.git
        ;;
    10 )
        git clone git@github.com:lvsenlv/libparser.git
        ;;
    * )
        ;;
esac

