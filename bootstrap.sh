#!/bin/bash

# make sure /etc/ansible/hosts is setup correctly
ansible-playbook -u minecraft --tag="$1" playbook.yml