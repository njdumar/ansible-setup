#!/bin/bash

read -s -p "SUDO password for Ansible to use: " password
echo ""

if [ -f /etc/debian_version ]; then
    echo "Debian distro detected"
    sudo apt install -y ansible
else
    echo "For now, just assume an Arch distro"
    sudo pacman -S --noconfirm --needed ansible
    ansible-galaxy collection install kewlfft.aur
fi

ansible-galaxy collection install -r requirements.yml
ansible-playbook -u $USER playbooks.yml -e "ansible_become_password=${password}"

source ~/.bashrc
