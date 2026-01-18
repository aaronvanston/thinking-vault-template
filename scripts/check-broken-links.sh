#!/bin/bash
# Check for broken wikilinks in the vault
# Usage: ./check-broken-links.sh [vault_path]

VAULT_PATH="${1:-$(dirname "$0")/..}"
cd "$VAULT_PATH" || exit 1

echo "=== Checking for Broken Wikilinks ==="
echo ""

broken_count=0

# Extract all wikilinks and check if targets exist
grep -roh '\[\[[^]|]*' --include="*.md" . 2>/dev/null | \
    sed 's/\[\[//' | \
    sort -u | \
    while read -r link; do
        # Skip empty links
        [ -z "$link" ] && continue

        # Check if file exists anywhere
        found=$(find . -name "$link.md" -type f 2>/dev/null | head -1)

        if [ -z "$found" ]; then
            echo "BROKEN: [[$link]]"
            ((broken_count++))
        fi
    done

echo ""
if [ $broken_count -eq 0 ]; then
    echo "✓ No broken links found"
else
    echo "Found $broken_count broken links"
fi
