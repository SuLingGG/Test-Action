#!/bin/bash
#=================================================
# File name: preset-node-binary.sh
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Get device platform
pushd bin/packages/*
platform=$(basename `pwd`)
echo "The device platform is $platform"
popd

# Get node ipk filename
node_ipk=$(curl -sL https://downloads.openwrt.org/snapshots/packages/$platform/packages | grep node_v | sed 's/.*\href="//g' | sed 's/\">node.*//g')
echo "The node ipk filename is $node_ipk"

# Preset node binary to files/usr/bin/
mkdir -p files
pushd files
wget -q https://downloads.openwrt.org/snapshots/packages/$platform/packages/$node_ipk
tar zxvf node*.ipk ./data.tar.gz
tar zxvf data.tar.gz
chmod +x usr/bin/node
rm -f node* data.tar.gz
popd
