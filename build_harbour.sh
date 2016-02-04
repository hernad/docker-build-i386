#!/bin/bash

echo "build harbour mingw"

source /set_build.sh 

cd /home/docker/harbour-core
make
make install   
objdump -a /usr/local/lib/harbour/libsqlite3.a 
make clean
make install
objdump -a /usr/local/lib/harbour/libsqlite3.a 

