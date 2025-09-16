#!/bin/sh
echo PC3 > /etc/hostname
udhcpc -i eth1
