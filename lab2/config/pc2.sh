#!/bin/sh
echo PC2 > /etc/hostname
udhcpc -i eth1
