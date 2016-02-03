#!/bin/bash

sudo mkdir  -p /opt/hb32
sudo chown docker -R /opt/hb32


export HB_PLATFORM=linux
export HB_INSTALL_PREFIX=/opt/hb32
export HB_COMPILER=gcc
#export HB_WITH_OPENSSL=/usr/$MINGW/include
#export HB_STATIC_OPENSSL=yes
#export HB_WITH_PGSQL=/usr/$MINGW/include



#export HB_USER_CFLAGS="-m32 -I/usr/$MINGW/include"
#export HB_USER_LDFLAGS="-m32 -L/usr/$MINGW/lib"
