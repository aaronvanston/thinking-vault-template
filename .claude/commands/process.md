---
description: Process a raw inbox item (extract insights, add links, update status)
allowed-tools: Read, Edit, Glob, Grep
argument-hint: [file-path]
---

# Process Inbox Item

Take a raw capture and fully process it.

## Instructions

Given the file path `$ARGUMENTS`:

### 1. Read the File

Load the current content and understand the type (tweet, article, video, capture).

### 2. Extract Insights

Add or expand the `## Insight` section:
- What's the key takeaway?
- Why does this matter?
- What's non-obvious?

### 3. Add Links

Identify and link:
- People mentioned → `[[person-name|Name]]`
- Concepts discussed → `[[concept|Concept]]`
- Create stubs in `99-stubs/` for new items

### 4. Update Status

Change frontmatter:
```yaml
status: processed
```

### 5. Commit

```bash
git add -A && git commit -m "Process: [filename]"
```

## Output

Confirm what was updated:
- Insights added
- Links created
- Stubs generated
