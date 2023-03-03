#!/bin/bash

# This script sets up the Ansible repository and installs the latest version.

# Add Ansible repository
apt-add-repository ppa:ansible/ansible -y

# Update package lists
apt-get update

# Install Ansible
apt-get install ansible -y
