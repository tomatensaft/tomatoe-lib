<!-- omit in toc -->
# network 💻

<!-- omit in toc -->
## contents

- [ip aqddress](#ip-aqddress)
- [dns naming](#dns-naming)
- [network interfaces](#network-interfaces)
- [network routes](#network-routes)

## ip aqddress

set static ip address with console

```sh
ifconfig em0 inet 192.168.3.4 255.255.255.0
ifconfig em0 inet 192.168.3.4/24
```

for persistent mode in `rc.conf`

```sh
ifconfig_igb1="inet 192.168.5.7 netmask 255.255.255.0" 
ifconfig_em0="DHCP
```

multiple ip addresses with console

```sh
ifconfig em0 inet alias 192.168.3.10/24
```

for persistent mode in `rc.conf`

```sh
ifconfig_em0_alias0="inet 192.168.3.10/24"
```

## dns naming

configuration exmaples for `resolv.conf`

```sh
search lan                      
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 192.168.1.254
name_servers="8.8.8.8 8.8.4.4"  
```

generate resolv.conf

```sh
resolvconf -ugenerate resolv.conf
```

## network interfaces

interface naming

```sh
ifconfig em1 name test1
```

for persistent mode in `rc.conf`

```sh
ifconfig_em1_name="test1"
```

cloning / virtual interfaces in `rc.conf`

```sh
cloned_interfaces="tap0"
ifconfig_tap0="inet 192.168.5.7 netmask 255.255.255.0"
```

## network routes

different route examples

```sh
route add default 192.168.1.1
route add -net 192.168.2.0/24 192.168.1.2
defaultrouter="192.168.1.1"         -> entry rc.conf
static_routes="internalnet2"
route_internalnet2="-net 192.168.2.0/24 192.168.1.2"
static_routes="net1 net2"
route_net1="-net 192.168.0.0/24 192.168.0.1"
route_net2="-net 192.168.1.0/24 192.168.1.1"
```

default gateway in `rc.conf`

```sh
gateway_enable="YES"
```

network service `start` `stop` `restart`  

```sh
service netif restart
```

example vlan interface

```sh
ifconfig interface.tag create vlan tag vlandev interface
ifconfig em0.2 create vlan 2 vlandev em0
ifconfig em0.2 inet 192.168.3.4/24
ifconfig em0.2 create vlan 2 vlandev em0 inet 192.168.3.4/24
vlans_em0="2 3"                     -> entry rc.conf
ifconfig_em0_2="inet 192.168.56.4/28"
ifconfig_em0_3="inet 198.45.3.2/24"
ifconfig_em0="up"
```

---

[OpenBSD pf](https://www.openbsdhandbook.com/pf/anchors/)
[Dummynet Bridge](https://lists.freebsd.org/pipermail/freebsd-ipfw/2006-July/002549.html)
