#!/bin/sh

cd $(dirname $0)

docker build --no-cache --rm -t tiiuae/build-openwrt .

exit $?
