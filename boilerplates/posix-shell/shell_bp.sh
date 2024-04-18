#!/bin/sh
#SPDX-License-Identifier: MIT

#set -x

# set absolute path of root app for global use - relative path from this point
# ${PWD%/*} -> one folder up / ${PWD%/*/*} -> two folders up 
# adjust script application path/folder
# configuration file will be the same main name as the shell script - but only with .conf extension

# option
option=${1}

# script parameter
root_path="${PWD%/*/*}" # "${PWD%/*}/tomatoe-lib/"
main_lib="${root_path}/main_lib.sh"
app_name="${0##*/}"
app_fullname="${PWD}/${app_name}"
conf_default="$(echo "$app_fullname" | sed 's/.\{2\}$/conf/')"
conf_custom=${2:-"none"}

# header of parameter
printf "\nparameters load - $(date +%Y-%m-%d-%H-%M-%S)\n"
printf "########################################\n\n"

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

# test include external libs from debian submodule
if [ -f  ${main_lib} ]; then
    . ${main_lib}
else
    printf "$0: main libs not found - exit.\n"
    exit 1
fi

# print main parameters
print_main_parameters

# print header
print_header "debug tomatoe-lib"

# check min requirements of args
check_args $# 1

# main functions
main() {

    # check inputargs
    case ${option} in
            --test)
                log -info "test command for debugging $0"
                test_configuration
                ;;

            --create)
                log -info "create"
                check_root
                check_requirements
                # call function
                ;;

            --start)
                log -info "start"
                check_requirements
                # call fcuntion
                ;;

            --stop)
                log -info "stop"
                check_requirements
                # call function
                ;;

            --delete)
                log -info "delete"
                # call function
                ;;

            --help | --info | *)
                usage   "\-\-test:                          test command" \
                        "\-\-create (configfile):           create" \
                        "\-\-start (configfile):            start" \
                        "\-\-stop (configfile):             stop" \
                        "\-\-delete:                        delete" \
                        "\-\-help:                          help"
                ;;
    esac
}


# check reqirements - always local
check_requirements() {

    # check ls -> replace ls
    if command -v ls >/dev/null 2>&1 ; then
        log -info "ls program Found"
    else
        log -info "ls program Not Found"
        cleanup_exit ERR
    fi 
}

# call main function manually - if not need uncomment
main "$@"; exit