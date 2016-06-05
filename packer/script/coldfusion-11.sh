#!/bin/bash -eux

echo '==> Installing ColdFusion 11'
chmod 0777 /tmp/ColdFusion_11_WWEJ_linux64.bin
/tmp/ColdFusion_11_WWEJ_linux64.bin -f /tmp/installer.profile

echo '==> Patching ColdFusion 11'
echo '==> Update 4'
/opt/coldfusion11/jre/bin/java -jar /tmp/hotfix_004.jar -f /tmp/hotfix.profile
echo '==> Update 5'
/opt/coldfusion11/jre/bin/java -jar /tmp/hotfix_005.jar -f /tmp/hotfix.profile
echo '==> Update 6'
/opt/coldfusion11/jre/bin/java -jar /tmp/hotfix_006.jar -f /tmp/hotfix.profile
echo '==> Update 7'
/opt/coldfusion11/jre/bin/java -jar /tmp/hotfix_007.jar -f /tmp/hotfix.profile

echo '==> Disable admin security'
chmod 0777 /tmp/neo-security-config.py
/usr/bin/python /tmp/neo-security-config.py

echo '==> Copying systemd init script'
cp /tmp/coldfusion.service /etc/systemd/system/coldfusion.service

echo '==> Copying server.xml'
cp -f /tmp/server.xml /opt/coldfusion11/cfusion/runtime/conf/server.xml

echo '==> Stoping ColdFusion and HTTP servers'
/usr/bin/systemctl stop coldfusion
