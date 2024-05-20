<!-- omit in toc -->
# firewall🔥

firewall `iptables` is used as standard

<!-- omit in toc -->
## contents

- [persistent data](#persistent-data)
- [how to use](#how-to-use)
- [basic firewall command parameters](#basic-firewall-command-parameters)
- [configuration examples](#configuration-examples)

## persistent data

the standard configuration of iptable dont save the configuration peristent  
for this you can install the `iptables-persistent` package  
and safe it with `netfilter-persistent save`

the second way is to store it with `iptables-save > /etc/iptables/iptables.rules`  
and restore it with `iptables-restore < /etc/iptables/iptables.rules`

## how to use

you can set up the firewallwith commands or create a shell script  

## basic firewall command parameters

```sh
# standard chains
INPUT                              -> all in-going traffic
OUTPUT                             -> all out-going traffic
FORWARD                            -> all forwarded traffic - e.g. router

# modes
ACCEPT                             -> accept package
DROP                               -> drop package
QUEUE                              -> moce package in a user queue
RETURN                             -> return package to source
```

list rules exmaples

```sh
iptables -L
iptables -S
iptable -L INPUT
```

flush/delete rules

```sh
iptables -F
iptables -F INPUT
```

create you own chain

```sh
iptables -N CUSTOM
iptables -F CUSTOM
iptables -A CUSTOM -s 192.168.99.0 -j DROP
```

accept package when no ipnut rule in machting

```sh
iptables -P INPUT ACCEPT
```

delete rule by name in chain

```sh
iptables -D test -s 192.168.99.10 -j DROP
```

insert rule in chain

```sh
iptables -I CUSTOM 1 -s 192.168.99.4 -j DROP
```

## configuration examples

some rules

```sh
iptables -A FORWARD -i enp3s0f0 -o enp2s0f0 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -s 192.168.99.4 -j DROP
iptables -A INPUT -s 192.168.99.4 -j REJECT

sudo iptables -A INPUT -p tcp -s 192.168.99.0/24 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
```


configure simple example

```sh
# flush
sudo iptables -F

# drop all
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

# accept localhost
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# allow port 80/443
sudo iptables -A OUTPUT -o enp2s0f0 -p tcp --dport 80 --sport 1024:65535 -j ACCEPT
sudo iptables -A OUTPUT -o enp2s0f0 -p tcp --dport 443 --sport 1024:65535 -j ACCEPT

# allow in-going ssh
sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# allow outgoing ssh
sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# if established - accept
sudo iptables -A INPUT -i enp2s0f0 -m state -state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -o enp2s0f0 -m state -state RELATED,ESTABLISHED -j ACCEPT

```
