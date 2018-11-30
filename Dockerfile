FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

RUN apt-get update && apt-get install --no-install-recommends -y \
sendemail \
curl

WORKDIR /root/

RUN mkdir snort

COPY ./includes/snort.sh  /root/snort/snort.sh
COPY ./includes/snort-alerte /root/snort/snort-alerte

WORKDIR /root/snort/

RUN chmod +x snort.sh && \
chmod +x snort-alerte

RUN mv snort-alerte /etc/init.d/ && \
update-rc -f snort-alerte defaults

CMD ./snort.sh
