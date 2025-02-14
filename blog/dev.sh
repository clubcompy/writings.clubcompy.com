#!/usr/bin/env bash

export scriptDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export PATH=/usr/local/bin:$scriptDir:$PATH
pushd $scriptDir
rm -r -f public/*
rm -r -f static/diagrams/*
hugo server --logLevel info --bind=0.0.0.0 --buildDrafts --disableFastRender
popd
