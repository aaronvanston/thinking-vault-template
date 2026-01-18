---
description: Auto-link mentions of people, concepts, and tools in a file
allowed-tools: Glob, Grep, Read, Edit
argument-hint: [file-path]
---

# Auto-Link Content

Scan a file and automatically add wikilinks for mentions of people, concepts, and tools that exist in the vault.

## Instructions

Given the file path `$ARGUMENTS`:

### 1. Build the Link Index

Scan the vault to build a list of linkable items:

**People** (from `03-people/`):
- File name (without extension)
- Title from `# Heading`
- All values from `aliases` property

**Concepts** (from `02-concepts/`):
- File name (without extension)
- Title from `# Heading`
- All values from `aliases` property

**Tools** (from `05-reference/tools/`):
- File name (without extension)

### 2. Find Mentions

Search the file content for mentions of indexed items.

### 3. Add Links

Replace plain text mentions with wikilinks:
- `Person Name` → `[[person-name|Person Name]]`
- `Concept` → `[[concept|Concept]]`

Don't link inside existing wikilinks or code blocks.
