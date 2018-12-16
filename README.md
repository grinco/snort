# SNORT

![snort](https://raw.githubusercontent.com/oda-alexandre/snort/master/img/logo-snort.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/snort/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Configuration](#CONFIGURATION)
- [License](#LICENSE)


## BUILD DOCKER

[![snort docker build](https://img.shields.io/docker/build/alexandreoda/snort.svg)](https://hub.docker.com/r/alexandreoda/snort)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [Snort](https://www.snort.org/) avec [PulledPork](https://github.com/shirkdog/pulledpork) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/snort/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
mkdir $HOME/snort
docker run -it --name snort -v ${HOME}/snort:/snort -v ${HOME}/snort:/etc/snort -v ${HOME}/snort:/usr/local/lib -v ${HOME}/snort:/var/log/snort -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN --restart=always alexandreoda/snort
```


## CONFIGURATION

LES FICHIERS DE CONFIGURATION SONT DANS VOTRE DOSSIER $HOME/snort


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/snort/blob/master/LICENSE)
