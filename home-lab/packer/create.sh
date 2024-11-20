#!/bin/bash
set -e

################ Packer
# init 
packer init .

# validate
packer validate -var-file=proxmox_creds.hcl  .

# build
packer build -var-file=proxmox_creds.hcl  .



