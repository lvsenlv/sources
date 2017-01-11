#!/bin/bash

ImgName=$1

if [ $# -lt 1 ];then
    echo "usage: ./expand_img path/imgname.img"
    exit 1
fi

if [ ! -f $ImgName ];then
    echo "***$ImgName  doesn't exist***"
    exit 1
fi

read -p "Please input the Mbyte you want to expand. " NewSpace
expr $NewSpace + 10 &> /dev/null
if [ $? -ne 0 ];then
    echo "***Input is not a number***"
    exit 1;
fi

if [ $NewSpace -ge 1024 ];then
    CycleTimes=$(($NewSpace / 1024))
    LeftSpace=$(($NewSpace % 1024))
    
    dd if=/dev/zero of=empty.img bs=1M count=1024
   
    for((i=1; i<= $CycleTimes; i++))
    do
        echo "The $i time to expand......"
        cat empty.img >> $ImgName
    done
    rm empty.img

    if [ $LeftSpace -ne 0 ];then
        dd if=/dev/zero of=left.img bs=1M count=$LeftSpace
        cat left.img >> $ImgName
        rm left.img
    fi
else
    if [ $NewSpace -ne 0 ];then
        dd if=/dev/zero of=empty.img bs=1M count=$NewSpace
        cat empty.img >> $ImgName
        rm empty.img
    fi
fi

e2fsck -f $ImgName
resize2fs -p $ImgName
echo "***Success***"

