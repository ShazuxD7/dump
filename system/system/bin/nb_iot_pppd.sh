#! /system/bin/sh

#/system/bin/setprop "net.gprs.ppp-exit" ""

#/system/bin/pppd call option-at
#sleep 0.5
#/system/bin/pppd call option-ppp
pppd debug noauth crtscts 115200 local ipv6 ::5 /dev/ttyS3
#pppd noauth nocrtscts nocdtrcts 115200 local  ipv6 ::5 /dev/ttyS2
#PPPD_EXIT=$?
#PPPD_PID=$!
#
#/system/bin/log -t pppd "pppd exited with $PPPD_EXIT"
#/system/bin/setprop "net.gprs.ppp-exit" "$PPPD_EXIT"
#/system/bin/setprop "net.gprs.pppd.pid" "$PPPD_PID"

#sleep 20
#echo now set selinux state back to $sl_state
#setenforce $sl_state
#getenforce