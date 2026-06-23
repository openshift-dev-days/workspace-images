#!/usr/bin/env bash

set -e

pip install -U podman-compose
pip install -U cekit
pip install -U pipenv
chmod 755 /entrypoint.sh
#
# Setup for root-less podman
#
mkdir -p ${HOME}/.bin
chown -R 1000:1000 ${HOME}
echo "user:x:1000:1000:devspaces user:${HOME}:/bin/bash" >> /etc/passwd
echo "user:x:1000:" >> /etc/group
echo "user:1001:64535" >> /etc/subuid
echo "user:1001:64535" >> /etc/subgid
setcap cap_setuid+ep /usr/bin/newuidmap
setcap cap_setgid+ep /usr/bin/newgidmap
if [ ! -f /workspace-init.sh ]
then
  echo 'echo "Setting workspace config"' > /workspace-init.sh
fi
chmod +x /workspace-init.sh