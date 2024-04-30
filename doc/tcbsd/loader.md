<!-- omit in toc -->
# bsd bootloader 🚀

<!-- omit in toc -->
## contents

- [help](#help)
- [disk infos](#disk-infos)
- [variables](#variables)
- [boot](#boot)

## help

shows help

```sh
?
```

## disk infos

list known disks

```sh
lsdev
```

select disk

```sh
set currdev="diskXsY"
```

set mountpoint

```sh
set vfs.root.mountfrom="ufs:/dev/adaXsYa"
```

## variables

show bootloader variables

```sh
show
```

## boot

boot selected disk

```sh
boot
```
