#!/usr/bin/env bash
# Installs the bunny.net CLI to ~/.bunny/bin. It updates itself, so this only installs when missing.

set -euo pipefail

if [[ -x "$HOME/.bunny/bin/bunny" ]]; then
  exit 0
fi

printf '\n==> Installing bunny CLI\n'
curl -fsSL https://cli.bunny.net/install.sh | sh
