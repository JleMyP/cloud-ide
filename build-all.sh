#!/bin/bash

set -e

for variant in base pycharm
do
  packer build -var-file=variables.json $variant/image.json
done
