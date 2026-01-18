# Vault Specification

Design decisions and conventions for this vault.

## Philosophy

- **Text files are the source of truth.** Everything is plain Markdown.
- **Capture quickly, process deliberately.** Inbox is for raw; archive is for processed.
- **Link aggressively.** Connections surface through `[[wikilinks]]`.
- **Small, composable notes.** Prefer many small files over few large ones.

## Folder Structure

| Folder | Purpose |
|--------|---------|
| `00-inbox/` | Raw captures (tweets, articles, videos, captures) |
| `01-archive/` | Processed inbox items |
| `02-concepts/` | Glossary-style definitions by topic |
| `03-people/` | People notes (team, network, industry) |
| `04-outputs/` | Publishable work (daily updates, posts, presentations) |
| `05-reference/` | Templates, tools, companies |
| `06-meetings/` | Meeting notes by year |
| `99-stubs/` | Auto-created stubs needing promotion |
| `assets/` | Images and media |
| `scripts/` | Maintenance scripts |

## Naming Conventions

| Type | Pattern |
|------|---------|
| Inbox items | `YYYY-MM-DD-slug.md` |
| Tweets | `YYYY-MM-DD-handle-slug-<id>.md` |
| People | `firstname-lastname.md` |
| Concepts | `concept-name.md` |
| Meetings | `YYYY-MM-DD-topic.md` |

## Frontmatter

Minimal required fields:

```yaml
---
created: YYYY-MM-DD
type: [tweet|article|concept|person|meeting|output|tool]
status: [raw|draft|active|processed]
---
```

## Symlink Pattern

- `AGENTS.md` — contains the actual content/instructions
- `CLAUDE.md` — symlinks to `AGENTS.md`

Run `./scripts/link-agents.sh` to create symlinks.

## Mock Data

Files ending in `.mock.md` are examples. Remove with:

```bash
./scripts/clean-mock-data.sh
```

## Maintenance

```bash
./scripts/vault-health.sh      # Full health check
./scripts/check-broken-links.sh
./scripts/check-frontmatter.sh
./scripts/check-orphans.sh
./scripts/add-aliases.sh
```
