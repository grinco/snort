#!/bin/sh

if [ -e /etc/snort/snort.conf ]
then
  service snort restart && \
  snort -A console -c /etc/snort/snort.conf
else
  apt-get update && \
  apt-get install -y snort && \
  ldconfig && \
  sed -i "s|#ipvar EXTERNAL_NET !$HOME_NET|ipvar EXTERNAL_NET $HOME_NET|g" /etc/snort/snort.conf && \
  sed -i "s|ipvar EXTERNAL_NET any|#ipvar EXTERNAL_NET any|g" /etc/snort/snort.conf && \
  sed -i "s|include $RULE_PATH/community|#include $RULE_PATH/community|g" /etc/snort/snort.conf && \
  service snort restart && \
  dpkg-reconfigure snort
fi
