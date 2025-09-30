/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.HKI

/ip address
add address=10.20.1.2/30 interface=ether2
add address=10.20.5.1/30 interface=ether3
add address=10.20.3.1/30 interface=ether4

/routing ospf instance
add name=inst router-id=10.255.255.2
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst
/routing ospf network
add area=backbonev2 network=10.20.1.0/30
add area=backbonev2 network=10.20.3.0/30
add area=backbonev2 network=10.20.5.0/30
/interface bridge
add name=loopback
/ip address 
add address=10.255.255.2/32 interface=loopback network=10.255.255.2