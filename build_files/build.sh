#!/bin/bash

set -ouex pipefail

dnf5 remove -y krunner-bazaar \
  bazaar \
  ptyxis

dnf5 install -y plasma-discover \
  plasma-discover-flatpak \
  plasma-discover-notifier \
  plasma-discover-kns \
  --exclude=plasma-discover-offline-updates,plasma-discover-packagekit,plasma-discover-rpm-ostree,packagekit

dnf5 install -y konsole
