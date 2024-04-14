#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# set absolute path of root app for global use - relative path from this point
# ${PWD%/*} -> one folder up / ${PWD%/*/*} -> two folders up 
# adjust script application path/folder
# configuration file will be the same main name as the shell script - but only with .conf extension

SCRIPT_ROOT_PATH="${PWD%/*}"
SCRIPT_MAIN_LIB="${SCRIPT_ROOT_PATH}/main_lib.sh"
SCRIPT_APP_NAME="${0##*/}"
SCRIPT_APP_FULLNAME="${PWD}/${SCRIPT_APP_NAME}"
SCRIPT_CONF_FULLNAME="$(echo "$SCRIPT_APP_FULLNAME" | sed 's/.\{2\}$/conf/')"


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

# print main parameters
print_main_parameters

# print header
print_header "debug tomatoe-lib"


log -info "test boilerplate"

# inlude automatically
#create_folder ${CERT_LOCATION}
#openssl_x509_rsa

