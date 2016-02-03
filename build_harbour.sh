#!/bin/bash

echo "build harbour mingw"

source /set_build.sh 

cd /home/docker/harbour-core
make
make install   


