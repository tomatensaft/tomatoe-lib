<!-- omit in toc -->
# commands 💻

commands for the wsl

<!-- omit in toc -->
## contents

- [general commands](#general-commands)
- [network commands](#network-commands)
- [import / export distribution](#import--export-distribution)
- [mount drive](#mount-drive)

## general commands

general useful commands

update wsl system

```sh
wsl --update
```

get actual status of wsl

```sh
wsl --status
```

get version of wsl

```sh
wsl --version
```

get wsl help

```sh
wsl --help
```

run wsl as specific user

```sh
wsl --user **[testuser]**
```

shutdown wsl

```sh
wsl --shutdown
```

## network commands

identify ip address

```sh
wsl hostname -i
```

## import / export distribution

export wsl configuration to file

```sh
wsl --export debian debianExport.vhdx
```

import wsl to defined place

```sh
wsl --import debian C:\Data debianExport.vhdx
```

import wsl in place

```sh
wsl --import-in-place debian debianExport.vhdx
```

## mount drive

- format external usb drive in windows with ntfs
- determine windows drive letter - for example `g:`
- login into the wsl2/debian instance, make a direcotry and mount the drive

mount ext usb drive with drvfs

```sh
mkdir /mnt/f
mount -t drvfs f: /mnt/f
```
