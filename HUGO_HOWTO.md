## Install Hugo

```shell
sudo snap install hugo
```

## Install tool dependencies

```shell
sudo apt install plantuml graphviz ruby-rubygems libatk-bridge2.0-0t64 libnss3 libcups2 lib32z1 libxcomposite-dev libxdamage1 libxrandr2 libgbm1 libxkbcommon-x11-0  libpangocairo-1.0-0
sudo gem install asciidoc asciidoctor asciidoctor-html5s asciidoctor-diagram asciidoctor-rouge asciidoctor-bibtex asciimath pygments.rb
```

## Create a hugo site

From the repo root:
```shell
hugo new site blog
```

Install the mmdc compiler for Mermaid:
```shell
cd blog
npm install -g @mermaid-js/mermaid-cli@10.8.0
```

## Build out convenience scripts

Create a file in site root, `dev.sh`:

```shell
#!/usr/bin/env bash

export scriptDir=$(dirname $0)
export PATH=/usr/local/bin:$PATH
pushd $scriptDir
hugo serve --logLevel info --bind=0.0.0.0 --buildDrafts --disableFastRender --destination public
popd
```

Set the execute flag:

```shell
chmod u+x dev.sh
```

Create a file in site root, `distro.sh`:

```shell
#!/usr/bin/env bash

export scriptDir=$(dirname $0)
export PATH=$scriptDir:$PATH
pushd $scriptDir
hugo --minify --gc --destination public
popd
```

Set the execute flag:

```shell
chmod u+x distro.sh
```

## Install a theme

```shell
cd blog
git submodule add https://github.com/vaga/hugo-theme-m10c.git themes/m10c
```

## Create a page

```shell
cd blog
hugo new content posts/my-first-post.md
```

## Serve draft site locally

```shell
cd blog
./dev.sh
```

## Publish site

```shell
cd blog
./distro.sh
```
