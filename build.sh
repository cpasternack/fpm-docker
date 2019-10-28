#!/usr/bin/env bash

############################################################
# Author: CPasternack <cpasternack@users.noreply.github.com>
# Date: 27/10/2019
# Description: Bash script to build docker image locally,
#  change REGISTRY to reflect your registry.
# License: MIT
############################################################

AUTHOR=`git config user.name`
EMAIL=`git config user.email`
VERSION=""
REGISTRY=localhost
USAGE="build.sh [pkg-type] [distro] [version]\n\tpkg-type: (deb,rpm)\n\tdistro: (ubuntu,centos)"
GITINSTALLED=`which git`

if [ $# -eq 0 ] || [ -z ${GITINSTALLED} ]
then
  echo -e "${USAGE}"
  exit 1
fi

case $1 in
  deb)
    if [ $2 == "ubuntu" ] 
    then
      if [ $3 == "bionic" ] || [ $3 == "18.04" ]
      then
        VERSION="bionic"
        docker build \
          --rm \
          --compress \
          --label "version=${VERSION}" \
          --label "maintainer=${AUTHOR} <${EMAIL}>" \
          -t ${REGISTRY}/fpm-updates:${VERSION} .
      fi
    else
      VERSION="xenial"
      docker build \
        --rm \
        --compress \
        --label "version=${VERSION}" \
        --label "maintainer=${AUTHOR} <${EMAIL}>" \
        -t ${REGISTRY}/fpm-updates:${VERSION} .
    fi
  ;;
  rpm)
    if [ $2 == "centos" ]
    then
      if [ $3 == "centos8" ] || [ $3 == "8" ]
      then
        VERSION="centos8"
        docker build \
          --rm \
          --compress \
          --label "version=${VERSION}" \
          --label "maintainer=${AUTHOR} <${EMAIL}>" \
          -t ${REGISTRY}/fpm-updates:${VERSION} .
      fi
    else
      VERSION="centos7"
      docker build \
        --rm \
        --compress \
        --label "version=${VERSION}" \
        --label "maintainer=${AUTHOR} <${EMAIL}>" \
        -t ${REGISTRY}/fpm-updates:${VERSION} .
    fi
  ;;
  *)
    echo -e "${USAGE}"
    exit 2
    ;;
esac

