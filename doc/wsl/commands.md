<!-- omit in toc -->
# commands 💻

commands for the wsl

<!-- omit in toc -->
## contents

- [general commands](#general-commands)
- [network commands](#network-commands)
- [import / export distribution](#import--export-distribution)
- [mount ext usb drive with drvfs](#mount-ext-usb-drive-with-drvfs)

## general commands

general useful commands

```sh

# update system
wsl --update

# wsl staus
wsl --status

# wsl version
wsl --version

# help
wsl --help

# run specific user
wsl --user testuser


# shiutdown
wsl --shutdown

```

## network commands

discover network for wsl instance

```sh

# identify ip address
wsl hostname -i

```

## import / export distribution

```sh

# export wsl dist to file
wsl --export debian debianExport.vhdx

# import wsl dist
wsl --import debian C:\Data debianExport.vhdx

# import in place
wsl --import-in-place debian debianExport.vhdx

```

## mount ext usb drive with drvfs

- format external usb drive in windows with ntfs
- determine windows drive letter - for example `g:`
- login into the wsl2/debian instance, make a direcotry and mount the drive

```sh
mkdir /mnt/f
mount -t drvfs f: /mnt/f
```
