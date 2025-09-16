/ip address
add address=172.16.0.1/18 interface=ether4
/ip pool
add name=dhcp-pool ranges=172.16.0.2-172.16.63.254
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=172.16.0.0/18 gateway=172.16.0.1
/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.MSK
