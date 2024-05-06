#!/bin/sh
# SPDX-License-Identifier: MIT

# set -x

# load config file for default podman parameters
if [ -f  ${root_path}/conf/podman_lib.conf ]; then
    printf "$0: include default podman parameters from ${root_path}\n"
    . ${root_path}/conf/podman_lib.conf
else
    printf "$0: podman lib default parameters not found - exit\n"
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


# podman check states
podman_check_state() {

    # active containers
    log -info "list active container"
    podman ps -a

    # list images
    log -info "list active images"
    podman images

    # list active networks
    log -info "list active networks"
    podman network ls

    # list active volumes
    log -info "list active volumes"
    podman volume ls
}


# podman-compose reset
podman_compose_reset() {

    log -info "podman-compose reset"
    podman-compose restart
}

# podman-compose stop
podman_compose_stop() {

    log -info "podman-compose stop"
    podman-compose stop
}


# podman-compose start
podman_compose_start() {

    log -info "podman-compose start"
    podman-compose start
}


# setup podman debian
podman_setup_system_debian() {

    # install software
    log -info "install podman software"
    continue_yes_no
    sudo apt-get install podman podman-compose

    #test podman
    log -info "test podman system with hello world"
    continue_yes_no
    podman run hello-world

}


# setup podman freebsd
podman_setup_system_bsd() {

    # install software
    log -info "install podman software"
    continue_yes_no
    pkg install podman

    # not finished

}

# delete podman data
podman_delete_data() {

    log -info "try shutdown all compose instances"
    podman-compose down

    log -info "try shutdown the rest of the containers"
    podman stop $(podman ps -a -q) 

    log -info "reset podman instances"
    podman rm -f $(podman ps -a -q)
    podman rmi $(podman images -a -q)
    podman network rm $(podman network ls -q)
    podman volume rm $(podman volume ls -q)

    log -info "running instances"
    podman ps -a

    log -info "available offline images"
    podman images

}

# delete local data
# $1 path for podman volume
podman_delete_local_data() {

    log -info "delete prductive data/volume"

    # check volume parameter
    if [ ! -z $1 ]; then
        log -info "volume parameter $1 not found"
        exit 1
    else
        log -info "volume parameter found $1"
    fi

    # remove volume data
    if [ -d $1 ] && \
        [ ! $1 = "/" ] && \
        [ ! -z $1 ]; then
            log -info "delete filed in $1"
            rm -r $1
    fi
}