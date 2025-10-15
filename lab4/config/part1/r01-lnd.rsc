/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.LND

/ip address
add address=10.20.2.2/30 interface=ether2
add address=10.20.13.1/30 interface=ether3
add address=10.20.11.2/30 interface=ether4

/interface bridge
add name=loopback
/ip address 
add address=10.255.255.4/32 interface=loopback network=10.255.255.4

/routing ospf instance
add name=inst router-id=10.255.255.4
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst
/routing ospf network
add area=backbonev2 network=10.20.2.0/30
add area=backbonev2 network=10.20.11.0/30
add area=backbonev2 network=10.20.13.0/30
add area=backbonev2 network=10.255.255.4/32

/mpls ldp
set lsr-id=10.255.255.4
set enabled=yes transport-address=10.255.255.4
/mpls ldp advertise-filter 
add prefix=10.255.255.0/24 advertise=yes
add advertise=no
/mpls ldp accept-filter 
add prefix=10.255.255.0/24 accept=yes
add accept=no
/mpls ldp interface
add interface=ether2
add interface=ether3
add interface=ether4