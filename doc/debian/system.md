<!-- omit in toc -->
# system 👻

<!-- omit in toc -->
## contents

- [base commands](#base-commands)
- [systemctl](#systemctl)
- [journalctl](#journalctl)

## base commands

## systemctl

systemd interface for control/manipulate services
the `.service` tag is optional

start application

```sh
systemctl start docker.service
```

stop application

```sh
systemctl stop docker.service
```

restart application

```sh
systemctl restart docker.service
```

reload application parameter

```sh
systemctl reload docker.service
```

enable application

```sh
systemctl enable docker.service
```

disable application

```sh
systemctl diable docker.service
```

state if application is enables

```sh
systemctl is-enabled docker.service
```

status application

```sh
systemctl status docker.service
```

state if application is active

```sh
systemctl is-active docker.service
```

state if application is failed

```sh
systemctl is-failed docker.service
```

list units of systemd

```sh
systemctl list-units
systemctl list-units --all
systemctl list-units --all --state=inactive
systemctl list-units --all --type=service
```

list unit files of systemd

```sh
systemctl list-unit-files
```

display an unit file

```sh
systemctl cat docker.service
```

display dependencies

```sh
systemctl list-dependencies docker.service
```

systemd get default target

```sh
systemctl get-default
```

systemd set default target

```sh
sudo systemctl set-default graphical.target
```

systemd list targets

```sh
systemctl list-units --type=target
```

systemd shortcuts

```sh
systemctl rescue
systemctl halt
systemctl poweroff
systemctl reboot
```

## journalctl

central organization of different system messages
the configuration file you will find at `/etc/systemd/journald.conf`

list timezones

```sh
timedatectl list-timezones
```

set corrent timezone for timestamps

```sh
timedatectl set-timezone zone
```

show actual timezone

```sh
timedatectl status
```

show all system messages

```sh
journalctl
journalctl --utc
```

show messages of the actual boot process

```sh
journalctl -b
```

show messages with a specified timespan

```sh
journalctl --since "2022-01-01 15:15:00"
journalctl --since "2022-01-01" --until "2023-01-01 01:00"
journalctl --since yesterday
journalctl --since 01:00 --until "5 hours ago"
```

filter messages

```sh
journalctl -u docker.service
journalctl -u docker.service --since today
journalctl /usr/bin/bash
```

show kernel messages

```sh
journalctl -k
```

show last 5 messages

```sh
journalctl -n 5
```

set duration of message buffer

```sh
journalctl --vacuum-time=2years
```
