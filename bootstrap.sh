#!/bin/bash

# make sure /etc/ansible/hosts is setup correctly
pushd ansible
	ansible-playbook -u minecraft -e "remote_path=/home/minecraft" $1.yml
popd