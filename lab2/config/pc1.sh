#!/bin/sh
echo PC1 > /etc/hostname
udhcpc -i eth1
