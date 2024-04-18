#!/bin/sh
# SPDX-License-Identifier: MIT

# set -x

# load config file for default alpine parameters
if [ -f  ${root_path}/conf/alpine_lib.conf ]; then
    printf "$0: include default alpine parameters from ${root_path}\n"
    . ${root_path}/conf/alpine_lib.conf
else
    printf "$0: alpine lib default parameters not found - exit\n"
    exit 1
fi

# check if script root path is set from main script
if [ ! -z ${root_path} ]; then
	printf "$0: script root path set - use ${root_path} for include\n"
else
	printf "$0: script rootpath ${root_path} not found\n"
	exit 1
fi

# include external libs from git module
if [ -f  ${root_path}/src/standard_lib.sh ]; then
    printf "$0: include script from ${root_path}\n"
    . ${root_path}/src/standard_lib.sh
else
    printf "$0: standardlib not found - exit\n"
    exit 1
fi

# install .net framework
setup_dotnet_installscript() {

    log -info "get dotnet installation script"
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh

    log -info "dotnet install"
    chmod +x ./dotnet-install.sh

    # install latetest sdk
    ./dotnet-install.sh --version latest

    # runtime with aspnetcore
    #./dotnet-install.sh --version latest --runtime aspnetcore

    # install defined branch e.g. net 8
    #./dotnet-install.sh --channel 8.0

}