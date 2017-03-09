#!/bin/bash 

MAKE_PATH=$1

if [ -z $1 ];then
    MAKE_PATH=`pwd`
fi

if [ ! -d $MAKE_PATH ];then
    echo "*** $MAKE_PATH does not exist ***"
    exit 1
fi

if [ ! -f $MAKE_PATH/Makefile ];then
    echo "*** $MAKE_PATH/Makefile does not exist ***"
    exit 1
fi

cd $MAKE_PATH
make clean
if [ $? != 0 ];then
    exit 1
fi

make 
if [ $? != 0 ];then
    exit 1
fi

if [ ! -f test ];then
    echo "*** target-test does not exist ***"
    exit 1
fi

if [ ! -x test ];then
    echo "*** target-test is not executable ***"
fi

./test

