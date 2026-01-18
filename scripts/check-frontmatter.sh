#!/bin/bash
# Check frontmatter in vault files
# Usage: ./check-frontmatter.sh [vault_path]

VAULT_PATH="${1:-$(dirname "$0")/..}"
cd "$VAULT_PATH" || exit 1

echo "=== Checking Frontmatter ==="
echo ""

issues=0

# Check inbox files
echo "Checking inbox files..."
for file in 00-inbox/**/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue
    [[ "$file" == *"AGENTS.md" ]] && continue

    missing=""

    if ! grep -q "^created:" "$file"; then
        missing="$missing created"
    fi

    if ! grep -q "^type:" "$file"; then
        missing="$missing type"
    fi

    if ! grep -q "^source:" "$file"; then
        missing="$missing source"
    fi

    if [ -n "$missing" ]; then
        echo "MISSING: $file -$missing"
        ((issues++))
    fi
done

# Check people files
echo ""
echo "Checking people files..."
for file in 03-people/**/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue
    [[ "$file" == *"AGENTS.md" ]] && continue
    [[ "$file" == *"README.md" ]] && continue

    missing=""

    if ! grep -q "^created:" "$file"; then
        missing="$missing created"
    fi

    if ! grep -q "^type: person" "$file"; then
        missing="$missing type:person"
    fi

    if [ -n "$missing" ]; then
        echo "MISSING: $file -$missing"
        ((issues++))
    fi
done

# Check concept files
echo ""
echo "Checking concept files..."
for file in 02-concepts/**/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue
    [[ "$file" == *"AGENTS.md" ]] && continue
    [[ "$file" == *"README.md" ]] && continue

    missing=""

    if ! grep -q "^created:" "$file"; then
        missing="$missing created"
    fi

    if ! grep -q "^type: concept" "$file"; then
        missing="$missing type:concept"
    fi

    if [ -n "$missing" ]; then
        echo "MISSING: $file -$missing"
        ((issues++))
    fi
done

echo ""
if [ $issues -eq 0 ]; then
    echo "✓ All frontmatter looks good"
else
    echo "Found $issues issues"
fi
