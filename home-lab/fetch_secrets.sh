#!/bin/bash


# TO DO 
# fetch all secrets for all the tools from one password


################ SSH
# get ssh  key
# eval "$(ssh-agent -s)"
# ssh-add - <<< $(op read "op://HomeLab/home lab ssh key/private key")

# get ssh keys
mkdir ~/.ssh
op read "op://HomeLab/home lab ssh key/public key" --out-file ~/.ssh/id_rsa.pub
op read "op://HomeLab/home lab ssh key/private key" --out-file ~/.ssh/id_rsa

# OP service account token
# export OP_SERVICE_ACCOUNT_TOKEN=ops_eyJzaWduSW5BZGRyZXNzIjoibXkuMXBhc3N3b3JkLmV1IiwidXNlckF1dGgiOnsibWV0aG9kIjoiU1JQZy00MDk2IiwiYWxnIjoiUEJFUzJnLUhTMjU2IiwiaXRlcmF0aW9ucyI6NjUwMDAwLCJzYWx0IjoiUUNYYy1wTDUtakdCaDlTVjFHb1lpUSJ9LCJlbWFpbCI6ImF2ZGxyZ3JramU3dm9AMXBhc3N3b3Jkc2VydmljZWFjY291bnRzLmV1Iiwic3JwWCI6IjExNjFkMmYwNTQ3NDgxNTBmOTEwOWMxZDEzYTllZjFiNGY0ZjZiYzhlNTFlNWZkMWI5NmI5ZjQwZjY3NWEyNTciLCJtdWsiOnsiYWxnIjoiQTI1NkdDTSIsImV4dCI6dHJ1ZSwiayI6IkpoTlhxWXZfWlVIUmZZVURYbGhSaEMyd0hVZUZrN01qalljVi13dXJqRm8iLCJrZXlfb3BzIjpbImVuY3J5cHQiLCJkZWNyeXB0Il0sImt0eSI6Im9jdCIsImtpZCI6Im1wIn0sInNlY3JldEtleSI6IkEzLUhFS1JFSi1NOEtLN00tQkhDVDgtODVUSkstUVk1OEUtUzJUR1kiLCJ0aHJvdHRsZVNlY3JldCI6eyJzZWVkIjoiZmE0NGNlMDM0ZThhMzdkMDNjZmQzZWFhZDEzMWIxNGRjNDlkZTAzMDI2NTYxNDg2ZmI1N2IzNDg2OWRhODNhNyIsInV1aWQiOiJVQ05KT05GMlFaQ0c1TDI3TlJDN1NLRFNJSSJ9LCJkZXZpY2VVdWlkIjoicHNla3FsdHVjdDZjaGF6ZG82eXA2cGd2M3EifQ
