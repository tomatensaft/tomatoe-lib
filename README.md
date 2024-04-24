<!-- omit in toc -->
# tomatoe-lib 📚 🍅

tomatoe-lib for tcbsd and linux

<!-- omit in toc -->
## contents

- [universal helping docs](#universal-helping-docs)
- [setup](#setup)
- [usage](#usage)
- [main parameters](#main-parameters)
- [boilerplates](#boilerplates)
- [debug](#debug)
- [libraries](#libraries)
- [general rules for repo functions](#general-rules-for-repo-functions)
- [tests](#tests)
- [sources](#sources)

## universal helping docs

- alpine / linux [alpine](doc/alpine/)
- debian / linux [debian](doc/debian/)
- tcbsd / freebsd [tcbsd](doc/tcbsd/)
- qemu commands [qemu](doc/qemu/)
- docker commands [docker](doc/docker/)
- posix commands [posix](doc/posix/)
- windows commands [windows](doc/windows/)
- python commands [python](doc/python/)

## setup

- add `git add submodule https://github.com/tomatensaft/tomatoe-lib` in the git project
- for using the latest version include the `git_lib.sh` and update the submodulde `git_submodule_update`

## usage

- create `[shell_script_name].conf` in the same folder as the main script and adjust libs which wants to load
- adjust the correspondent config file for the shell script in the same folder as the shell script
- e.g. `shell_bp.sh` -> `shell_bp.conf`
- adjust in the `tomatoe-lib` folder the corresponding lib file e.g. `./conf/debian_lib.conf`
- execute the created script `[shell_script_name].sh`

## main parameters

```sh
root_path="${PWD%/*}"
main_lib="${root_path}/main_lib.sh"
app_name="${0##*/}"
app_fullname="${PWD}/${app_name}"
conf_default="$(echo "$app_fullname" | sed 's/.\{2\}$/conf/')"
```

include lib in main script - adjust in `[shell_script_name].conf`
addional load custon file with 2nd parameter `shell_script_name --xxx -custom.conf`

```sh
# load config file for default parameters
if [ -f  ${conf_default} ]; then
    printf "$0: include default parameters from ${conf_default}\n"
    . ${conf_default}
else
    printf "$0: config lib default parameters not found - exit\n"
    exit 1
fi

# load config file for custom parameters
if [ ${conf_custom} != "none" ]; then
    if [ -f  ${conf_custom} ]; then
        printf "$0: include custom parameters from ${conf_custom}\n"
        . ${conf_custom}
    else
        printf "$0: config lib custom parameters not found - exit\n"
        exit 1
    fi
else
    printf "$0: no custom file in arguments - not used\n"
fi

# test include external libs from main submodule
if [ -f  ${main_lib} ]; then
    . ${main_lib}
else
    printf "$0: main libs not found - exit.\n"
    exit 1
fi
```

## boilerplates

there are some boilerplates for python and shell

- posix shell standard [standard](boilerplates/posix-shell/)
- powershell standard [standard](boilerplates/power-shell/)
- virtual environment python [standard](boilerplates/venv-python/)
- docker python [docker](boilerplates/docker-python/)

## debug

different automation helpers for debug applications

- mqtt [mqtt](debug/mqtt/)
- opcua [opcua](debug/opcua/)
- modbus [modbus](debug/modbus/)
- posix-shell [posix](debug/posix-shell/)
- power-shell [power-shell](debug/power-shell/)

## libraries

- linux(debian) [lib](src/debian_lib.sh)
- freebsd (tcbsd) [lib](src/tcbsd_lib.sh)
- docker [lib](src/docker_lib.sh)
- git [lib](src/git_lib.sh)
- standard functions [lib](src/standard_lib.sh)
- linux(debian) [lib](src/debian_lib.sh)
- linux(alpine) [lib](src/alpine_lib.sh)
- twincat-bsd (tcbsd) [lib](src/tcbsd_lib.sh)
- docker [lib](src/docker_lib.sh)
- git [lib](src/git_lib.sh)
- standard function [lib](src/standard_lib.sh)
- tls library [lib](src/tls_lib.sh)

## general rules for repo functions

success return code

```sh
0/false success / item found
```

error return code

```sh
1/true error / item not found
```

## tests

- not testet completly

## sources

---

[v0.2.4]
