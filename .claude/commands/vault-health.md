---
description: Run a comprehensive vault health check
allowed-tools: Read, Bash, Glob, Grep
---

# Vault Health Check

Run a comprehensive audit of the vault to identify issues.

## Instructions

### 1. Broken Wikilinks

Find all wikilinks that reference non-existent files:

```bash
./scripts/check-broken-links.sh
```

### 2. Missing Frontmatter

Check all content files have required properties:

```bash
./scripts/check-frontmatter.sh
```

Required fields:
- `created` (date)
- `type` (tweet, article, concept, person, etc.)
- `status` (for inbox items)

### 3. Orphan Files

Files with no incoming links:

```bash
./scripts/check-orphans.sh
```

### 4. Content Stats

```bash
./scripts/vault-health.sh
```

### 5. Stubs Needing Promotion

List files in `99-stubs/` that should be converted to real notes.

## Output

Summarize:
- Total issues found
- Recommended fixes
- Files needing attention
