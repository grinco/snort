# SNORT

<img src="https://res-3.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_120,w_120,f_auto,b_white,q_auto:eco/v1480679929/iwzduqxdvnpqxdrmmmn0.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/snort/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/snort/commits/master)


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
