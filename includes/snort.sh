#!/bin/sh

if [ -e /etc/snort/snort.conf ]
then
  service snort restart && snort -A console -c /etc/snort/snort.conf
else
  apt-get update && apt-get install -y snort sendemail && ldconfig && service snort restart && dpkg-reconfigure snort
fi
