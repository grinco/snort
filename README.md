# SNORT

[![dockeri.co](https://dockeri.co/image/alexandreoda/snort)](https://hub.docker.com/r/alexandreoda/snort)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/snort.svg)](https://microbadger.com/images/alexandreoda/snort)
[![size](https://images.microbadger.com/badges/image/alexandreoda/snort.svg)](https://microbadger.com/images/alexandreoda/snort")
[![build](https://img.shields.io/docker/build/alexandreoda/snort.svg)](https://hub.docker.com/r/alexandreoda/snort)
[![automated](https://img.shields.io/docker/automated/alexandreoda/snort.svg)](https://hub.docker.com/r/alexandreoda/snort)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [snort](https://www.snort.org/)
- [pulledPork](https://github.com/shirkdog/pulledpork)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/snort/).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
mkdir $HOME/snort
docker run -it --name snort -v ${HOME}/snort:/snort -v ${HOME}/snort:/etc/snort -v ${HOME}/snort:/usr/local/lib -v ${HOME}/snort:/var/log/snort -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN --restart=always alexandreoda/snort
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/snort/blob/master/LICENSE)
