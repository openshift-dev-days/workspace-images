cat << EOF >> /workspace-init.sh
if [[ -f /globalconfig/zoo-code-settings.json ]]
then
  cp /globalconfig/zoo-code-settings.json /projects/zoo-code-settings.json
  sed -i "s|_LLM_BASE_URL_|${LLM_BASE_URL}|g" /projects/zoo-code-settings.json
  sed -i "s|_LLM_API_KEY_|${LLM_API_KEY}|g" /projects/zoo-code-settings.json
fi
EOF