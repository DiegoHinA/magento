#!/bin/bash
set -o errexit

DOMAIN=${1:-magento.test}
VERSION=${2:-2.4.3-p1}
EDITION=${3:-community}

# Ensure these are created so Docker doesn't create them as root
#mkdir -p ~/.composer ~/.ssh
mkdir /opt/pdata
mkdir /opt/pdata/composer
mkdir /opt/pdata/appdata
mkdir /opt/pdata/ssh
mkdir /opt/pdata/sockdata
mkdir /opt/pdata/ssldata
chmod 777 -R /opt/pdata/
# &&'s are used below otherwise onelinesetup script fails/errors after bin/download
bin/download "${VERSION}" "${EDITION}" \
  && bin/setup "${DOMAIN}"
