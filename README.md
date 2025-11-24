# bazzite-custom

This is a customized version of bazzite-nvidia-open which adds back KDE Discover, removes bazaar and additional packages I need. __This image will only work with NVIDIA GPUs.__

If you do rebase to this image, please remember to __disable automatic updates in system settings__ as you should be doing updates through `ujust update`. I've experienced issues with Discover when it tried automatically updating flatpaks.

Over time I may add additional packages and remove other packages I don't need to make Bazzite more suited to my needs. I will list all changes in this readme as I work on this image.

## Additional packages installed

- coolercontrol
- liquidctl
- netbird
- netbird-ui
- podman-compose
- konsole (replaces ptyxis)
- neovim
- zsh
- util-linux (for `chsh`)
- htop
- vlc (and required plugins)

## Packages Removed

- krunner-bazaar
- bazaar
- ptyxis

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

`sudo bootc switch ghcr.io/xlaaaain/bazzite-custom:latest`

This will queue the image for the next reboot, and you should reboot right away after the command finishes.

To go back to the official vanilla bazzite-nvidia-open image:

`sudo bootc switch ghcr.io/ublue-os/bazzite-nvidia-open:stable`

Then reboot after the command finishes. You can also use `bazzite-rollback-helper` or `brh` to switch back.

Credit to the team at Universal Blue for making Bazzite.
