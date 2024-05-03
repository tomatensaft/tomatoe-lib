<!-- omit in toc -->
# settings 💾

optional setting for wsl

## contents

- [contents](#contents)
- [configuration files](#configuration-files)
- [wslconfig examples](#wslconfig-examples)
- [wsl.conf examples](#wslconf-examples)

## configuration files

- `.wslconfig` global file accros all dists
- `/etc/wsl.conf` local settings - seperatly for each dist

## wslconfig examples

examples for global settings (mslearn) [https://learn.microsoft.com/en-us/windows/wsl/wsl-config]

```sh

[wsl2]
memory=4GB 
processors=2
kernel=C:\\temp\\myCustomKernel
kernelCommandLine = vsyscall=emulate
swap=8GB
swapfile=C:\\temp\\wsl-swap.vhdx
pageReporting=false
localhostforwarding=true
nestedVirtualization=false
debugConsole=true

[experimental]
sparseVhd=true
```

## wsl.conf examples

example for local settings (mslearn) [https://learn.microsoft.com/en-us/windows/wsl/wsl-config]

```sh

[automount]
enabled = true
root = /
options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"
mountFsTab = true

[network]
hostname = DemoHost
generateHosts = false
generateResolvConf = false

[interop]
enabled = false
appendWindowsPath = false

[user]
default = DemoUser

[boot]
command = service docker start
```
