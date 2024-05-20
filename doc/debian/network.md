<!-- omit in toc -->
# network 💻

network commands / settings

<!-- omit in toc -->
## contents

- [setup](#setup)
- [ip addresses](#ip-addresses)
- [network interfaces](#network-interfaces)
- [network routing](#network-routing)

## setup

setup ip environment

```sh
ip -colored=always link
ip -c link
```

## ip addresses

show ip address

```sh
ip address
ip a
ip address dev enp2s0f0
ip address show type bridge
ip address show type vlan
```

## network interfaces

show network devices

```sh
ip link
ip l
ip link show enp2s0f0
```

enable / disable interfaces

```sh
ip link set enp2s0f0 up
ip link set enp2s0f0 down
```

change mac adress

```sh
ip link set dev enp2s0f0 address aa:bb:cc:dd:ee:ff
```

show arp cache

```sh
ip neighbour
```

delete arp chache entry

```sh
ip neigh del 192.168.1.1 dev enp2s0f0
```

show tcp cache and metrics

```sh
ip tcp_metrics
```

## network routing

show routing information

```sh
ip route
```

test route for a specific address

```sh
ip route get 192.168.2.123
```

add / delete routes

```sh
ip route add default via 192.168.1.1 dev enp2s0f0
ip route add 192.168.1.0/24 via 192.168.1.1
ip route delete 192.168.1.0/24 via 192.168.1.1
```
