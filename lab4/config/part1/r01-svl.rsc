/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.SVL

/ip address
add address=10.20.3.1/30 interface=ether2
add address=192.168.12.1/24 interface=ether3

/ip pool
add name=dhcp-pool ranges=192.168.12.10-192.168.12.100
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether3 name=dhcp-server
/ip dhcp-server network
add address=192.168.12.0/24 gateway=192.168.12.1

/interface bridge
add name=loopback
/ip address 
add address=10.255.255.3/32 interface=loopback network=10.255.255.3

/routing ospf instance
add name=inst router-id=10.255.255.3
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst
/routing ospf network
add area=backbonev2 network=10.20.3.0/30
add area=backbonev2 network=192.168.12.0/24
add area=backbonev2 network=10.255.255.3/32

/mpls ldp
set lsr-id=10.255.255.3
set enabled=yes transport-address=10.255.255.3
/mpls ldp advertise-filter 
add prefix=10.255.255.0/24 advertise=yes
add advertise=no
/mpls ldp accept-filter 
add prefix=10.255.255.0/24 accept=yes
add accept=no
/mpls ldp interface
add interface=ether2

/routing bgp instance
add name=default as=65000 router-id=10.255.255.3
/routing bgp peer
add name=peerLBN remote-address=10.20.3.2 remote-as=65000 route-reflect=no