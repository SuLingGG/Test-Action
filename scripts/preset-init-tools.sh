#!/bin/bash
#=================================================
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Creat init-tools files
mkdir -p files/boot
cp -r ../data/init files/boot

# Mod default-settings
pushd package/lean/default-settings/files
sed -i '/exit/i\bash /boot/init/init-scripts.sh' zzz-default-settings
popd
