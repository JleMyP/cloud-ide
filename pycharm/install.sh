#!/bin/bash

set -e

~/.local/bin/projector --accept-license autoinstall \
  --config-name charm \
  --ide-name "PyCharm Community Edition 2021.3.1"

pipx install poetry

# cython debugger and etc
sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y gcc python3-dev

# translations, plantuml
ide-plugins 8579 7017

installed_ides=(/home/tim/.config/JetBrains/PyCharm*)
ide_path=${installed_ides[0]}

sudo chown tim:tim /tmp/disabled_plugins.txt
sudo chown -R tim:tim /tmp/options
cp /tmp/options/* $ide_path/options/
cp /tmp/disabled_plugins.txt $ide_path/
