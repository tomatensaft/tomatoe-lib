<!-- omit in toc -->
# fireall 🔥

firewall `pf` is used as standard

<!-- omit in toc -->
## contents

- [fireall configuration](#fireall-configuration)
- [configuration examples](#configuration-examples)

## fireall configuration

```sh
pass on                             -> in/out-going data traffic
pass in                             -> in-going data traffic
pass out                            -> out-going data traffic
quick                               -> next rules will be ignored
keep state                          -> established connection will not be checked anymore
tables                              -> save more ip addresses / ip ranges
```

## configuration examples

some rules

```sh
pass in quick proto tcp to port 48898 synproxy state
pass in quick proto tcp to port 502 keep state
table <intranet> { 192.168.0.0/24, 192.168.1.0/24, !192.168.0.1 }
```

simple pf config `~/etc/pf.conf`

```sh
### INTERFACES ###
if = "{ lo0, rl0 }"

### SETTINGS ###
set block-policy drop

### OFFENE TCP/UDP-PORTS ###
tcp_pass = "{ 53 2031 }"
udp_pass = "{ 53 2031 }"
icmp_types = "echoreq"

### NORMALISATION ###
scrub in all
antispoof for $if

### TABLES ###
table <intranet>   { 192.168.0.0/24 }
table <bruteforce> persist

### RULES ###
set skip on lo0
block all
block quick from <bruteforce>
pass in quick from <intranet> to any keep state
pass in on $if proto tcp from any to any port $tcp_pass flags S/SA keep state (max-src-conn 100, max-src-conn-rate 15/5, overload <bruteforce> flush global)
pass in on $if proto udp to any port $udp_pass keep state
pass out quick all keep state

# PING #
pass in on $if inet proto icmp all icmp-type $icmp_types keep state

# TRACEROUTE #
pass in on $if inet proto udp from any to any port 33433 >< 33626 keep state
```
