/ip address
add address=172.16.128.1/30 interface=ether2
add address=172.16.64.2/30 interface=ether3
add address=10.2.0.1/16 interface=ether4
/ip pool
add name=dhcp-pool ranges=10.2.0.10-10.2.255.254
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=10.2.0.0/16 gateway=10.2.0.1
/ip route
add distance=1 dst-address=10.1.0.0/16 gateway=172.16.64.1
add distance=1 dst-address=10.3.0.0/16 gateway=172.16.128.2
/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.FRT
