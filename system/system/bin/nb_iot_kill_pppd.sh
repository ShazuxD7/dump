#! /system/bin/sh

sleep 0.001
#clear properties
/system/bin/setprop "net.ppp0.remote.addr" ""
/system/bin/setprop "net.ppp0.dns1" ""
/system/bin/setprop "net.ppp0.dns2" ""

#kill pppd
killall -9 pppd