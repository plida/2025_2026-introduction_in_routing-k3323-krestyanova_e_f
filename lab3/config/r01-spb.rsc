/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.SPB

/ip address
add address=10.20.1.1/30 interface=ether2
add address=10.20.2.1/30 interface=ether3
add address=192.168.10.1/24 interface=ether4

/ip pool
add name=dhcp-pool ranges=192.168.10.10-192.168.10.100
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether4 name=dhcp-server
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1

/routing ospf instance
add name=inst router-id=10.255.255.1
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst
/routing ospf network
add area=backbonev2 network=10.20.1.0/30
add area=backbonev2 network=10.20.2.0/30
add area=backbonev2 network=192.168.10.0/24
/interface bridge
add name=loopback
/ip address 
add address=10.255.255.1/32 interface=loopback network=10.255.255.1