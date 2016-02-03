#!/bin/bash

docker rm -f build-i386
docker run -ti \
    --name build-i386 \
    -v $(pwd)/build:/build \
    build-i386 bash

