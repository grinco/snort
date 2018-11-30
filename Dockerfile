FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

WORKDIR /root/

COPY ./includes/snort.sh /root/snort.sh
COPY ./includes/snort-alerte.sh /root/snort-alerte.sh

RUN chmod +x snort.sh
RUN chmod +x snort-alerte.sh

CMD ./snort.sh
