#!/usr/bin/env bash
set -e

pip3 install ansible-navigator
pip3 install ansible
pip3 install ansible-lint
pip3 install ansible-dev-tools
pip3 install kubernetes
chmod -R g=u ${HOME}