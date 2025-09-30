/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.NY

/ip address
add address=10.20.6.2/30 interface=ether2
add address=10.20.7.2/30 interface=ether3
add address=192.168.11.1/24 interface=ether4

/ip pool
add name=dhcp-pool ranges=192.168.11.10-192.168.11.100
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=192.168.11.0/24 gateway=192.168.11.1