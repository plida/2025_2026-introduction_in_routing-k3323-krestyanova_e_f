#!/bin/sh
ip route del defalt via 172.16.16.1 dev eth0
udhcpc -i eth1
