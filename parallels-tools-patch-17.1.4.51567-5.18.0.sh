#!/bin/bash


# Make parallels tools directory

mkdir ~/prl-tools-build
cd ~/prl-tools-build

# Copies image content to parallels tools directory
sudo cp -r /media/cdrom/* .

# Get patch file
sudo wget https://raw.githubusercontent.com/wegank/nixos-config/7b89b4c6d1a87c83f10aa5d0f96fe0229795056e/hardware/parallels-unfree/prl-tools.patch
cd kmods
sudo tar zxf prl_mod.tar.gz
cd ..
sudo patch -p1 < prl-tools.patch

# Creating backups
cd kmods
sudo mv prl_mod.tar.gz prl_mod.tar.gz.orig
sudo mv prl_mod.tar.gz.orig ../
sudo tar zcf prl_mod.tar.gz *

# Installs parallels tools
cd ..
sudo ./install
