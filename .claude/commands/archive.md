---
description: Move processed files from inbox to archive
allowed-tools: Read, Edit, Bash, Glob, Grep
argument-hint: [optional: specific file path]
---

# Archive Processed Files

Move files with `status: processed` from `00-inbox/` to `01-archive/`.

## Workflow

1. If a specific file is provided:
   - Verify it has `status: processed`
   - Move to corresponding folder in `01-archive/`

2. If no file specified:
   - Scan `00-inbox/` for files with `status: processed`
   - List candidates and ask user to confirm
   - Move confirmed files to `01-archive/`

## Archive Structure

Maintain parallel structure:
- `00-inbox/tweets/` → `01-archive/tweets/`
- `00-inbox/articles/` → `01-archive/articles/`
- `00-inbox/captures/` → `01-archive/captures/`
- `00-inbox/videos/` → `01-archive/videos/`

## Move Command

```bash
git mv [source] [dest]
```
