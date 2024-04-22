<!-- omit in toc -->
# filesystem 🗄️

<!-- omit in toc -->
## contents

- [geom - geometric partitioning](#geom---geometric-partitioning)
- [gpart - partitioning](#gpart---partitioning)
- [uefi - partitioning](#uefi---partitioning)
- [ufs - unix file system](#ufs---unix-file-system)
- [zfs - zettabyte filesystem](#zfs---zettabyte-filesystem)
- [zpool - virtual storage pool](#zpool---virtual-storage-pool)
- [beadm/bectl - boot environments](#beadmbectl---boot-environments)
- [disk state](#disk-state)
- [images](#images)
- [flags - disk state](#flags---disk-state)

## geom - geometric partitioning

list disks

```sh
geom disk list
```

## gpart - partitioning

show partitions

```sh
gpart show
gpart show -l daX
```

delete/destroy partitions `-F` force

```sh
gpart delete -i 2 adaX
gpart destroy daX
gpart destroy -F daX
```

create paritions `-s` gpt/mbr sheme

```sh
gpart create -s gpt daX 
```

add partitions

```sh
gpart add -a 1m -t freebsd-swap -s 8g -l swap daX 
gpart add -t freebsd-boot -l boot -s 512K daX -l Label
gpart add -a 1m -t freebsd-ufs 5g -l root daX
gpart add -a 1m -t freebsd-ufs 5g -l tmp daX
gpart add -a 1m -t freebsd-ufs 100g -l var daX
gpart add -a 1m -t freebsd-ufs -l usr daX
```

resize parition

```sh
gpart resize -i 6 -s 100g -a 1m daX 
```

modify/change partitions

```sh
gpart modify -i 2 -l rootfs vtbdX
gpart modify -i 2 -t freebsd-zfs vtbdX
```

## uefi - partitioning

create partition for uefi loader

```sh
gpart create -s gpt daX
gpart add -t efi 800K daX
dd if=/boot/boot1.efidat of=/dev/daXpY    
```

## ufs - unix file system

```sh
newfs /dev/gpt/var
newfs -L var /dev/adaXsYd
tunefs tuning
growfs growing
mksnap_ffs .sanp/bevoreupgrade
fsck check filesystem
```

## zfs - zettabyte filesystem

list datasets

```sh
zfs list
```

set quota limit

```sh
zfs set qutota=2G zroot/usr/home
```

get mountstatus

```sh
zfs get mounted zroot/ROOT
```

get compression info

```sh
zfs get Compression
```

example zfs create

```sh
zfs create zroot/usr/local
zfs create -o canmount=off zroot/var/db/
zfs create zroot/var/db/sql
zfs create zroot/var/db/sql/dataset
chown -R sql:sql /var/db/sql

zfs create zroot/usr/local/sql-new
tar cfC - /usr/local/sql . | tar xpfC - /usr/local/sql-new
mv /usr/local/sql /usr/local/sql-old
zfa rename zroot/use/local/sql-new zroot/usr/local/sql

zfs destroy zroot/usr/local
zfs rename zroot/use/local zroot/use/new-local
```

create snapshot

```sh
zfs snapshot zroot/usr/home@2020-0101-00-00-00
zfs list -t snapshot
zfs destroy zroot/usr/home@2020-0101-00-00-00
```

## zpool - virtual storage pool

list zpools

```sh
zpool list
```

status zpools

```sh
zpool status jail
zpool get all zroot
zpool get readonly
```

create zpool

```sh
zpool create db mirror gpt/zfs3 gpt/zfs4 mirror
zpool create scratch gpt/zfs3 gpt/zfs4 striped
zpool create db raidz gpt/zfs3 gpt/zfs4 gpt/zfs5 raidz
```

destroy zpool

```sh
zpool destroy db
```

clean zpool

```sh
zpool scrub zroot
zpool scrub -s zroot cancel
```

switch zpool on/offline

```sh
zpool online 12345 guid
zpool offline db gpt/zfs6
```

replace parition of zpool

```sh
zpool replace db gpt/zfs3 gpt/zfs6
```

## beadm/bectl - boot environments

list boot env

```sh
beadm list
```

create boot env

```sh
beadm create 2020-01-01-00-00-00
```

activate boot env

```sh
beadm activate 2020-01-01-00-00-00
```

destroy boot env

```sh
beadm destroy 2020-01-01-00-00-00
```

mount with different types `msdosfs` `cd9669` `udf` `ext2fs` `ext3fs`

```sh
mount -t msdosfs
```

## disk state

free storage `-h` human readable

```sh
df -h 
```

## images

create file images

```sh  
truncate -s 1G fielsystem.file
mdconfig -a -t vnode -f filesystem.file
newfs -j /dev/md0 create UFS filesystem
```

## flags - disk state

`noschg` wirte protection / `-R` remove

```sh
chflags -R noschg
```
