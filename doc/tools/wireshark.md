<!-- omit in toc -->
# wireshark 🦈

wireshark short documentation

<!-- omit in toc -->
## contents

- [sample capture filters](#sample-capture-filters)
- [sample display filters](#sample-display-filters)


## sample capture filters

define after interface selection  
reduces size of caputres packages

capture from specific host or network

```sh
host 192.168.1.30
net 192.168.0.0/24
net 192.168.0.0 mask 255.255.255.0
src net 192.168.0.0 mask 255.255.255.0
dst net 192.168.0.0 mask 255.255.255.0
```

capture from specific port

```sh
port 53
host www.google.com and not (port 80 or port 443)
port not 53 and not arp
tcp portrange 100-200
```

## sample display filters

define at the upper taskbar  
hide packages in the packet list

some ip expressions

```sh
ip.addr == 192.168.45.5
ip.dest == 192.168.45.5
ip.src == 192.168.45.6
ip.addr >= 192.168.45.5 and ip.addr <= 192.168.45.50
ip.addr == 192.168.45.5 and ip.addr == 192.168.45.50
!(ip.addr == 192.168.45.7)
ip.addr == 192.168.45.1/24
ip.addr == 192.168.45.1/24 and ip.addr == 192.168.45.2/24
```

watch port/protocol

```sh
tcp.port eq 25 or icmp
```

tcp buffer full

```sh
tcp.window_size == 0 && tcp.flags.reset != 1
```

filter out windows noise

```sh
smb || nbns || dcerpc || nbss || dns
```

slice mac adress to monitor specific devices

```sh
eth.addr[0:3]==00:06:5B
```

monitor uri request

```sh
http.request.uri matches "gl=se$"
```

 