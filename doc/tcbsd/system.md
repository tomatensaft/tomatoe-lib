<!-- omit in toc -->
# system 👻

<!-- omit in toc -->
## contents

## boot messages

```sh
dmseg  
var/run_demseg.boot
```

## importand files

enable/disable system service and daemons

```sh
rc.conf
```

tunables that can be set only at boot time

```sh
loader.conf
```

tunable that can be set at any time

```sh
sysctl.conf
```

safely add rc.conf parameter - check correctly

```sh
sysrc                  
```

kernel state read/write

```sh
sysctl  
```

view libraries

```sh
ldconfig -r
```

check rc.conf

```sh
sh /etc/rc.conf
```

## shell cript debug

start debug

```sh
set -x
```

stop debug

```sh
set +x
```

## rescue singleuser boot

mount zroot for writing

```sh
zfs mount –a 
zfs set readonly=off zroot/ROOT/default
```

## rights executebales

change mode

```sh
chmod -R 755 /tmp
```

## pci - tools

scan pci bus

```sh
pciscan -lv
```

## shell

change shell

```sh
chsh –s tcsh
```

## compression archives

tar extract `-x`

```sh
tar -xzvf
tar -xvf  
```

tar create `-c`

```sh
tar -cfz
tar -cfv
```

tar list `-t`

```sh
tar -tvf
```

unzip archive

```sh
unzip
```

## access hardware devices

ata style

```sh
/dev/ada*
```

scsi / usb

```sh
/dev/da*
```

cd

```sh
/dev/cd*
```

access to the camcontrol subsystem

```sh
camcontrol devlist
```

## logging

log messages

```sh
/var/log/messages
```

security messages

```sh
/var/log/security
```

## startprocess

boot kernel

```sh
kernel
```

bootstrap

```sh
loader
```

process control init  

```sh
init
```

runlevel control

```sh
rc
```

terminal login

```sh
getty
```  

### cron

edit ctrotab

```sh
crontab -e
```
