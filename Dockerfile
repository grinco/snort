# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER https://www.oda-alexandre.com/

# VARIABLES
ENV USER snort
ENV DEBIAN_FRONTEND noninteractive

# INSTALL PACKAGES
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
curl \
git \
libcrypt-ssleay-perl \
liblwp-useragent-determined-perl && \

# ADD USER
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# CREATION ESPACE OF TRAVAIL
RUN mkdir snort

# ADD INCLUDES
COPY ./includes/snort.sh  /home/${USER}/snort.sh
RUN sudo chmod +x /home/${USER}/snort.sh

# START THE CONTAINER
CMD ./snort.sh \
