#!/bin/bash

TARGET="s3c2440a.bin"

make clean
make
if [ x"$?" != x"0" ];then
    exit -1
fi

if [ ! -f $TARGET ];then
    echo "*** $TARGET does not exist ***"
    exit -1
fi

echo "*** flash code ... ***"
oflash 0 1 0 0 0 $TARGET
if [ x"$?" != x"0" ];then
    exit -1
fi

echo "*** success ***"
