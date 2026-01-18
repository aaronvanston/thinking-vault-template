#!/bin/bash
# Find orphan files (files with no incoming links)
# Usage: ./check-orphans.sh [vault_path]

VAULT_PATH="${1:-$(dirname "$0")/..}"
cd "$VAULT_PATH" || exit 1

echo "=== Checking for Orphan Files ==="
echo ""

orphan_count=0

# Get all content markdown files
find . -name "*.md" -type f | while read -r file; do
    # Skip certain files
    [[ "$file" == *"CLAUDE.md" ]] && continue
    [[ "$file" == *"AGENTS.md" ]] && continue
    [[ "$file" == *"README.md" ]] && continue
    [[ "$file" == *"/templates/"* ]] && continue
    [[ "$file" == *"/.obsidian/"* ]] && continue
    [[ "$file" == *"/scripts/"* ]] && continue
    [[ "$file" == *".mock.md" ]] && continue

    # Get the filename without path and extension
    filename=$(basename "$file" .md)

    # Search for links to this file
    link_count=$(grep -rl "\[\[$filename" --include="*.md" . 2>/dev/null | grep -v "$file" | wc -l)

    if [ "$link_count" -eq 0 ]; then
        echo "ORPHAN: $file"
        ((orphan_count++))
    fi
done

echo ""
if [ $orphan_count -eq 0 ]; then
    echo "✓ No orphan files found"
else
    echo "Found $orphan_count orphan files"
fi
