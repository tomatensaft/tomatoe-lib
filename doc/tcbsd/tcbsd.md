<!-- omit in toc -->
# tcbsd commands 👨‍🔧

<!-- omit in toc -->
## contents

## tc system service

tc system servive tool

```sh
TcSysExe.exe 
```

tc system service options

```sh
--osImageVersion
--platformId
--netID
--fingerprint
--mode
--run
--config 
```

## tc realtime ethernet

show ethernet realtime settings

```sh
TcRteConfig show
```

disable realtime ethernet

```sh
TcRteConfig disable igb.1
```

## tc core

show actual core configuration

```sh
TcCoreConf
```

## restorepoints / snapshots

create restorepoint

```sh
restorepoint create your-restorepoint
```

list restorepoints

```sh
restorepoint status
```

rollback restorepoints

```sh
restorepoint rollback    
restorepoint rollback factoryreset 
```

## backupscript

backuo drive

```sh
sh -c “TcBackup.sh --disk /dev/ada0 > backup.bckp”
sh -c "TcBackup.sh --disk /dev/ada1 < backup.bckp”
```

## ads logger

ads logger

```sh
tcamslog -c -r -s 20 -f testlog
```

ads logger options

```sh
(l)isten, (p)ort, (c)apture, (f)ile, (d)ir, (s)ize, (r)ingpuffer
```

## tc registry

change net id and registry parameters

```sh
/usr/local/etc/TwinCAT/3.1/TcRegistry.xml
```

## ads router

add ads route from console

```sh
ads 192.168.0.231 addroute --addr=192.168.0.1 --netid=192.168.0.1.1.1 --password=1 --routename =example.beckhoff.com
```
