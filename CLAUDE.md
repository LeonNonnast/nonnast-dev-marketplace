# nonnast-dev-marketplace

Öffentlicher Claude-Plugin-Marketplace für die Apps von nonnast.dev. Jedes Plugin = ein Remote-MCP-Server + Skills, die zeigen, wie man ihn nutzt.

- Konvention, Skill-Aufbau und Checkliste: Skill `plugin-aufbau` (`.claude/skills/plugin-aufbau/SKILL.md`) – vor jeder Änderung an einem Plugin lesen.
- Plugins: `plugins/culinari` (https://culinari.nonnast.dev/mcp), `plugins/taskflow` (https://www.task-flow.ai/mcp).
- Quellcode der MCP-Server liegt in eigenen Repos; Tool-Namen und Fehlermeldungen in den Skills müssen zum Server passen. Bei Server-Änderungen die Skills (`references/known-errors.md`) nachziehen.

## Regeln

- Öffentliches Repo: keine Tokens, Keys, internen Hosts (z. B. Railway-Domains) oder privaten E-Mail-Adressen.
- Skills auf Deutsch (die Apps sind deutschsprachig); Skill-Namen mit Plugin-Präfix.
- Version in `plugins/<name>/.claude-plugin/plugin.json` und `.claude-plugin/marketplace.json` gemeinsam hochzählen.
- Vor jedem Commit: `claude plugin validate .` und `claude plugin validate plugins/<name>`.
- Skill-ZIPs für claude.ai: `scripts/package-skills.sh` (Ausgabe in `dist/`, nicht eingecheckt).
- Commits mit der privaten Git-Identität (kein `--author`-Override).
