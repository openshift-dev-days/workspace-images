#!/usr/bin/env bash
set -e

# Expect /globalconfig/provider-settings.yaml mounted at runtime.
# Placeholders: _LLM_API_KEY_ / _LLM_BASE_URL_ (repo convention),
# or $KEY$ / $BASE_URL$ (dls-workspace sample compatibility).
cat << EOF >> /workspace-init.sh
if [ -f /globalconfig/provider-settings.yaml ]
then
  TARGET_DIR="/checode/remote/data/User/globalStorage/redhat.mta-core/settings"
  mkdir -p "\${TARGET_DIR}"
  cp /globalconfig/provider-settings.yaml "\${TARGET_DIR}/provider-settings.yaml"
  sed -i "s|_LLM_BASE_URL_|\${LLM_BASE_URL}|g" "\${TARGET_DIR}/provider-settings.yaml"
  sed -i "s|_LLM_API_KEY_|\${LLM_API_KEY}|g" "\${TARGET_DIR}/provider-settings.yaml"
  sed -i "s|\\\$BASE_URL\\\$|\${LLM_BASE_URL}|g" "\${TARGET_DIR}/provider-settings.yaml"
  sed -i "s|\\\$KEY\\\$|\${LLM_API_KEY}|g" "\${TARGET_DIR}/provider-settings.yaml"
fi
EOF
