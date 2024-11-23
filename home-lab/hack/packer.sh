#!/bin/bash
set -e

show_help() {
    echo "Usage: $0 [-h] [-i] [-v] [-b]"
    echo "Options:"
    echo "  -h    Show help message"
    echo "  -i    Initialize Packer"
    echo "  -v    Validate Packer configuration"
    echo "  -b    Build Packer configuration"
}

while getopts "hivb" opt; do
    case ${opt} in
        h )
            show_help
            exit 0
            ;;
        i )
            INIT=true
            ;;
        v )
            VALIDATE=true
            ;;
        b )
            BUILD=true
            ;;
        \? )
            show_help
            exit 1
            ;;
    esac
done

if [ "$INIT" = true ]; then
    cd packer
    packer init .
    cd -
fi

if [ "$VALIDATE" = true ] || [ "$BUILD" = true ]; then
    if [ ! -f packer/proxmox_creds.hcl ]; then
        echo "Error: packer/proxmox_creds.hcl file not found!"
        exit 1
    fi
fi

if [ "$VALIDATE" = true ]; then
    cd packer
    packer validate -var-file=proxmox_creds.hcl .
    cd -
fi

if [ "$BUILD" = true ]; then
    cd packer
    packer build -var-file=proxmox_creds.hcl .
    cd -
fi



