#!/bin/bash -eux

JDK_VERSION="8u45"
JDK_LONGVERSION="1.8.0_45"
JDK_FILE="jdk-$JDK_VERSION-linux-x64.tar.gz"

echo "==> Downloading JDK: $JDK_VERSION"
wget -O /tmp/${JDK_FILE} http://downloads.ortussolutions.com/oracle/jdk/${JDK_VERSION}/${JDK_FILE}

# Install JDK
gunzip /tmp/${JDK_FILE}
tar -xf /tmp/jdk-${JDK_VERSION}-linux-x64.tar
gzip /tmp/jdk-${JDK_VERSION}-linux-x64.tar

# Move to install directory
echo "==> Moving JDK to installation directory at /usr/lib/jvm/jdk$JDK_LONGVERSION"
mkdir -p /usr/lib/jvm/jdk${JDK_LONGVERSION}
mv jdk${JDK_LONGVERSION}/* /usr/lib/jvm/jdk${JDK_LONGVERSION}/

echo "==> Linking JDK to 'current' JDK"
cd /usr/lib/jvm
ln -s /usr/lib/jvm/jdk${JDK_LONGVERSION}/ current

update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk$JDK_LONGVERSION/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk$JDK_LONGVERSION/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk$JDK_LONGVERSION/bin/javaws" 1
