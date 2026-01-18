#!/bin/bash
# Add aliases to content files based on their titles
# Usage: ./add-aliases.sh [vault_path]

VAULT_PATH="${1:-$(dirname "$0")/..}"
cd "$VAULT_PATH" || exit 1

echo "Adding aliases to content files..."

# Function to extract title from markdown file
get_title() {
    grep -m1 "^# " "$1" | sed 's/^# //'
}

# Function to check if aliases already exist
has_aliases() {
    grep -q "^aliases:" "$1"
}

# Function to add aliases in frontmatter
add_aliases() {
    local file="$1"
    local aliases="$2"

    if has_aliases "$file"; then
        echo "  Skipping $file (already has aliases)"
        return
    fi

    # Find line number of closing ---
    local close_line=$(grep -n "^---$" "$file" | tail -1 | cut -d: -f1)

    if [ -n "$close_line" ]; then
        sed -i '' "${close_line}i\\
aliases: $aliases
" "$file"
        echo "  Added aliases to $file"
    fi
}

# Process tweets
echo ""
echo "Processing tweets..."
for file in 00-inbox/tweets/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue

    title=$(get_title "$file")
    if [ -n "$title" ]; then
        add_aliases "$file" "[\"$title\"]"
    fi
done

# Process articles
echo ""
echo "Processing articles..."
for file in 00-inbox/articles/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue

    title=$(get_title "$file")
    if [ -n "$title" ]; then
        add_aliases "$file" "[\"$title\"]"
    fi
done

# Process concepts
echo ""
echo "Processing concepts..."
for file in 02-concepts/**/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue

    title=$(get_title "$file")
    if [ -n "$title" ]; then
        lower_title=$(echo "$title" | tr '[:upper:]' '[:lower:]')
        add_aliases "$file" "[\"$title\", \"$lower_title\"]"
    fi
done

# Process tools
echo ""
echo "Processing tools..."
for file in 05-reference/tools/*.md; do
    [ -f "$file" ] || continue
    [[ "$file" == *"CLAUDE.md" ]] && continue

    title=$(get_title "$file")
    if [ -n "$title" ]; then
        add_aliases "$file" "[\"$title\"]"
    fi
done

echo ""
echo "Done!"
