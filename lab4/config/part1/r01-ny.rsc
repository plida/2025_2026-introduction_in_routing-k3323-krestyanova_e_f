/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.NY

/ip address
add address=10.20.2.1/30 interface=ether2
add address=192.168.11.1/24 interface=ether3

/ip pool
add name=dhcp-pool ranges=192.168.11.10-192.168.11.100
/ip dhcp-server
add address-pool=dhcp-pool disabled=no interface=ether3 name=dhcp-server
/ip dhcp-server network
add address=192.168.11.0/24 gateway=192.168.11.1

/interface bridge
add name=loopback
/ip address 
add address=10.255.255.6/32 interface=loopback network=10.255.255.6

/routing ospf instance
add name=inst router-id=10.255.255.6
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst
/routing ospf network
add area=backbonev2 network=10.20.2.0/30
add area=backbonev2 network=192.168.11.0/24
add area=backbonev2 network=10.255.255.6/32

/mpls ldp
set lsr-id=10.255.255.6
set enabled=yes transport-address=10.255.255.6
/mpls ldp advertise-filter 
add prefix=10.255.255.0/24 advertise=yes
add advertise=no
/mpls ldp accept-filter 
add prefix=10.255.255.0/24 accept=yes
add accept=no
/mpls ldp interface
add interface=ether2

/routing bgp instance
set default as=65000 router-id=10.255.255.6
/routing bgp peer
add name=peerLND remote-address=10.255.255.4 remote-as=65000 route-reflect=no update-source=loopback
/routing bgp network
add network=10.255.255.6/32

/ip route vrf
add routing-mark=VRF_DEVOPS interface=ether2 
/routing bgp instance vrf 
add routing-mark=VRF_DEVOPS 