#!/bin/bash

if [ ! -z $1 ];then
    num_sys_convert -10 -2 $1
else
    echo "*** lack of param ***"
fi

