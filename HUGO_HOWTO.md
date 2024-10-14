## Install Hugo

```shell
sudo snap install hugo
```

## Install tool dependencies

```shell
sudo apt install plantuml
sudo apt install graphviz
sudo apt install ruby-rubygems
sudo gem install asciidoctor asciidoctor-html5s asciidoctor-diagram asciidoctor-rouge asciidoctor-bibtex asciimath pygments.rb
```

## Create a hugo site

```shell
hugo new site blog
```

## Install asciidoctor with PlantUML rendering support

Create a file in site root, `asciidoctor`:

```shell
#!/usr/bin/env bash

/usr/local/bin/asciidoctor \
-r asciidoctor-html5s \
-b html5s
-r asciidoctor-diagram \
-a source-highlighter=pygments \
-a pygments-linenums-mode=inline \
-a pygments-css=style \
-a pygments-style=monokai "$@"
```

Set the execute flag:

```shell
chmod u+x asciidoctor
```

Create a file in site root, `dev.sh`:

```shell
#!/usr/bin/env bash

export scriptDir=`greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]}`
export PATH=$scriptDir:$PATH
hugo server -D
```

Set the execute flag:

```shell
chmod u+x dev.sh
```

Create a file in site root, `distro.sh`:

```shell
#!/usr/bin/env bash

export scriptDir=`greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]}`
export PATH=$scriptDir:$PATH
hugo
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
