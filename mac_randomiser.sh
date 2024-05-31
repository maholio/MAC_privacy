#!/bin/sh /etc/rc.common

START=99

start() {
    random_mac() {
        loc_mac_numgen=$(od -An -N2 -tx1 /dev/urandom | tr -dc '0123456789abcdef' | fold -w 12 | head -n 1)
        loc_mac_formatted=$(echo "$loc_mac_numgen" | awk '{printf "%s:%s:%s:%s:%s:%s", substr($0,1,2),substr($0,3,2),substr($0,5,2),substr($0,7,2),substr($0,9,2),substr($0,11,2)}')
        echo "$loc_mac_formatted"
    }

    bssid_gen() {
        uci set wireless.@wifi-iface[1].macaddr="$(random_mac)"
        uci set wireless.@wifi-iface[0].macaddr="$(random_mac)"
        uci commit wireless
        wifi
    }

    mac_gen() {
        uci set network.@device[1].macaddr="$(random_mac)"
        uci set glconfig.general.macclone_addr="$(random_mac)"
        uci commit network
        /etc/init.d/network restart
    }

    bssid_gen
    mac_gen
}
