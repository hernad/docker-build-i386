#!/bin/bash

#sudo mkdir  -p /opt/hb32
sudo chown docker -R /usr/local

export HB_USER_CFLAGS=-m32  
export HB_USER_DFLAGS=-m32
export HB_USER_LDFLAGS=-m32

export HB_PLATFORM=linux
export HB_INSTALL_PREFIX=/usr/local
export HB_COMPILER=gcc

export CFLAGS=-m32
export CXXFLAGS=-m32
export DFLAGS=-m32

#export HB_WITH_OPENSSL=/usr/$MINGW/include
#export HB_STATIC_OPENSSL=yes
#export HB_WITH_PGSQL=/usr/$MINGW/include


#export HB_USER_CFLAGS="-m32 -I/usr/$MINGW/include"
#export HB_USER_LDFLAGS="-m32 -L/usr/$MINGW/lib"


#docker@84421c4acadf:~/harbour-core$ objdump -a /opt/hb32/lib/harbour/libsqlite3.a
#In archive /opt/hb32/lib/harbour/libsqlite3.a:
#sqlite3.o:     file format elf64-x86-64
#rw-r--r-- 1000/1000 1603632 Jan 19 12:38 2016 sqlite3.o

