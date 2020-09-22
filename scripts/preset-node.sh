#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

node_ipk=$(curl -sL https://downloads.openwrt.org/snapshots/packages/aarch64_cortex-a53/packages/index.html | grep node_v | sed 's/.*\href="//g' | sed 's/\">node.*//g'

wget -qO- https://downloads.openwrt.org/snapshots/packages/aarch64_cortex-a53/packages/$node_ipk | tar xOvz -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game

chmod +x files/etc/openclash/core/clash*
