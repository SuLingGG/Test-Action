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
node=$(curl -sL https://downloads.openwrt.org/snapshots/packages/$platform/packages | grep node_v | sed 's/.*\href="//g' | sed 's/\">node.*//g')
echo $node
libnghttp2=$(curl -sL https://downloads.openwrt.org/snapshots/packages/$platform/packages | grep libnghttp2 | sed 's/.*\href="//g' | sed 's/\">libnghttp2.*//g')
echo $libnghttp2
libhttp_parser=$(curl -sL https://downloads.openwrt.org/snapshots/packages/$platform/packages | grep libhttp-parser | sed 's/.*\href="//g' | sed 's/\">libhttp-parser.*//g')
echo $libhttp_parser

## Preset node binaries to files/usr/bin & files/usr/lib
# Perset node
mkdir -p files
pushd files
wget -q https://downloads.openwrt.org/snapshots/packages/$platform/packages/$node
tar zxvf $node ./data.tar.gz
tar zxvf data.tar.gz
chmod +x usr/bin/node
rm -f $node data.tar.gz

# Preset libnghttp2
wget -q https://downloads.openwrt.org/snapshots/packages/$platform/packages/$libnghttp2
tar zxvf $libnghttp2 ./data.tar.gz
tar zxvf data.tar.gz
rm -f $libnghttp2 data.tar.gz

# Preset libhttp-parser
wget -q https://downloads.openwrt.org/snapshots/packages/$platform/packages/$libhttp_parser
tar zxvf $libhttp_parser ./data.tar.gz
tar zxvf data.tar.gz
rm -f $libhttp_parser data.tar.gz
chmod +x usr/lib/*

popd
