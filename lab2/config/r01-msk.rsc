/ip address
add address=172.16.64.1/30 interface=ether2
add address=172.16.192.2/30 interface=ether3
add address=10.1.0.1/16 interface=ether4
/ip pool
add name=dhcp-pool ranges=10.1.0.10-10.1.255.254
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=10.1.0.0/16 gateway=10.1.0.1
/ip route
add distance=1 dst-address=10.2.0.0/16 gateway=172.16.64.2
add distance=1 dst-address=10.3.0.0/16 gateway=172.16.192.1
/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.MSK
