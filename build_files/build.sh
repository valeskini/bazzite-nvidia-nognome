#!/bin/bash

set -ouex pipefail

dnf5 remove -y krunner-bazaar \
  bazaar \
  ptyxis \
  gnome-disk-utility

dnf5 install -y plasma-discover \
  plasma-discover-flatpak \
  plasma-discover-notifier \
  plasma-discover-kns \
  kde-partitionmanager \
  --exclude=plasma-discover-offline-updates,plasma-discover-packagekit,plasma-discover-rpm-ostree,packagekit

dnf5 install -y konsole \
  kde-partitionmanager
