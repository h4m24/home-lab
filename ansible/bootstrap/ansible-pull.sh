#!/bin/bash
ansible-pull -U https://github.com/h4m24/home-lab.git -i localhost ansible/playbooks/main.yaml
