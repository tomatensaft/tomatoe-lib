<!-- omit in toc -->
# packages 📦

## package system

update meta data

```sh
pkg update
```

upgrade system `-n` see changes

```sh
pkg upgrade
pkg upgrade -n                      
```

list installes packages

```sh
pkg info
```

install package

```sh
pkg install XY
```

deinstall package

```sh
pkg delete XY
```  

clean pkg cache

```sh
pkg clean 
```

install offline package

```sh
pkg add XY 
```

search package in cache

```sh
pkg search 
```

package query

```sh
pkg query
    %n - Package name
    %o - Port Package
    %v - version
    %c - comment
```

package query example for non automatic packages

```sh
pkg query -e '%a = o' %n
```

remove unused dependecies

```sh
pkg autoremove
 ```

lock package for update

```sh
pkg lock
```

list locked packages

```sh
pkg lock -l             
```

unlock packages

```sh
pkg unlock
```

display local package location

```sh
pkg which
```

check checksum of package

```sh
pkg check
```
