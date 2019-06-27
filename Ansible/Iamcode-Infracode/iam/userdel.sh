#!/bin/bash
echo $1
name=$1
ansible-playbook  --extra-vars  "Username=$name" removeuser.yml 
