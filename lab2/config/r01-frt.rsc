/ip address
add address=172.16.64.1/18 interface=ether4
/ip pool
add name=dhcp-pool ranges=172.16.64.2-172.16.127.254
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=172.16.64.0/18 gateway=172.16.64.1
/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.FRT
