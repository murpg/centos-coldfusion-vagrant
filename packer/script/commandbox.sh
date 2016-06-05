#!/bin/bash -eux

CMD_VERSION="2.1.0"

echo "==> Downloading CommandBox: $CMD_VERSION, standby"
wget -O /tmp/commandbox-bin-${CMD_VERSION}.zip http://integration.stg.ortussolutions.com/artifacts/ortussolutions/commandbox/${CMD_VERSION}/commandbox-bin-${CMD_VERSION}.zip

echo "==> Installing CommandBox"
unzip /tmp/commandbox-bin-${CMD_VERSION}.zip -d /usr/bin/
chmod 0777 /usr/bin/box
