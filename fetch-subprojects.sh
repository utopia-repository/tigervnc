#! /bin/bash

cd `dirname "$0"` || \
  { echo "WHAT?! Can't change to script directory!"; exit -1; }

TIGERVNC_VERSION=$(basename $(readlink tigervnc))

echo "Fetching debian xorg source package..."
git submodule update --init || \
  { echo "Ups... Can't fetch debian xorg source package!"; exit -1; }
echo "Fetching ${TIGERVNC_VERSION} tigervnc sources..."
test -d tigervnc-tags || mkdir tigervnc-tags || \
  { echo "Ups.. Can't create tigervnc-tags subdir!"; exit -1; }
svn co http://tigervnc.svn.sourceforge.net/svnroot/tigervnc/tags/${TIGERVNC_VERSION} tigervnc-tags/${TIGERVNC_VERSION} || \
  { echo "Ups.. Can't fetch ${TIGERVNC_VERSION} tigervnc sources!"; exit -1; }
