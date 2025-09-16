/ip address
add address=10.2.0.2/30 interface=ether3
add address=10.3.0.1/30 interface=ether2
add address=172.16.128.1/18 interface=ether4
/ip pool
add name=dhcp-pool ranges=172.16.128.2-172.16.191.254
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=172.16.128.0/18 gateway=172.16.128.1
/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.BRL
