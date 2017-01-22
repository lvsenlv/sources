#!/bin/bash

if [ ! -z $1 ];then
    num_sys_convert -2 -10 $1
else
    echo "*** lack of param ***"
fi

