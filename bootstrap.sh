#!/bin/bash

ansible-playbook -i hosts --private-key=$1 --tags="$2" -vv playbook.yml