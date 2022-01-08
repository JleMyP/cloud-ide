#!/bin/bash

set -e

sapt="sudo DEBIAN_FRONTEND=noninteractive apt-get"

sudo apt-mark hold cloud-init
$sapt update && $sapt upgrade -y
$sapt install tmux git htop -y

cd /usr/local/bin && curl https://getmic.ro | sudo bash
echo "alias m=micro" | sudo tee -a /etc/bash.bashrc

sudo timedatectl set-timezone Asia/Yekaterinburg
$sapt install language-pack-ru -y
sudo localectl set-locale LANG=ru_RU.utf8

sudo swapoff -a
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon -a

sudo useradd -m -s /bin/bash -U tim
echo 'tim ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers.d/tim
sudo -u tim -H bash -c "echo 'set -g mouse on' > ~/.tmux.conf"

sudo sed -i -r 's/.?Port .*/Port 10025/' /etc/ssh/sshd_config
sudo sed -i 's/ports=22/ports=10025/' /etc/ufw/applications.d/openssh-server
sudo ufw allow OpenSSH
sudo ufw default deny incoming
sudo ufw --force enable
