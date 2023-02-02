#!/bin/bash

sudo pacman -S --noconfirm --needed ansible
ansible-galaxy collection install kewlfft.aur

echo
read -s -p "SUDO password for Ansible: " password

ansible-playbook -u $USER user-input.yml -e "ansible_become_password=${password}"
ansible-playbook -u $USER install-arch.yml -e "ansible_become_password=${password}"
ansible-playbook -u $USER link-dotfiles.yml -e "ansible_become_password=${password}"
ansible-playbook -u $USER configure.yml -e "ansible_become_password=${password}"

source ~/.bashrc
