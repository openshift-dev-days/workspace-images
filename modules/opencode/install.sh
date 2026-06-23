#!/usr/bin/env bash
set -e
TEMP_DIR="$(mktemp -d)"
curl -fsSL -o ${TEMP_DIR}/opencode-linux-x64.tar.gz https://github.com/anomalyco/opencode/releases/download/${OPENCODE_VERSION}/opencode-linux-x64.tar.gz
tar -x --no-auto-compress -f ${TEMP_DIR}/opencode-linux-x64.tar.gz -C ${TEMP_DIR}
mv ${TEMP_DIR}/opencode /usr/local/bin/opencode
chmod +x /usr/local/bin/opencode
rm -rf "${TEMP_DIR}"
