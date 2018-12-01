FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update && apt-get install --no-install-recommends -y \
curl

WORKDIR /root/

RUN mkdir snort

COPY ./includes/snort.sh  /root/snort/snort.sh

WORKDIR /root/snort/

RUN chmod +x snort.sh

CMD ./snort.sh
