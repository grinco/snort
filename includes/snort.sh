#!/bin/sh

# LANCEMENT DE SNORT SI LE FICHIER /etc/snort/snort.conf EXISTE
if [ -e /etc/snort/snort.conf ]
then
  sudo /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  sudo service snort restart && \
  sudo snort -A console -c /etc/snort/snort.conf
else

# INSTALLATION DE SNORT SI LE FICHIER /etc/snort/snort.conf EXISTE PAS
  sudo apt-get update && \
  sudo apt-get install -y snort && \
  sudo ldconfig && \

# INSTALLATION DE PULLEDPORK POUR LA GESTION AUTOMATISEE DES REGLES SNORT
  git clone https://github.com/shirkdog/pulledpork.git && \
  sudo cp pulledpork/pulledpork.pl /usr/local/bin && \
  sudo chmod +x /usr/local/bin/pulledpork.pl && \
  sudo cp pulledpork/etc/*.conf /etc/snort && \
  rm -rf pulledpork && \

# CONFIGURATION DU FICHIER /etc/snort/snort.conf
  sed -i 's|ipvar EXTERNAL_NET any|#ipvar EXTERNAL_NET any|g' | sudo tee -a /etc/snort/snort.conf && \
  sed -i 's|#ipvar EXTERNAL_NET !$HOME_NET|ipvar EXTERNAL_NET $HOME_NET|g' | sudo tee -a /etc/snort/snort.conf && \

# CONFIGURATION DU FICHIER /etc/snort/pulledpork.conf
  sed -i 's|rule_url=https://www.snort.org/reg-rules|#rule_url=https://www.snort.org/reg-rules|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  sed -i 's|/usr/local/etc/snort|/etc/snort|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  sed -i 's|sid_msg_version=1|sid_msg_version=2|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  sed -i 's|rule_url=https://rules.emergingthreatspro|#rule_url=https://rules.emergingthreatspro|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  sed -i 's|distro=FreeBSD-8-1|distro=Debian-9-0|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  sudo mkdir /etc/snort/rules/iplists && \
  sudo touch /etc/snort/rules/iplists/default.blacklist && \

# CONFIGURATION DE PULLEDPORK
  sudo /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  sed -i.old -e '572i include $RULE_PATH/snort.rules' | sudo tee -a /etc/snort/snort.conf && \

# DEMARRAGE DE LA CONFIGURATION DE SNORT
  sudo service snort restart && \
  sudo dpkg-reconfigure snort
fi
