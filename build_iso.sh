#!/bin/bash

cd `dirname $0`

if [ -z $1 ]; then
    echo "*** usage: ./build_iso.sh iso_file_name ***"
    exit 1
fi

ISO_NAME=$1

echo "*** mksuqashfs ...... ***"
if [ -f "extract-cd/casper/filesystem.squashfs" ]; then
    rm -rf extract-cd/casper/filesystem.squashfs
fi
mksquashfs squashfs-root extract-cd/casper/filesystem.squashfs

echo "*** mkisofs ...... ***"
printf $(du -sx --block-size 1 squashfs-root | cut -f1) > extract-cd/casper/filesystem.size
cd extract-cd
rm md5sum.txt
find -type f -print0 | xargs -0 md5sum|grep -v isolinux/boot.cat |tee md5sum.txt
mkisofs -D -r -V "$ISO_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o "../${ISO_NAME}.iso" .

echo "*** success ***"

