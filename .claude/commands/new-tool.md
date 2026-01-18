---
description: Create a new tool reference file
allowed-tools: Read, Write
argument-hint: [tool-name]
---

# Create New Tool

Create a new tool file from the template.

## Arguments

- `$1` — Tool name (e.g., "Cursor")

## Instructions

1. Parse the name to create filename: `tool-name.md` (lowercase, hyphenated)
2. Create in `05-reference/tools/`
3. Copy template from `05-reference/templates/tool.md`
4. Fill in:
   - `created: [today]`
   - `# [Tool Name]`
5. Open the file for editing

## Template

```yaml
---
created: YYYY-MM-DD
type: tool
category: 
url: 
aliases: []
---

# Tool Name

## What It Is

## What It Does

## Why It Matters

## Links
```
