FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.com

# VARIABLES
ENV USER snort \
DEBIAN_FRONTEND noninteractive

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
curl \
git \
libcrypt-ssleay-perl \
liblwp-useragent-determined-perl && \

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/${USER}

# CREATION ESPACE DE TRAVAIL
RUN mkdir snort

# AJOUT INCLUDES
COPY ./includes/snort.sh  /home/${USER}/snort.sh
RUN sudo chmod +x /home/${USER}/snort.sh

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD ./snort.sh
