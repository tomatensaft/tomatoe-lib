#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# check if script root path is set from main script
if [ ! -z ${root_path} ]; then
	printf "$0: script root path set - use ${root_path} for include\n"
else
	printf "$0: script rootpath ${root_path} not found \n"
	exit 1
fi

# check if lib configuration loaded allready
if [ ! -z ${lib_conf_loaded} ] && [ ${lib_conf_loaded} = "YES" ]; then
	printf "$0: lib configuration file found - use remote configuration\n"
else
    # load config file for default main remote parameters
    if [ -f  ${root_path}/main_lib.conf ]; then
        printf "$0: include default main parameters from ${root_path}\n"
        . ${root_path}/main_lib.conf
    # load config file for default main local parameters    
    else
        printf "$0: main lib parmaeter file nor found - use local\n"
        . ${root_path}/main_lib.conf
    fi
fi

# test include external libs from debian submodule
if [ ${lib_debian} = "ENABLED" ]; then
    printf "$0: lib debian enabled.\n"
    if [ -f  ${root_path}/src/debian_lib.sh ]; then
        . ${root_path}/src/debian_lib.sh
    else
        printf "$0: debian external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib debian diabled.\n"
fi

# test include external libs from alpine submodule
if [ ${lib_alpine} = "ENABLED" ]; then
    printf "$0: lib alpine enabled.\n"
    if [ -f  ${root_path}/src/alpine_lib.sh ] && [ ${lib_alpine} = "ENABLED" ]; then
        . ${root_path}/src/alpine_lib.sh
    else
        printf "$0: alpine external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib alpine diabled.\n"
fi

# test include external libs from docker submodule
if [ ${lib_docker} = "ENABLED" ]; then
    printf "$0: lib docker enabled.\n"
    if [ -f  ${root_path}/src/docker_lib.sh ] && [ ${lib_docker} = "ENABLED" ]; then
        . ${root_path}/src/docker_lib.sh
    else
        printf "$0: docker external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib docker diabled.\n"
fi

# test include external libs from podman submodule
if [ ${lib_podman} = "ENABLED" ]; then
    printf "$0: lib podman enabled.\n"
    if [ -f  ${root_path}/src/podman_lib.sh ] && [ ${lib_podman} = "ENABLED" ]; then
        . ${root_path}/src/podman_lib.sh
    else
        printf "$0: podman external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib podman diabled.\n"
fi

# test include external libs from git submodule
if [ ${lib_git} = "ENABLED" ]; then
    printf "$0: lib git enabled.\n"
    if [ -f  ${root_path}/src/git_lib.sh ] && [ ${lib_git} = "ENABLED" ]; then
        . ${root_path}/src/git_lib.sh
    else
        printf "$0: git external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib git diabled.\n"
fi

# test include external libs from tls submodule
if [ ${lib_tls} = "ENABLED" ]; then
    printf "$0: lib tls enabled.\n"
    if [ -f  ${root_path}/src/tls_lib.sh ] && [ ${lib_tls} = "ENABLED" ]; then
        . ${root_path}/src/tls_lib.sh
    else
        printf "$0: tls external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib tls diabled.\n"
fi

# test include external libs from tcbsd submodule
if [ ${lib_tcbsd} = "ENABLED" ]; then
    printf "$0: lib tcbsd enabled.\n"
    if [ -f  ${root_path}/src/tcbsd_lib.sh ] && [ ${lib_tcbsd} = "ENABLED" ]; then
        . ${root_path}/src/tcbsd_lib.sh
    else
        printf "$0: tcbsd external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib tcbsd diabled.\n"
fi

#print header
print_header "debug tomatoe-lib"