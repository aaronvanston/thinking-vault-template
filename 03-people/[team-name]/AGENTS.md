# [Team Name] Team

Team members at [[company-name|Company Name]].

## Structure

Person files include:
- `role` — Job title
- `team` — Team name
- `location` — City, remote status
- `reports_to` — Manager (wikilink)
- `manages` — Direct reports (list of wikilinks)

## Teams

| Team | Focus |
|------|-------|
| **[Team A]** | [Description] |
| **[Team B]** | [Description] |
| **[Team C]** | [Description] |

## Locations

- [City 1] (HQ)
- [City 2]
- Remote

## Org Chart

See `org-structure.md` for detailed org chart.

```
[Leader] ([Title])
├── [Department A]
├── [Department B]
└── [Department C]
```

## Person Files

Each person gets their own folder containing their main file and related docs:

```
[team-name]/
├── AGENTS.md              # This file (team overview)
├── org-structure.md       # Org chart
└── [person-name]/         # Person folder
    ├── [person-name].md   # Main person file
    ├── YYYY-MM-DD-1-1.md  # 1:1 notes
    └── ...                # Other related docs
```
