/user
add name=plida password=letmein group=full
remove admin
/system identity
set name=R01.HKI

/ip address
add address=10.20.1.2/30 interface=ether2
add address=10.20.5.1/30 interface=ether3
add address=10.20.3.1/30 interface=ether4