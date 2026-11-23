# Hippocampus-Plugin

[Hippocampus](https://hippocampus.nonnast.dev) ist das Langzeitgedächtnis für KI-Assistenten: Projekte, Entscheidungen (ADRs), Lösungen, Lernstoff und Notizen, durchsuchbar nach Inhalt und nach exakten Metadaten. Alle verbundenen Assistenten (Claude, ChatGPT, Codex …) teilen sich dasselbe Gedächtnis. Dieses Plugin bindet die beiden gehosteten MCP-Server ein und bringt Skills für das Merken und Wiederfinden mit.

## Installation

### Claude Code

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install hippocampus@nonnast-dev
```

Danach `/mcp` öffnen und bei `hippocampus` und `hippocampus-write` jeweils „Authenticate“ wählen. Im Browser die E-Mail-Adresse des Abos eingeben und den Code aus der Mail.

### Claude (claude.ai, Desktop)

Zwei Connectors: „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“:
- „Hippocampus“: `https://hippocampus.nonnast.dev/mcp`
- „Hippocampus merken“: `https://hippocampus.nonnast.dev/ingest/mcp`

Client-ID und Secret leer lassen, „Connect“. Skills als ZIP hochladen (siehe Haupt-README).

## MCP-Server

| | Suchen | Merken |
|---|---|---|
| Name | `hippocampus` | `hippocampus-write` |
| URL | `https://hippocampus.nonnast.dev/mcp` | `https://hippocampus.nonnast.dev/ingest/mcp` |
| Tools | `search`, `fetch_document`, `list_documents`, `grep`, `glob`, `read`, `ls`, `list_projects`, `list_domains`, `list_templates`, `get_template` | `remember` |

Transport: Streamable HTTP. Anmeldung: OAuth mit E-Mail-Code (Abo, 14 Tage kostenlos). Einrichtung für andere Assistenten: https://hippocampus.nonnast.dev/start

## Skills

| Skill | Art | Wofür |
|---|---|---|
| `hippocampus-einrichten` | Workflow | Verbindung prüfen, Anmeldung, erste Schritte |
| `hippocampus-erinnern` | Workflow | Frühere Entscheidungen, Lösungen und Projektwissen suchen und darauf antworten |
| `hippocampus-merken` | Workflow | Wissen ablegen oder aktualisieren, Projekte, ADRs mit Vorlagen, Datenschutz-Check |
| `hippocampus-fehler` | Troubleshooting | Fehlermeldungen und Status von `remember` mit Ursache und Lösung |

## Beispiele

- „Merk dir, wie wir das gerade gelöst haben.“
- „Was hatten wir zur Architektur von Projekt X entschieden?“
- „Leg die Entscheidung als ADR ab.“
- „Welche Projekte habe ich?“
