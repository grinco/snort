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

Ce repository contient le fichier Dockerfile de [Snort](https://www.snort.org/) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/snort/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
mkdir $HOME/snort
docker run -it --name snort -v ${HOME}/snort:/snort -v ${HOME}/snort:/etc/snort -v ${HOME}/snort:/usr/local/lib -v ${HOME}/snort:/var/log/snort --network host --cap-add=NET_ADMIN --restart=always alexandreoda/snort
```


## CONFIGURATION

POUR LA CONFIGURATION AU PREMIER DÉMARRAGE RÉPONDEZ AUX QUESTIONS.

- 1 - 1 (pour démarrer snort au boot)
- 2 - wlan0 eth0 (pour une prise en charge de toutes les interfaces réseaux)
- 3 - 127.0.0.1 (pour surveiller seulement votre machine)
- 4 - yes (désactivation de l'écoute sur les autres interfaces réseaux)
- 5 - laissez vide (ajouter des commandes perso si vous en avez)
- 6 - no (n'utilisez pas les alertes email snort)

POUR LA CONFIGURATION DES ALERTES PAR MAIL MODIFIER LE FICHIER /snort/snort-alerte.sh

- 1 - EMAILSNORT='snort@snort.com' (email que vous donner a snort)
- 2 - VOTREMAIL='votremail@mail.com' (email ou sont envoyer les alertes)
- 3 - OBJET='Alerte Intrusion' (objet du mail)
- 4 - MESSAGE='Attention une intrusion a été détectée !' (message du mail)

POUR TESTER LA CONFIGURATION LANCER LA COMMANDE CI-DESSOUS ET EFFECTUEZ UN PING VERS LE CONTAINER SNORT.

'''
ping 8.8.8.8
'''


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/snort/blob/master/LICENSE)
