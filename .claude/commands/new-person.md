---
description: Create a new person file
allowed-tools: Read, Write
argument-hint: [name] [--team|--network|--industry]
---

# Create New Person

Create a new person file from the template.

## Arguments

- `$1` — Person's full name (e.g., "John Smith")
- `$2` — Category flag: `--team`, `--network`, or `--industry`

## Instructions

1. Parse the name to create filename: `firstname-lastname.md`
2. Determine folder:
   - `--team` → `03-people/[team-name]/`
   - `--network` → `03-people/network/`
   - `--industry` → `03-people/industry/`
3. Copy template from `05-reference/templates/person.md`
4. Fill in:
   - `created: [today]`
   - `# [Full Name]`
5. Open the file for editing

## Template

```yaml
---
created: YYYY-MM-DD
type: person
status: active
role: 
company: 
aliases: []
---

# Name

## Context

## Notes

## Links
```
