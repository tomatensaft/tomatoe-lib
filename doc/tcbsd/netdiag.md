<!-- omit in toc -->
# network diagnosis 🌀

network diagnosis

<!-- omit in toc -->
## contents

- [tcpdump](#tcpdump)
- [netstat](#netstat)
- [sockstat](#sockstat)
- [hping3 for test purposes](#hping3-for-test-purposes)

## tcpdump

some command examples

```sh
tcpdump -D
tcpdump -i ens3
tcpdump -i 2 "port http"
tcpdump -i 2  port http -v
tcpdump -i 2  port http -vvv
tcpdump -i 2  "port http" -ASCII
tcpdump -i 2  "port http" -X
tcpdump -i 2  port http -q -n

tcpdump -i 2  tcp
tcpdump -i 2  udp
tcpdump -i 2  icmp
tcpdump -i 2  arp
tcpdump -i 2  ip

tcpdump -i 2  dst google.com
tcpdump -i 2  portrange 70-90
```

## netstat

netstat examples

```sh
netstat -w 5 -d

netstat -na -f inet

netstat -m #Mem
```

## sockstat

sockstat examples

```sh
sockstat -4
```

## hping3 for test purposes

hping3 code examples

```sh
hping3 -c 15000 -d 120 -S -w 64 -p 8080 --flood --rand-source xx.xx.xx.xx

hping3 -c 15000 -d 120 -S -w 64 -p 8080 --flood -a zz.zz.zz.zz xx.xx.xx.xx

hping3 -a zz.zz.zz.zz xx.xx.xx.xx -S -q -p 8080

hping3 -S — scan 21–500 xx.xx.xx.xx

hping3 -S -p 80 xx.xx.xx.xx — flood

hping3 — icmp — flood xx.xx.xx.xx

hping3 --syn --flood --rand-source --destport 443 xx.xx.xx.xx

hping3 --icmp --spoof xx.xx.xx.xx yy.yy.yy.yy

doas hping3 -S xx.xx.xx.xx -p 8080 -c 15000

hping3 -S xx.xx.xx.xx -p 8080 -c 1

```
