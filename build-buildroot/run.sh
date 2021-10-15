#!/bin/bash

DIR=$1
if test "x${DIR}" = "x"; then
    DIR="$(pwd)/buildroot-shared"
    mkdir -p ${DIR}
else
    shift
fi

CMD=$@
if test "x${CMD}" = "x"; then
    CMD="/bin/bash"
fi

exec docker run --rm -it -h build-buildroot -v=${DIR}:/home/build/shared:z tiiuae/build-buildroot:latest ${CMD}
