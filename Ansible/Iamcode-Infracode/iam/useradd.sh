#!/bin/bash
echo $1
name=$1
#read -p "Enter Your Name: "  name
terraform plan -var "name=$name"
terraform apply -var "name=$name"
terraform output > $name.txt
rm -rf terraform.tfstate terraform.tfstate.backup
mv /root/iam/$name.txt /tmp
echo "IAM detail file available in /tmp"
