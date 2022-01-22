FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER snort
ENV HOME /home/${USER}
ENV LOCALES fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install --no-install-recommends -y \
  sudo \
  locales \
  curl \
  git \
  libcrypt-ssleay-perl \
  liblwp-useragent-determined-perl \
  wget \
  libc6-i386 

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}
  
RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  useradd -d ${HOME} -m ${USER}; \
  passwd -d ${USER}; \
  adduser ${USER} sudo


RUN  echo -e '\033[36;1m ******* INSTALL SNORT ******** \033[0m'; \
  apt-get update; \
  apt-get install -y snort; \
  ldconfig; \
  mv /etc/snort/snort.conf /etc/snort/snort.conf-firstboot

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CREATE WORKING SPACE ******** \033[0m'; \
  mkdir snort

RUN echo -e '\033[36;1m ******* INSTALL TRAFR ******** \033[0m';
RUN wget http://www.mikrotik.com/download/trafr.tgz -O /tmp/trafr.tgz
RUN cd ${HOME} && tar -zvxf /tmp/trafr.tgz && rm /tmp/trafr.tgz

RUN echo -e '\033[36;1m ******* ADD APP ******** \033[0m'
COPY ./snort.sh  ${HOME}/snort.sh
RUN sudo chmod +x ${HOME}/snort.sh

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD ./snort.sh \
