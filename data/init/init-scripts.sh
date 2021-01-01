#!/bin/bash

# Init config file path
ConfigPath="/boot/init/init-config.txt"

# Import settings
EnableSettings="$(grep enable.init.settings $ConfigPath | awk -F ' = ' '{print $2}')"
LanIpaddr="$(grep network.lan.ipaddr $ConfigPath | awk -F ' = ' '{print $2}')"
LanDns="$(grep network.lan.dns $ConfigPath | awk -F ' = ' '{print $2}')"
LanGateway="$(grep network.lan.gateway $ConfigPath | awk -F ' = ' '{print $2}')"
LanBroadcast="$(grep network.lan.broadcast $ConfigPath | awk -F ' = ' '{print $2}')"
LanNetmask="$(grep network.lan.netmask $ConfigPath | awk -F ' = ' '{print $2}')"
LanDhcp="$(grep dhcp.lan $ConfigPath | awk -F ' = ' '{print $2}')"

# Apply LAN settings
if [ $EnableSettings = "true" ] ; then
    uci set network.lan.ipaddr=$LanIpaddr
    uci set network.lan.dns=$LanDns
    uci set network.lan.gateway=$LanGateway
    uci set network.lan.broadcast=$LanBroadcast
    uci set network.lan.netmask=$LanNetmask
    uci commit network
    if [ $LanDhcp != "enable" ] ; then
        uci delete dhcp.lan.leasetime
        uci delete dhcp.lan.limit
        uci delete dhcp.lan.start
        uci set dhcp.lan.ignore=1
        uci commit dhcp
    fi
    /etc/init.d/network restart
fi

