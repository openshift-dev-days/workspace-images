#!/usr/bin/env bash
set -e
TEMP_DIR="$(mktemp -d)"
curl -fsSL -o ${TEMP_DIR}/node.tz https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz
tar -x --no-auto-compress -f ${TEMP_DIR}/node.tz -C ${TEMP_DIR}
mv ${TEMP_DIR}/node-${NODE_VERSION}-linux-x64 /usr/local/node
rm -rf "${TEMP_DIR}"
#
# Example for enabling global npm settings
#
# mkdir -p /usr/local/node/etc
# mv /npmrc /usr/local/node/etc/npmrc
# chmod 444 /usr/local/node/etc/npmrc