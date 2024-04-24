<!-- omit in toc -->
# commands 💻

## mount external usb drive for testing with drvfs

- format external usb drive in windows with ntfs
- determine windows drive letter - for example `g:`
- loging into the wsl2/debian instance, make a direcotry and mount the drive

```sh
mkdir /mnt/f
mount -t drvfs f: /mnt/f
```
