#!/usr/bin/env bash
set -euo pipefail

# Creates CLAUDE.md -> AGENTS.md symlinks throughout the vault.
# Pattern: AGENTS.md has the content, CLAUDE.md symlinks to it.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "Creating CLAUDE.md -> AGENTS.md symlinks..."

# Find all AGENTS.md files and create corresponding CLAUDE.md symlinks
find . -name "AGENTS.md" -type f | while read -r agents_file; do
    dir=$(dirname "$agents_file")
    claude_file="$dir/CLAUDE.md"
    
    # Remove existing CLAUDE.md (file or symlink)
    rm -f "$claude_file"
    
    # Create symlink
    ln -s AGENTS.md "$claude_file"
    echo "  $claude_file -> AGENTS.md"
done

echo "Done!"
