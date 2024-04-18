#!/bin/sh
# SPDX-License-Identifier: MIT

# set -x

# load config file for default git parameters
if [ -f  ${root_path}/conf/git_lib.conf ]; then
    printf "$0: include default git parameters from ${root_path}\n"
    . ${root_path}/conf/git_lib.conf
else
    printf "$0: git lib default parameters not found - exit\n"
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

# submodule init with the merge way
git_submodule_init_merge() 
{
    log -info "submodule update/update"
    git submodule update --init

    log -info "submodule update/fetch"
    git fetch

    log -info "submodule update/merge"
    git merge origin/master
}

# submodule init with update
git_submodule_update() 
{

    log -info "submodule update remote"
    git submodule update --recursive --remote

}

#change git file at the end of the line - branch = main
