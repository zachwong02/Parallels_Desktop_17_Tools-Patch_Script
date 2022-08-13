#!/bin/bash
echo "================================"
echo "                                "
echo "     PARALLELS TOOLS PATCH      "
echo "                                "
echo "  #  MAKE SURE ISO IS MOUNTED   "
echo "                                "
echo "  #  PATCH FILE CAN BE CHANGED  "
echo "                                "
echo "  #  REFER TO GalaxyMaster 	  "
echo "                                "
echo "                                "
echo "================================"

echo "MAKING DIRECTORY prl-tools-build"
mkdir ~/prl-tools-build
cd ~/prl-tools-build
echo "DIRECTORY prl-tools-build CREATED"
echo "================================"



echo "COPYING FILES FROM /media/cdrom"
cp -r /media/cdrom/* .
echo "FILES COPIED"
echo "================================"


echo "PATCHING FILES"
wget https://raw.githubusercontent.com/wegank/nixos-config/7b89b4c6d1a87c83f10aa5d0f96fe0229795056e/hardware/parallels-unfree/prl-tools.patch
cd kmods
tar zxf prl_mod.tar.gz
patch -p1 < prl-tools.patch
echo "FILES PATCHED"
echo "================================"

echo "MAKING BACKUPS"
cd kmods
mv prl_mod.tar.gz prl_mod.tar.gz.orig
mv prl_mod.tar.gz.orig ../
tar zcf prl_mod.tar.gz *
echo "BACKUPS CREATED"
echo "================================"

echo "INSTALLING PARALLELS"
cd ..
./install
