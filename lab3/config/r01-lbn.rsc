/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.LBN

/ip address
add address=10.20.4.2/30 interface=ether2
add address=10.20.5.2/30 interface=ether3
add address=10.20.7.1/30 interface=ether4

/routing ospf instance
add name=inst router-id=10.255.255.5
/routing ospf area
add name=backbonev2 area-id=0.0.0.0 instance=inst

/routing ospf network
add area=backbonev2 network=10.20.4.0/30
add area=backbonev2 network=10.20.5.0/30
add area=backbonev2 network=10.20.7.0/30

/ip address 
add address=10.255.255.5/32 interface=loopback network=10.255.255.5