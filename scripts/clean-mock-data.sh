#!/usr/bin/env bash
set -euo pipefail

# Remove all .mock.md files from the vault.
# Run this after you've explored the structure and want to start fresh.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "Searching for .mock.md files…"
mock_files=$(find . -name "*.mock.md" -type f | grep -v .git || true)

if [[ -z "${mock_files}" ]]; then
  echo "No mock files found."
  exit 0
fi

echo "Found:"
echo "${mock_files}"
echo ""

read -p "Delete these files? [y/N] " confirm
if [[ "${confirm}" =~ ^[Yy]$ ]]; then
  echo "${mock_files}" | xargs rm -f
  echo "Deleted."
else
  echo "Aborted."
fi
