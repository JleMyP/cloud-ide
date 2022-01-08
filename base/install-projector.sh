#!/bin/bash

set -e

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  libxext6 libxrender1 libxtst6 libfreetype6 libxi6 libxss1 \
  libnss3 libxrandr2 libatk1.0-0 libatk-bridge2.0-0 \
  libxcomposite1 libxkbcommon0 libxdamage1 libxfixes3 \
  libgdm1 libcups2 libxshmfence1 \
  unzip jq \
  python3-venv

curl https://bootstrap.pypa.io/get-pip.py | sudo python3 -
sudo pip install pipx

sudo -u tim pipx install projector-installer
sudo -u tim mkdir /home/tim/dev
