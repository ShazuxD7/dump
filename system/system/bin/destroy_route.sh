#! /system/bin/sh

PeerAddr=`/system/bin/getprop "net.ppp0.remote.addr"`
DNS1=`/system/bin/getprop "net.ppp0.dns1"`
DNS2=`/system/bin/getprop "net.ppp0.dns2"`



NETWORK_ID=123

#    0      1      2      3      4       5         6            7           8
# network route [legacy <uid>]  add   <netId> <interface> <destination> [nexthop]
# network route [legacy <uid>] remove <netId> <interface> <destination> [nexthop]
ndc network route remove $NETWORK_ID ppp0 10.0.0.0/24
ndc network route remove $NETWORK_ID ppp0 0.0.0.0/0 ${PeerAddr}


#    0        1       2       3         4
# network interface  add   <netId> <interface>
# network interface remove <netId> <interface>
ndc network interface remove $NETWORK_ID ppp0

#destroy rule
ndc network destroy $NETWORK_ID

#clear dns
ndc resolver clearnetdns ${NETWORK_ID}

#clear ppp0 from legacy_system
ip route del default table legacy_system dev ppp0

#clear properties
#/system/bin/setprop "net.ppp0.remote.addr" ""
#/system/bin/setprop "net.ppp0.dns1" ""
#/system/bin/setprop "net.ppp0.dns2" ""

#tear down
ifconfig ppp0 down
#kill pppd
#killall -9 pppd