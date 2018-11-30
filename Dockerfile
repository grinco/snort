FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

WORKDIR /root/

RUN mkdir snort

COPY ./includes/snort.sh  /root/snort/snort.sh
COPY ./includes/snort-alerte.sh /root/snort/snort-alerte.sh

RUN chmod +x /snort/snort.sh
RUN chmod +x /snort/snort-alerte.sh

CMD ./snort.sh
