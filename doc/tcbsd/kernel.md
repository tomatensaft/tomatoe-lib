<!-- omit in toc -->
# bsd kernel ⚔️

kernel information

<!-- omit in toc -->
## contents

- [kernel states](#kernel-states)
- [kernel modules](#kernel-modules)

## kernel states

system tunables

```sh
sysctl
    kern
    vm
    vfs 
    net
    debug
    hw
    machdep
    user
    p1003_1b
    kstat
    dev
    security
```  

## kernel modules

view modules

```sh
kldstat
```

load module

```sh
kldload XY
```
