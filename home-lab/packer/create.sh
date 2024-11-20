################ SSH
# get ssh  key
# eval "$(ssh-agent -s)"
# ssh-add - <<< $(op read "op://HomeLab/home lab ssh key/private key")

# get ssh keys
mkdir ~/.ssh
op read "op://HomeLab/home lab ssh key/public key" --out-file ~/.ssh/id_rsa.pub
op read "op://HomeLab/home lab ssh key/private key" --out-file ~/.ssh/id_rsa




################ Packer

# validate
packer validate -var-file=proxmox_creds.hcl  .

# build
packer init ./ubuntu-server-noble.pkr.hcl
packer build -var-file=proxmox_creds.hcl  .



