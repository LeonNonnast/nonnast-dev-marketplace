# nonnast-dev-marketplace

Claude-Plugins für die Apps von [nonnast.dev](https://nonnast.dev). Jedes Plugin verbindet den MCP-Server der App und bringt Skills mit, die zeigen, wie man ihn sinnvoll nutzt.

| Plugin | App | Was es kann |
|---|---|---|
| [`culinari`](plugins/culinari) | [Culinari](https://culinari.nonnast.dev) – Kochassistent mit KI-Koch-Familie | Rezepte sammeln und importieren, Wochenplan, Einkaufsliste, Resteküche, Nährwerte, Schritt-für-Schritt-Kochen |
| [`taskflow`](plugins/taskflow) | [TaskFlow](https://www.task-flow.ai) – Aufgabenverwaltung | Aufgaben aus Mails/Meetings erfassen, Tages- und Wochenüberblick, Projekte planen, Routinen |

## Claude Code

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install culinari@nonnast-dev
/plugin install taskflow@nonnast-dev
```

Danach `/mcp` öffnen, den Server (`culinari` bzw. `taskflow`) wählen und im Browser anmelden. Die Skills greifen automatisch, z. B. bei „Plan mir die Woche“ oder „Was steht heute an?“.

Hast du den Server schon vorher mit `claude mcp add` eingetragen, entferne den alten Eintrag (`claude mcp remove culinari`), damit die Tools nicht doppelt erscheinen.

## Claude (claude.ai, Desktop, Mobile)

Plugins gibt es dort nicht direkt; du kombinierst Connector und Skills:

1. **Connector:** „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“ und die MCP-URL eintragen:
   - Culinari: `https://culinari.nonnast.dev/mcp`
   - TaskFlow: `https://www.task-flow.ai/mcp`

   Anmeldung (OAuth) stehen lassen, dann „Connect“.
2. **Skills:** Die ZIPs aus dem neuesten [Release](https://github.com/LeonNonnast/nonnast-dev-marketplace/releases) laden – oder selbst bauen mit `scripts/package-skills.sh` – und unter „Customize“ → „Skills“ → „Upload skill“ einzeln hochladen. „Code execution“ muss in den Einstellungen aktiv sein.

## Mitmachen / eigenes Plugin

Aufbau und Checkliste: [`.claude/skills/plugin-aufbau/SKILL.md`](.claude/skills/plugin-aufbau/SKILL.md). Prüfen mit:

```bash
claude plugin validate .
claude plugin validate plugins/culinari
```

## Lizenz

MIT – siehe [LICENSE](LICENSE). Die Apps selbst und ihre Nutzungsbedingungen sind davon nicht berührt.
