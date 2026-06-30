#!/usr/bin/env bash
set -e
TEMP_DIR="$(mktemp -d)"
curl -fsSL -o ${TEMP_DIR}/opencode-linux-x64.tar.gz https://github.com/anomalyco/opencode/releases/download/${OPENCODE_VERSION}/opencode-linux-x64.tar.gz
tar -x --no-auto-compress -f ${TEMP_DIR}/opencode-linux-x64.tar.gz -C ${TEMP_DIR}
mv ${TEMP_DIR}/opencode /usr/local/bin/opencode
chmod +x /usr/local/bin/opencode
rm -rf "${TEMP_DIR}"
mkdir /etc/opencode
chown user:root /etc/opencode
cat << EOF >> /workspace-init.sh
if [ -f /globalconfig/opencode.json ]
then 
    cp /globalconfig/opencode.json /etc/opencode/opencode.json
    sed -i "s|_LLM_BASE_URL_|\${LLM_BASE_URL}|g" /etc/opencode/opencode.json
    sed -i "s|_LLM_API_KEY_|\${LLM_API_KEY}|g" /etc/opencode/opencode.json
fi
EOF