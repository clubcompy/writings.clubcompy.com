#!/usr/bin/env bash

export scriptDir=$(dirname $0)
export PATH=$scriptDir:$PATH
pushd $scriptDir
hugo serve --logLevel info --bind=0.0.0.0 --buildDrafts --disableFastRender --destination public
popd
