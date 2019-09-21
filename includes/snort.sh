#!/bin/sh

if [ -e /etc/snort/snort.conf ]
then
  echo -e '\033[36;1m ******* LAUNCH SNORT IF FILE /etc/snort/snort.conf EXISTS ******** \033[0m'
  # sudo /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  sudo service snort restart && \
  sudo snort -A console -c /etc/snort/snort.conf
else

  echo -e '\033[36;1m ******* INSTALL SNORT IF FILE /etc/snort/snort.conf NOT EXISTS ******** \033[0m' && \
  sudo apt update && \
  sudo apt install -y snort && \
  sudo ldconfig && \

  # echo -e '\033[36;1m ******* INSTALL OF PULLEDPORK FOR THE AUTOMATED MANAGEMENT OF THE SNOR RULES ******** \033[0m' && \
  # git clone https://github.com/shirkdog/pulledpork.git && \
  # sudo cp pulledpork/pulledpork.pl /usr/local/bin && \
  # sudo chmod +x /usr/local/bin/pulledpork.pl && \
  # sudo cp pulledpork/etc/*.conf /etc/snort && \
  # rm -rf pulledpork && \

  echo -e '\033[36;1m ******* CONFIG SNORT ******** \033[0m' && \
  sed -i 's|ipvar EXTERNAL_NET any|#ipvar EXTERNAL_NET any|g' | sudo tee -a /etc/snort/snort.conf && \
  sed -i 's|#ipvar EXTERNAL_NET !$HOME_NET|ipvar EXTERNAL_NET $HOME_NET|g' | sudo tee -a /etc/snort/snort.conf && \


  # echo -e '\033[36;1m ******* CONFIG PULLEDPORK ******** \033[0m' && \
  # sed -i 's|rule_url=https://www.snort.org/reg-rules|#rule_url=https://www.snort.org/reg-rules|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  # sed -i 's|/usr/local/etc/snort|/etc/snort|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  # sed -i 's|sid_msg_version=1|sid_msg_version=2|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  # sed -i 's|rule_url=https://rules.emergingthreatspro|#rule_url=https://rules.emergingthreatspro|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  # sed -i 's|distro=FreeBSD-8-1|distro=Debian-9-0|g' | sudo tee -a /etc/snort/pulledpork.conf && \
  # sudo mkdir /etc/snort/rules/iplists && \
  # sudo touch /etc/snort/rules/iplists/default.blacklist && \
  # sudo /usr/local/bin/pulledpork.pl -c /etc/snort/pulledpork.conf -l && \
  # sed -i.old -e '572i include $RULE_PATH/snort.rules' | sudo tee -a /etc/snort/snort.conf && \

  echo -e '\033[36;1m ******* START MANUAL CONFIG OF SNORT ******** \033[0m' && \
  sudo service snort restart && \
  sudo dpkg-reconfigure snort
fi
