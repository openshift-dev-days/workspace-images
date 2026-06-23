#!/usr/bin/env bash
set -e
MAVEN_VERSION=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/apache/maven/releases/latest)|cut -d"-" -f2)
TEMP_DIR="$(mktemp -d)" 
mkdir -p /usr/local/maven /usr/local/maven/ref 
curl -fsSL -o ${TEMP_DIR}/apache-maven.tar.gz https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz 
tar -xzf ${TEMP_DIR}/apache-maven.tar.gz -C /usr/local/maven --strip-components=1  
rm -rf "${TEMP_DIR}"
ln -s /usr/local/maven/bin/mvn /usr/local/bin/mvn
#
# Example of embedding a global settings.xml into the image 
# mv /settings.xml /usr/local/maven/conf/settings.xml
#
chmod 444 /usr/local/maven/conf/settings.xml