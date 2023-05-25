#!/bin/bash -xe

if [ "$1" == "" ] ; then 
  echo "Must specify system"
  exit
fi

BASEDIR=$(dirname $(readlink -f ${BASH_SOURCE}))/$1

cd $BASEDIR
FILES=$(find . -type f)

for f in $FILES ; do
  echo $f
  echo $BASEDIR/$f
  echo $HOME/$f
  ln -sf $(readlink -f $BASEDIR/$f) $HOME/$f
done
