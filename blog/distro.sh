#!/usr/bin/env bash

export scriptDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export PATH=$scriptDir:$PATH
pushd $scriptDir
rm -r -f public/*
rm -r -f static/diagrams/*
hugo --minify --gc --buildDrafts --destination public
mkdir -p public/diagrams
mv static/diagrams/* public/diagrams
popd
