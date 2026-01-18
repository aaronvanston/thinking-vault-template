#!/bin/bash
# Main vault health check script
# Runs all individual checks and produces a summary
# Usage: ./vault-health.sh [vault_path]

VAULT_PATH="${1:-$(dirname "$0")/..}"
SCRIPT_DIR="$(dirname "$0")"

echo "╔════════════════════════════════════════╗"
echo "║       VAULT HEALTH CHECK               ║"
echo "║       $(date '+%Y-%m-%d %H:%M')                  ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Run individual checks
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
"$SCRIPT_DIR/check-broken-links.sh" "$VAULT_PATH"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
"$SCRIPT_DIR/check-frontmatter.sh" "$VAULT_PATH"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
"$SCRIPT_DIR/check-orphans.sh" "$VAULT_PATH"
echo ""

# Summary stats
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "=== Summary ==="
echo ""

cd "$VAULT_PATH" || exit 1

# Count files
tweets=$(find 00-inbox/tweets -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
articles=$(find 00-inbox/articles -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
captures=$(find 00-inbox/captures -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
concepts=$(find 02-concepts -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
people=$(find 03-people -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
tools=$(find 05-reference/tools -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')
outputs=$(find 04-outputs -name "*.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" 2>/dev/null | wc -l | tr -d ' ')

echo "Content Stats:"
echo "  Tweets:    $tweets"
echo "  Articles:  $articles"
echo "  Captures:  $captures"
echo "  Concepts:  $concepts"
echo "  People:    $people"
echo "  Tools:     $tools"
echo "  Outputs:   $outputs"
echo ""
echo "Total:       $((tweets + articles + captures + concepts + people + tools + outputs)) files"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
