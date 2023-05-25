#!/bin/bash -xe

if [ "$1" == "" ] ; then 
  echo "Must specify system"
  exit
fi

SCRIPT_DIR=$(dirname $(readlink -f ${BASH_SOURCE}))
BASEDIR=$SCRIPT_DIR/common
cd $BASEDIR
FILES=$(find . -type f)

for f in $FILES ; do
  echo $f
  echo $BASEDIR/$f
  echo $HOME/$f
  mkdir -p $(dirname $HOME/$f)
  ln -sf $(readlink -f $BASEDIR/$f) $HOME/$f
done

BASEDIR=$SCRIPT_DIR/$1
cd $BASEDIR
FILES=$(find . -type f)

for f in $FILES ; do
  echo $f
  echo $BASEDIR/$f
  echo $HOME/$f
  mkdir -p $(dirname $HOME/$f)
  ln -sf $(readlink -f $BASEDIR/$f) $HOME/$f
done
