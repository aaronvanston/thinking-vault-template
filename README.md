# Thinking Vault Template

A **sanitized, shareable template** for an Obsidian/Markdown "thinking vault" — structure, design patterns, conventions, and automation hooks — with **no private content**.

Clone this repo and start using it immediately.

## What This Is

- A filesystem-first knowledge base (Markdown files + folders)
- Optimized for: **capture → process → ship**
- Designed to work with Obsidian, `vault-cli`, and AI agents

## Full Folder Structure

```
thinking-vault-template/
│
├── .claude/
│   └── commands/              # Custom Claude commands
│       ├── archive.md
│       ├── auto-link.md
│       ├── new-person.md
│       ├── new-tool.md
│       ├── process.md
│       ├── vault-health.md
│       └── weekly-review.md
│
├── 00-inbox/                  # Raw captures (unprocessed)
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   ├── articles/              # Article captures
│   ├── captures/              # Screenshots, misc
│   ├── tweets/                # Tweet captures
│   └── videos/                # Video notes
│
├── 01-archive/                # Processed inbox items
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   └── tweets/                # Archived tweets
│
├── 02-concepts/               # Glossary-style definitions
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   └── [topic]/               # Topic subfolders (ai, leadership, etc)
│
├── 03-people/                 # People notes
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   ├── 00-1-1-prep.md         # 1:1 prep template
│   ├── [team-name]/           # Your team/company
│   │   ├── AGENTS.md
│   │   ├── CLAUDE.md → AGENTS.md
│   │   ├── org-structure.md   # Org chart
│   │   └── [person-name]/     # Person folder
│   │       ├── [person-name].md
│   │       └── YYYY-MM-DD-1-1.md
│   ├── network/               # People you've met
│   └── industry/              # Public figures you follow
│
├── 04-outputs/                # Publishable work
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   ├── daily-updates/
│   │   ├── AGENTS.md
│   │   ├── CLAUDE.md → AGENTS.md
│   │   └── [year]/
│   │       └── [month]/
│   ├── ideas/                 # Draft ideas
│   ├── posted/
│   │   └── [year]/            # Published by year
│   └── presentations/         # Slide decks, talks
│
├── 05-reference/              # Templates and reference docs
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   ├── writing-guide.md
│   ├── companies/             # Company notes
│   ├── templates/             # File templates
│   │   ├── article.md
│   │   ├── blog-post.md
│   │   ├── concept.md
│   │   ├── daily-update.md
│   │   ├── daily.md
│   │   ├── health-check.md
│   │   ├── linkedin.md
│   │   ├── meeting-notes.md
│   │   ├── monologue.md
│   │   ├── output.md
│   │   ├── person.md
│   │   ├── presentation.md
│   │   ├── sections.md
│   │   ├── tool.md
│   │   └── tweet.md
│   └── tools/                 # Tool reference docs
│       ├── AGENTS.md
│       └── CLAUDE.md → AGENTS.md
│
├── 06-meetings/               # Meeting notes
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   └── [year]/                # By year
│
├── 99-stubs/                  # Auto-created stubs
│
├── assets/
│   ├── AGENTS.md
│   ├── CLAUDE.md → AGENTS.md
│   └── inbox/
│       └── captures/
│
├── scripts/
│   ├── add-aliases.sh
│   ├── check-broken-links.sh
│   ├── check-frontmatter.sh
│   ├── check-orphans.sh
│   ├── clean-mock-data.sh
│   ├── link-agents.sh
│   └── vault-health.sh
│
├── 00-MOC.md                  # Map of Content
├── AGENTS.md                  # Agent instructions
├── CLAUDE.md → AGENTS.md      # Symlink
├── README.md                  # This file
├── SKILL.md                   # Clawdbot skill definition
├── SPEC.md                    # Vault specification
└── [OWNER].md                 # Owner context (rename to your name)
```

## Placeholders

Replace these with your own values:

| Placeholder | Example |
|-------------|---------|
| `[team-name]` | `acme`, `buildpass` |
| `[person-name]` | `john-smith` |
| `[topic]` | `ai`, `leadership` |
| `[year]` | `2026` |
| `[month]` | `January` |
| `[OWNER]` | `AARON`, `JOHN` |

## Key Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | Instructions for AI agents (root + per-folder) |
| `CLAUDE.md` | Symlink to `AGENTS.md` |
| `SPEC.md` | Vault design decisions and conventions |
| `[OWNER].md` | Owner context and preferences |
| `00-MOC.md` | Map of Content (quick navigation) |
| `SKILL.md` | Clawdbot integration |

## Mock Data

Files ending in `.mock.md` are examples. Remove them when ready:

```bash
./scripts/clean-mock-data.sh
```

## Scripts

| Script | Purpose |
|--------|---------|
| `vault-health.sh` | Full health check |
| `check-broken-links.sh` | Find broken wikilinks |
| `check-frontmatter.sh` | Validate frontmatter |
| `check-orphans.sh` | Find unlinked files |
| `add-aliases.sh` | Auto-add aliases from titles |
| `link-agents.sh` | Create CLAUDE.md symlinks |
| `clean-mock-data.sh` | Remove all .mock.md files |

## Getting Started

1. Clone this repo
2. Rename `[OWNER].md` to your name
3. Replace placeholder folders with real names
4. Run `./scripts/clean-mock-data.sh`
5. Start capturing

## Related

- [vault-cli](https://github.com/aaronvanston/vault-cli) — CLI for vault maintenance

---

**Capture quickly → Process deliberately → Ship occasionally**
