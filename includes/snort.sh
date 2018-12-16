#!/bin/sh

# LANCEMENT DE SNORT SI LE FICHIER /etc/snort/snort.conf EXISTE
if [ -e /etc/snort/snort.conf ]
then
  /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  service snort restart && \
  snort -A console -c /etc/snort/snort.conf
else

# INSTALLATION DE SNORT SI LE FICHIER /etc/snort/snort.conf EXISTE PAS
  apt-get update && \
  apt-get install -y snort && \
  ldconfig && \

# INSTALLATION DE PULLEDPORK POUR LA GESTION AUTOMATISEE DES REGLES SNORT
  git clone https://github.com/shirkdog/pulledpork.git pulledpork && \
  cp pulledpork/pulledpork.pl /usr/local/bin && \
  chmod +x /usr/local/bin/pulledpork.pl && \
  cp pulledpork/etc/*.conf /etc/snort && \
  rm -rf pulledpork && \

# CONFIGURATION DU FICHIER /etc/snort/snort.conf
  sed -i 's|ipvar EXTERNAL_NET any|#ipvar EXTERNAL_NET any|g' /etc/snort/snort.conf && \
  sed -i 's|#ipvar EXTERNAL_NET !$HOME_NET|ipvar EXTERNAL_NET $HOME_NET|g' /etc/snort/snort.conf && \
  sed -i 's|#include $RULE_PATH|include $RULE_PATH|g' /etc/snort/snort.conf && \
  sed -i 's|include $RULE_PATH|#include $RULE_PATH|g' /etc/snort/snort.conf && \
  sed -i 's|#include $RULE_PATH/local.rules|include $RULE_PATH/local.rules|g' /etc/snort/snort.conf && \

# CONFIGURATION DU FICHIER /etc/snort/pulledpork.conf
  sed -i 's|rule_url=https://www.snort.org/reg-rules|#rule_url=https://www.snort.org/reg-rules|g' /etc/snort/pulledpork.conf && \
  sed -i 's|/usr/local/etc/snort|/etc/snort|g' /etc/snort/pulledpork.conf && \
  sed -i 's|sid_msg_version=1|sid_msg_version=2|g' /etc/snort/pulledpork.conf && \
  sed -i 's|rule_url=https://rules.emergingthreatspro|#rule_url=https://rules.emergingthreatspro|g' /etc/snort/pulledpork.conf && \
  sed -i 's|distro=FreeBSD-8-1|distro=Debian-9-0|g' /etc/snort/pulledpork.conf && \
  mkdir /etc/snort/rules/iplists && \
  touch /etc/snort/rules/iplists/default.blacklist && \

# CONFIGURATION DE PULLEDPORK
  /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  sed -i.old -e '572i|include $RULE_PATH/snort.rules' /etc/snort/snort.conf && \

# DEMARRAGE DE LA CONFIGURATION DE SNORT
  service snort restart && \
  dpkg-reconfigure snort
fi
