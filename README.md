# bazzite-nvidia-nognome

This is a customized version of bazzite-nvidia which adds back KDE Discover, removes bazaar gnome-disks and ptyxis. __This image will only work with NVIDIA GPUs (old driver).__

If you do rebase to this image, please remember to __disable automatic updates in system settings__ as you should be doing updates through `ujust update`. I've experienced issues with Discover when it tried automatically updating flatpaks.

## Packages Removed
- krunner-bazaar
- bazaar
- ptyxis
- gnome-disk-utility

## Packages Added
- kde-partitionmanager
- konsole
- plasma-discover
- plasma-discover-flatpak
- plasma-discover-notifier
- plasma-discover-kns

## KDE Discover note

To get KDE Discover back, you must install:

- plasma-discover
- plasma-discover-flatpak
- plasma-discover-notifier
- plasma-discover-kns

You must exclude the following packages:

- plasma-discover-offline-updates
- plasma-discover-packagekit
- plasma-discover-rpm-ostree
- packagekit

If those packages are not excluded Discover will not work properly.

## How to use this image

In the terminal:

`sudo bootc switch ghcr.io/valeskini/bazzite-nvidia-nognome:latest`

This will queue the image for the next reboot, and you should reboot right away after the command finishes.

To go back to the official vanilla bazzite-nvidia image:

`sudo bootc switch ghcr.io/ublue-os/bazzite-nvidia:stable`

Then reboot after the command finishes. You can also use `bazzite-rollback-helper` or `brh` to switch back.

Credit to the team at Universal Blue for making Bazzite.
