#!/usr/bin/env bash
set -ex

# Install Deluge
add-apt-repository ppa:phoerious/keepassxc
apt-get update
apt-get install -y keepassxc

# Desktop Icon
cp /usr/share/applications/org.keepassxc.KeePassXC.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/org.keepassxc.KeePassXC.desktop

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi
