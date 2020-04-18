FROM debian:buster-slim

LABEL authors https://www.oda-alexandre.com

ENV USER snort
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install --no-install-recommends -y \
  sudo \
  curl \
  git \
  libcrypt-ssleay-perl \
  liblwp-useragent-determined-perl

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CREATE WORKING SPACE ******** \033[0m' && \
  mkdir snort

RUN echo -e '\033[36;1m ******* ADD APP ******** \033[0m'
COPY ./snort.sh  ${HOME}/snort.sh
RUN sudo chmod +x ${HOME}/snort.sh

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD ./snort.sh \