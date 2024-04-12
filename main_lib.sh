#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# check if script root path is set from main script
if [ ! -z ${SCRIPT_ROOT_PATH} ]; then
	printf "$0: script root path set - use ${SCRIPT_ROOT_PATH} for include\n"
else
	printf "$0: script rootpath ${SCRIPT_ROOT_PATH} not found \n"
	exit 1
fi

# check if lib configuration loaded allready
if [ ! -z ${LIB_CONF_LOADED} ] && [ ${LIB_CONF_LOADED} = "YES" ]; then
	printf "$0: lib configuration file found - use remote configuration\n"
else
    # load config file for default main remote parameters
    if [ -f  ${SCRIPT_ROOT_PATH}/main_lib.conf ]; then
        printf "$0: include default main parameters from ${SCRIPT_ROOT_PATH}\n"
        . ${SCRIPT_ROOT_PATH}/main_lib.conf
    # load config file for default main local parameters    
    else
        printf "$0: main lib parmaeter file nor found - use local\n"
        . ${SCRIPT_ROOT_PATH}/main_lib.conf
    fi
fi

# test include external libs from debian submodule
if [ ${LIB_DEBIAN} = "ENABLED" ]; then
    printf "$0: lib debian enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/debian_lib.sh ]; then
        . ${SCRIPT_ROOT_PATH}/src/debian_lib.sh
    else
        printf "$0: debian external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib debian diabled.\n"
fi

# test include external libs from alpine submodule
if [ ${LIB_ALPINE} = "ENABLED" ]; then
    printf "$0: lib alpine enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/alpine_lib.sh ] && [ ${LIB_ALPINE} = "ENABLED" ]; then
        . ${SCRIPT_ROOT_PATH}/src/alpine_lib.sh
    else
        printf "$0: alpine external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib alpine diabled.\n"
fi

# test include external libs from docker submodule
if [ ${LIB_DOCKER} = "ENABLED" ]; then
    printf "$0: lib docker enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/docker_lib.sh ] && [ ${LIB_DOCKER} = "ENABLED" ]; then
        . ${SCRIPT_ROOT_PATH}/src/docker_lib.sh
    else
        printf "$0: docker external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib docker diabled.\n"
fi

# test include external libs from git submodule
if [ ${LIB_GIT} = "ENABLED" ]; then
    printf "$0: lib git enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/git_lib.sh ] && [ ${LIB_GIT} = "ENABLED" ]; then
        . ${SCRIPT_ROOT_PATH}/src/git_lib.sh
    else
        printf "$0: git external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib git diabled.\n"
fi

# test include external libs from tls submodule
if [ ${LIB_TLS} = "ENABLED" ]; then
    printf "$0: lib tls enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/tls_lib.sh ] && [ ${LIB_TLS} = "ENABLED" ]; then
        . ${SCRIPT_ROOT_PATH}/src/tls_lib.sh
    else
        printf "$0: tls external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib tls diabled.\n"
fi

# test include external libs from tcbsd submodule
if [ ${LIB_TCBSD} = "ENABLED" ]; then
    printf "$0: lib tcbsd enabled.\n"
    if [ -f  ${SCRIPT_ROOT_PATH}/src/tcbsd_lib.sh ] && [ ${LIB_TCBSD} = "ENABLED" ]; then
        . ${SCRIPT_ROOT_PATH}/src/tcbsd_lib.sh
    else
        printf "$0: tcbsd external libs not found - exit.\n"
        exit 1
    fi
else
    printf "$0: lib tcbsd diabled.\n"
fi

#print header
print_header "debug tomatoe-lib"