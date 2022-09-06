#!/bin/bash

# make sure /etc/ansible/hosts is setup correctly
ansible-playbook -u minecraft $1.yml