#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# add netbird repo
tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

# add coolercontrol copr
# wget https://copr.fedorainfracloud.org/coprs/codifryed/CoolerControl/repo/fedora-$(rpm -E %fedora)/codifryed-CoolerControl-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_codifryed-CoolerControl.repo

# install dnf plugins
# dnf5 install -y dnf-plugins-core

# enable required copr repos
# dnf copr enable codifryed/CoolerControl

# remove bazaar
dnf5 remove -y krunner-bazaar bazaar

# install discover, exclude packages that cause issues
dnf5 install -y plasma-discover plasma-discover-flatpak plasma-discover-notifier plasma-discover-kns \
  --exclude=plasma-discover-offline-updates,plasma-discover-packagekit,plasma-discover-rpm-ostree,packagekit

# install other packages
dnf5 install -y podman-compose

# rpm-ostree install netbird to avoid post-install.sh error when using dnf
# must also install coolercontrol this way to get daemon to work or else
# systemd service wont work.
rpm-ostree install netbird netbird-ui coolercontrol liquidctl

# enable podman socket
systemctl enable podman.socket

# enable netbird system service
systemctl enable netbird

# enable coolercontrold
systemctl enable coolercontrold
