FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
curl \
git \
libcrypt-ssleay-perl \
liblwp-useragent-determined-perl

# SELECTION ESPACE DE TRAVAIL
WORKDIR /root/

# CREATION ESPACE DE TRAVAIL
RUN mkdir snort

# AJOUT INCLUDES
COPY ./includes/snort.sh  /root/snort/snort.sh
RUN chmod +x /root/snort/snort.sh

# SELECTION ESPACE DE TRAVAIL
WORKDIR /root/snort/

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD ./snort.sh
