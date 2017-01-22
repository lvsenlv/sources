#!/bin/bash

make clean >tmp_make
make >tmp_make 2>&1
cat tmp_make | grep warning > tmp_warning
cat tmp_make | grep error > tmp_error

flag=0
WARNING=`cat tmp_warning | wc -l`
ERROR=`cat tmp_error | wc -l`
if [ $WARNING -gt 0 ];then
    cat tmp_warning
    flag=1
fi
if [ $ERROR -gt 0 ];then
    cat tmp_error
    flag=1
fi
if [ $flag = 1 ];then
    exit 1
fi

if [ ! -f test.bin ];then
    echo "*** test.bin does not exist ***"
    exit 1
fi

echo "*** oflash ... ***"
oflash 0 1 0 0 0 test.bin > tmp_oflash 2>&1
rm tmp_make tmp_warning tmp_error tmp_oflash
echo "*** success ***"
