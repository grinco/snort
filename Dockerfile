FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

WORKDIR /root/

COPY ./includes/snort.sh  /root/snort.sh

RUN chmod +x snort.sh

CMD ./snort.sh
