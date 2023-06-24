#!/bin/sh

if ! type zsh > /dev/null 2>&1; then
    echo ' => Installing script dependency Zsh.'

    if "$(awk -F= '$1=="ID" { print $2 ;}' /etc/*-release)" != "fedora"; then
        sudo apt-get -y update
        sudo apt-get -y install zsh
    else
        sudo dnf -y update
        sudo dnf -y install zsh
    fi
fi

SCRIPT=$(readlink -f "${0}")
SCRIPT_DIR=$(dirname "${SCRIPT}")

zsh ${SCRIPT_DIR}/build-linux.zsh "${@}"
