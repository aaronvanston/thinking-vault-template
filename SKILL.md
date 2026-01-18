# SKILL.md — Thinking Vault Template

This describes how an agent can work with a vault structured like this template.

## Description
Maintain an Obsidian/Markdown thinking vault: capture items into `00-inbox/`, keep links healthy, promote items to `01-archive/`, and help produce writing in `04-outputs/`.

## Workspace
Point the agent at the root of the vault.

## Recommended Tools
- `vault-cli` (health checks + maintenance)
  - Repo: https://github.com/aaronvanston/vault-cli

## Common Commands
- Health check: `./scripts/vault-health.sh`
- Create symlinked folder instructions: `./scripts/link-agents.sh`

## Rules
- Do not publish vault contents unless explicitly asked.
- Prefer read-only checks before making changes.
- When creating new notes, follow templates in `05-reference/templates/`.
