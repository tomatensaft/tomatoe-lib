<!-- omit in toc -->
# tomatoe-lib 📚 🍅

tomatoe-lib for tcbsd and linux

## contents

- [contents](#contents)
- [documentation](#documentation)
- [installation](#installation)
- [usage](#usage)
- [main parameters](#main-parameters)
- [boilerplates](#boilerplates)
- [debug](#debug)
- [libraries](#libraries)
- [tests](#tests)

## documentation

- alpine lib [doc](doc/apline_lib.md)
- debian lib [doc](doc/debian_lib.md)
- qemu lib [doc](doc/qemu_lib.md)
- posix shell [doc](doc/shell_script.md)
- power shell [doc](doc/powershell_script.md)
- python lib [doc](doc/python_lib.md)

## installation

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
SCRIPT_ROOT_PATH="${PWD%/*}"
SCRIPT_MAIN_LIB="${SCRIPT_ROOT_PATH}/main_lib.sh"
SCRIPT_APP_NAME="${0##*/}"
SCRIPT_APP_FULLNAME="${PWD}/${SCRIPT_APP_NAME}"
SCRIPT_CONF_FULLNAME="$(echo "$SCRIPT_APP_FULLNAME" | sed 's/.\{2\}$/conf/')"
```

include lib in main script - adjust in `[shell_script_name].conf`

```sh
# load config file for default parameters
if [ -f  ${SCRIPT_CONF_FULLNAME} ]; then
    printf "$0: include default parameters from ${SCRIPT_CONF_FULLNAME}\n"
    . ${SCRIPT_CONF_FULLNAME}
else
    printf "$0: git lib default parameters not found - exit\n"
    exit 1
fi

# test include external libs from debian submodule
if [ -f  ${SCRIPT_MAIN_LIB} ]; then
    . ${SCRIPT_MAIN_LIB}
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

- mqtt [mqtt](debug/mqtt)
- opcua [opcua](debug/opcua)
- modbus [modbus](debug/modbus)
- posix-shell [posix](debug/posix-shell)
- power-shell [power-shell](debug/power-shell)

## libraries

- linux(debian) [lib](debian_lib.sh)
- freebsd (tcbsd) [lib](tcbsd_lib.sh)
- docker [lib](docker_lib.sh)
- git [lib](git_lib.sh)
- standard functions [lib](standard_lib.sh)
- linux(debian) [lib](debian_lib.sh)
- linux(alpine) [lib](alpine_lib.sh)
- twincat-bsd (tcbsd) [lib](tcbsd_lib.sh)
- docker [lib](docker_lib.sh)
- git [lib](git_lib.sh)
- standard function [lib](standard_lib.sh)
- tls library [lib](tls_lib.sh)

## tests

- not testet completly
  
---

[v0.2.0]
