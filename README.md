# SNORT

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904480/snort-logo.png)

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

- [gitlab pipelines](https://gitlab.com/oda-alexandre/snort/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/snort/)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

```mkdir ${HOME}/snort```

```\
docker run -it \
--name snort \
--restart unless-stopped \
--network host \
--cap-add=NET_ADMIN \
-v ${HOME}/snort:/snort \
-v ${HOME}/snort:/etc/snort \
-v ${HOME}/snort:/usr/local/lib \
-v ${HOME}/snort:/var/log/snort \
-v /etc/localtime:/etc/localtime:ro \
alexandreoda/snort
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  snort:
    container_name: snort
    image: alexandreoda/snort
    restart: unless-stopped
    network_mode: host
    privileged: false
    cap_add:
      - NET_ADMIN
    volumes:
      - "${HOME}/snort:/snort"
      - "${HOME}/snort:/etc/snort"
      - "${HOME}/snort:/usr/local/lib"
      - "${HOME}/snort:/var/log/snort"
      - "/etc/localtime:/etc/localtime:ro"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/snort/blob/master/LICENSE)
