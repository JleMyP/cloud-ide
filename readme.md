# Builds images with jetbrains ide for yandex cloud

produce at least two image:
- base image with projector
- and based on it image with concrete ide

## base

with python3, pipx, projector, and some tools. ssh is listening 10025 port.  
also creating user `tim` with sudo permissions

## pycharm

install pycharm community, poetry and python3-dev with gcc for cython debbuger

## requirements

- hashicorp packer
- yandex cloud account with service account token

## usage

fill variables.json with credentials and run `build_all.sh`  
for (re)building only second image, run `packer build -var-file=variables.json pycharm/image.json`

## todo

- allow to rebuild images separately with script
- add pycharm professional edition
- add other ide's
- terraform for autocreating instances
