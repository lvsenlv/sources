#!/bin/bash

if [ $# -lt 1 ]; then
    echo "*** usage: ./img.sh img_file_name ***"
    exit 1
fi
IMG_NAME=$1

rm -rf /opt/mac
rm -rf /bootloader/*
echo "1" >  /3tbackup/etc/resize_flag

dd if=/dev/mtd1 of=${IMG_NAME}

e2fsck -f ${IMG_NAME}
resize2fs -Mp ${IMG_NAME}

