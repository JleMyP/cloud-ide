#!/bin/bash

# example: plugins 123 456

# ide=$1
# shift

set -e

plugins=$@

installed_ides=($HOME/.projector/apps/*)
ide_path=${installed_ides[0]}
echo $installed_ides
echo $ide_path
wd=/tmp/ide-plugins
host='https://plugins.jetbrains.com'

mkdir $wd || true

for plugin in $plugins
do
  update_id=$(curl --no-progress-meter "$host/api/plugins/$plugin/updates" | jq -r '.[0].id')
  echo "update id $update_id"
  wget -q -O $wd/$plugin.zip "$host/plugin/download?rel=true&updateId=$update_id"
  echo "downloaded $plugin"
done

unzip $wd/\*.zip -d $ide_path/plugins/
rm -rf $wd
