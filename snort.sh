#!/bin/sh

if [ -e /etc/snort/snort.conf ]
then
  echo -e '\033[36;1m ******* LAUNCH SNORT IF FILE /etc/snort/snort.conf EXISTS ******** \033[0m'
  #sudo service snort restart; \
  sudo /home/snort/trafr -s | sudo snort -r - -A console -c /etc/snort/snort.conf
else
  echo -e '\033[36;1m ******* CONFIG SNORT ******** \033[0m'; \
  sed -i 's|ipvar EXTERNAL_NET any|#ipvar EXTERNAL_NET any|g' | sudo tee -a /etc/snort/snort.conf-firstboot; \
  sed -i 's|#ipvar EXTERNAL_NET !$HOME_NET|ipvar EXTERNAL_NET $HOME_NET|g' | sudo tee -a /etc/snort/snort.conf-firstboot; \

  echo -e '\033[36;1m ******* START MANUAL CONFIG OF SNORT ******** \033[0m'; \
  sudo mv /etc/snort/snort.conf-firstboot /etc/snort/snort.conf
  #sudo service snort restart; \
  sudo dpkg-reconfigure snort
fi
