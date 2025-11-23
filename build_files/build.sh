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

# this causes build issues, leave commented for now
# dnf5 config-manager addrepo --from-repofile=/etc/yum.repos.d/netbird.repo

# remove bazaar
dnf5 remove -y krunner-bazaar bazaar

# install discover, exclude packages that cause issues
dnf5 install -y plasma-discover plasma-discover-flatpak plasma-discover-notifier plasma-discover-kns \
  --exclude=plasma-discover-offline-updates,plasma-discover-packagekit,plasma-discover-rpm-ostree,packagekit

# install other packages
dnf5 install -y coolercontrol liquidctl netbird netbird-ui podman-compose

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# enable podman socket
systemctl enable podman.socket

# enable netbird system service
systemctl enable netbird
