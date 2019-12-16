# SNORT

<img src="https://res-3.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_120,w_120,f_auto,b_white,q_auto:eco/v1480679929/iwzduqxdvnpqxdrmmmn0.png" width="200" height="200"/>

## INDEX

- [SNORT](#snort)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/snort/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/snort/commits/master)

## INTRODUCTION

Docker image of :

- [snort](https://www.snort.org/)
- [pulledPork](https://github.com/shirkdog/pulledpork)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/snort/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/snort/)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

```mkdir $HOME/snort```

```docker run -it --name snort -v ${HOME}/snort:/snort -v ${HOME}/snort:/etc/snort -v ${HOME}/snort:/usr/local/lib -v ${HOME}/snort:/var/log/snort -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN --restart always alexandreoda/snort```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/snort/blob/master/LICENSE)
