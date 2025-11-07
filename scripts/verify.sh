#!/usr/bin/env bash
set -euo pipefail

echo "==> Agda version"
agda --version || true

echo "==> Registered libraries"
AGDA_LIB_DB="${HOME}/.agda/libraries"
[ -f "${AGDA_LIB_DB}" ] && cat "${AGDA_LIB_DB}" || echo "No ~/.agda/libraries file found"

echo "==> Type-checking project example"
agda -i src src/Main.agda

echo "All good. Open src/Main.agda and press C-c C-l in the Agda panel."
