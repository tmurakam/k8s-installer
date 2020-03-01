#!/bin/sh
echo "==> Extracting container images"
tar xvzf kubernetes-images.tar.gz

IMGLIST=images.txt
IMAGES=`cat $IMGLIST | sed "s/#.*$//g" | sort -u `
echo $IMAGES

for i in $IMAGES; do
    echo "==> Loading $i"
    sudo docker load -i images/`basename $i`.tar
done