# Ansible Pull Repository

This repository is designed for Ansible Pull-based configuration management.

## Structure

- `playbooks/`: Contains the main playbook and any additional playbooks.
- `roles/`: Reusable roles for tasks.
- `group_vars/` and `host_vars/`: Variables for groups and hosts.
- `bootstrap/ansible-pull.sh`: Script to run `ansible-pull`.

## Usage

Run the following command to pull and apply configurations:

```bash
./bootstrap/ansible-pull.sh
```

Set up a cron job for periodic pulls:

```bash
*/30 * * * * /path/to/bootstrap/ansible-pull.sh
```
