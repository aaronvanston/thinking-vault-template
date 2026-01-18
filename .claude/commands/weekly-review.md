---
description: Surface unprocessed items, recent activity, and maintenance tasks
allowed-tools: Read, Glob, Grep, Bash
---

# Weekly Review

Generate a status report of the vault.

## Report Sections

### 1. Unprocessed Items

Find files with `status: raw` in `00-inbox/`:

```bash
grep -rl "status: raw" 00-inbox/ 2>/dev/null
```

List each with title and created date.

### 2. Recent Captures (Last 7 Days)

Find files created in the last week.

### 3. Orphan Files

Files with no incoming links:

```bash
./scripts/check-orphans.sh
```

### 4. Broken Links

Links pointing to non-existent files:

```bash
./scripts/check-broken-links.sh
```

### 5. Stubs to Promote

Files in `99-stubs/` waiting to be written.

### 6. Content Stats

- Total tweets
- Total articles
- Total concepts
- Total people

## Output Format

```markdown
# Weekly Review — YYYY-MM-DD

## Inbox Queue
- [ ] [file] — [title]

## Recent Activity
- [date]: [file]

## Maintenance
- X broken links
- X orphan files
- X stubs to promote
```
