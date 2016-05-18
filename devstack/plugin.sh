#!/bin/bash

# devstack/plugin.sh
# Setup MariaDB as database backend for Devstack


if is_service_enabled mysql && is_ubuntu; then

    function cleanup_database_mysql {
        cleanup_mariadb
    }

    function configure_database_mysql {
        configure_mariadb
    }

    function install_database_mysql {
        install_mariadb
    }

    if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
        # nothing needed here
        :
    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "Installing MariaDB"
        install_mariadb
    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        echo_summary "Configuring MariaDB"
        configure_mariadb
    fi
    if [[ "$1" == "unstack" ]]; then
        echo_summary "Stopping MariaDB"
        stop_mariadb
    fi
    if [[ "$1" == "clean" ]]; then
        echo_summary "Removing MariaDB"
        cleanup_mariadb
    fi
else
    die $LINENO "MariaDB plugin requires mysql service enabled and ubuntu."
fi

## Local variables:
## mode: shell-script
## End:
