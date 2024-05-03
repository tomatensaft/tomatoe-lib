<!-- omit in toc -->
# setup wsl2/debian 👺

setup wsl system for use with a windows system

## slect distribution

- list available dirtsibutions with `wsl --list --online`
- list installed dirtsibutions with `wsl --list --verbose`

## wsl version

- optianl set wsl version to 2 `wsl --set-default-version 2`

## install wsl2/debian

- open powershell as adminisrator and type `wsl --install -d debian`
- maybe on problems with users and/or network, reset the winsock `netsh winsock reset`
- restart host machine and check if wsl is running correctly

## enable systemd and automount of windows drives

```sh
wsl --update --web-download
wsl --user root printf '[boot]\\nsystemd=true\\n' '>' /etc/wsl.conf
wsl --user root printf '\\n[automount]\\nenabled=true\\nroot=/mnt/\\noptions=\"umask=000,case=off\"\\n' '>>' /etc/wsl.conf
wsl --shutdown

wsl --user root systemctl status
wsl --set-default debian
```
