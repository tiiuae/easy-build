#!/bin/bash

DIR=$1
if test "x${DIR}" = "x"; then
    DIR="$(pwd)/yocto-shared"
    mkdir -p ${DIR}
else
    shift
fi

CMD=$@
if test "x${CMD}" = "x"; then
    CMD="/bin/bash"
fi

exec docker run --rm -it --cap-add=NET_ADMIN -h build-yocto -v=${DIR}:/home/build/shared:z tiiuae/build-yocto:latest ${CMD}
