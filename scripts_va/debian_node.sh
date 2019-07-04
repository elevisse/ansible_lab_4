#!/bin/sh
apt-get update
apt install -y sudo
useradd ansible -m -s "/bin/bash"
usermod -aG sudo ansible
passwd ansible << EOF
vagrant
vagrant
EOF
sed -i "s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
echo "ansible     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
service sshd restart
