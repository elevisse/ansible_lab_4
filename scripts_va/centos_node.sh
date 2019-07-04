#!/bin/sh
yum update
yum install -y sudo
useradd ansible -m -s "/bin/bash"
usermod -aG wheel ansible
passwd ansible << EOF
vagrant
vagrant
EOF
sed -i "s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
echo "ansible     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
service sshd restart
