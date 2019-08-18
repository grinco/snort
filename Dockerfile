FROM debian:stretch-slim

LABEL authors="https://www.oda-alexandre.com/"

ENV USER snort
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
apt-get update && apt-get install --no-install-recommends -y \
sudo \
curl \
git \
libcrypt-ssleay-perl \
liblwp-useragent-determined-perl

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR /home/${USER}

RUN echo -e '\033[36;1m ******* CREATE WORKING SPACE ******** \033[0m' && \
mkdir snort

RUN echo -e '\033[36;1m ******* ADD APP ******** \033[0m'
COPY ./includes/snort.sh  /home/${USER}/snort.sh
RUN sudo chmod +x /home/${USER}/snort.sh

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD ./snort.sh \
