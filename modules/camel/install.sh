#!/usr/bin/env bash
set -e

# Fix user home directory (workspace-base sets it to /projects, which is a PVC mount)
mkdir -p /home/user
chown 1000:1000 /home/user
chmod 755 /home/user
usermod -d /home/user user
cp /etc/skel/.bashrc /home/user/.bashrc
chown 1000:1000 /home/user/.bashrc
echo "export PS1='\W \`git branch --show-current 2>/dev/null | sed -r -e \"s@^(.+)@\(\1\) @\"\`\$ '" > /etc/profile.d/custom_prompt.sh
chmod 644 /etc/profile.d/custom_prompt.sh

# Install Camel CLI
export HOME=/home/user
curl -fsSL https://camel.apache.org/install.sh | sh
export PATH=$PATH:/home/user/.local/bin
camel version
chown -R 1000:1000 /home/user/.local
runuser -u user -- camel plugin add kubernetes
runuser -u user -- camel plugin add forage

# Make /home/user accessible by arbitrary UIDs (OpenShift GID 0 pattern)
chown -R 1000:0 /home/user
chmod -R g=u /home/user
