#!/usr/bin/env bash
set -e

EXT_DIR=/opt/vscode-extensions
mkdir -p "${EXT_DIR}"

# MTA extensions
curl -fsSL -o "${EXT_DIR}/mta-vscode-extension-core.vsix" \
  "https://github.com/migtools/editor-extensions/releases/download/v${MTA_EXT_VERSION}/mta-core-${MTA_EXT_VERSION}.vsix"
curl -fsSL -o "${EXT_DIR}/mta-vscode-extension-java.vsix" \
  "https://github.com/migtools/editor-extensions/releases/download/v${MTA_EXT_VERSION}/mta-java-${MTA_EXT_VERSION}.vsix"

# Red Hat Java extension
curl -fsSL -o "${EXT_DIR}/redhat-java-extension-linux-x64.vsix" \
  "https://github.com/redhat-developer/vscode-java/releases/download/${REDHAT_JAVA_TAG}/${REDHAT_JAVA_VSIX}"

# Java Extension Pack and siblings (Open VSX)
curl -fsSL -o "${EXT_DIR}/vscjava.vscode-java-pack.vsix" \
  "https://open-vsx.org/api/vscjava/vscode-java-pack/${JAVA_PACK_VERSION}/file/vscjava.vscode-java-pack-${JAVA_PACK_VERSION}.vsix"
curl -fsSL -o "${EXT_DIR}/vscjava.vscode-java-debug.vsix" \
  "https://open-vsx.org/api/vscjava/vscode-java-debug/${JAVA_DEBUG_VERSION}/file/vscjava.vscode-java-debug-${JAVA_DEBUG_VERSION}.vsix"
curl -fsSL -o "${EXT_DIR}/vscjava.vscode-maven.vsix" \
  "https://open-vsx.org/api/vscjava/vscode-maven/${JAVA_MAVEN_VERSION}/file/vscjava.vscode-maven-${JAVA_MAVEN_VERSION}.vsix"
curl -fsSL -o "${EXT_DIR}/vscjava.vscode-java-dependency.vsix" \
  "https://open-vsx.org/api/vscjava/vscode-java-dependency/${JAVA_DEPENDENCY_VERSION}/file/vscjava.vscode-java-dependency-${JAVA_DEPENDENCY_VERSION}.vsix"
curl -fsSL -o "${EXT_DIR}/vscjava.vscode-java-test.vsix" \
  "https://open-vsx.org/api/vscjava/vscode-java-test/${JAVA_TEST_VERSION}/file/vscjava.vscode-java-test-${JAVA_TEST_VERSION}.vsix"

chmod -R a+r "${EXT_DIR}"
