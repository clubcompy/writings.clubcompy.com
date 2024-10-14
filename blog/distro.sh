#!/usr/bin/env bash

export scriptDir=$(dirname $0)
export PATH=$scriptDir:$PATH
pushd $scriptDir
hugo --minify --gc --destination public
popd
