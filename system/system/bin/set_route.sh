#! /system/bin/sh

PeerAddr=`/system/bin/getprop "net.ppp0.remote.addr"`
DNS1=`/system/bin/getprop "net.ppp0.dns1"`
DNS2=`/system/bin/getprop "net.ppp0.dns2"`

ip route add table legacy_system 100.0.0.0/8 dev ppp0 
ip route add table legacy_system default via ${PeerAddr} dev ppp0

NETWORK_ID=123
ndc network create $NETWORK_ID
ndc network interface add $NETWORK_ID ppp0
ndc network route add $NETWORK_ID ppp0 10.0.0.0/24
ndc network route add $NETWORK_ID ppp0 0.0.0.0/0 ${PeerAddr}
ndc network default set ${NETWORK_ID}
ndc resolver setnetdns ${NETWORK_ID} "" ${DNS1} ${DNS2}