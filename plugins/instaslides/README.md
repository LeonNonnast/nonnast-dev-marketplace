# Instaslides-Plugin

[Instaslides](https://instaslides.io) macht aus YAML eine animierte HTML-Präsentation – mit Morph-Übergängen, Charts, Metriken und Timelines. Claude schreibt die Folien, der Instaslides-MCP-Server prüft und rendert sie, zeigt sie **direkt im Chat** und exportiert eine einzelne HTML-Datei. Dieses Plugin bindet den gehosteten Server ein und bringt Skills für den Ablauf mit.

## Installation

### Claude Code

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install instaslides@nonnast-dev
```

Danach `/mcp` öffnen, `instaslides` wählen und im Browser anmelden (E-Mail-Link, kein Passwort). Claude Code zeigt keine Vorschau im Chat – es gibt dafür einen Link, der 60 Minuten gilt.

### Claude (claude.ai, Desktop)

Connector: „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“, URL `https://www.instaslides.io/mcp`, „Connect“. Wer auf instaslides.io schon angemeldet ist, wird ohne weitere Rückfrage verbunden. Skills als ZIP hochladen (siehe Haupt-README).

## MCP-Server

| | |
|---|---|
| URL | `https://www.instaslides.io/mcp` |
| Transport | Streamable HTTP |
| Anmeldung | OAuth (Konto auf instaslides.io per E-Mail-Link; Free oder Pro) |
| Tools | `get_schema`, `list_templates`, `use_template`, `validate`, `preview`, `export_html`, `license_status` |
| Daten | Präsentationen werden nur zum Rendern verarbeitet, nicht gespeichert; Links gelten 60 Minuten |

Alternative für Arbeit mit lokalen Dateien und Bildern (Live-Vorschau beim Speichern): das npm-Paket lokal per stdio, `claude mcp add instaslides -- npx -y instaslides` (Node.js ≥ 20).

## Skills

| Skill | Art | Wofür |
|---|---|---|
| `instaslides-einrichten` | Workflow | Verbindung prüfen, Free/Pro, lokale Alternative |
| `instaslides-praesentation` | Workflow | Folien planen, schreiben, prüfen, Vorschau, Export, später weiterbearbeiten – mit Gestaltungsregeln |
| `instaslides-fehler` | Troubleshooting | Fehlermeldungen und Warnungen mit Ursache und Lösung |

## Beispiele

- „Mach mir ein Pitch-Deck mit 10 Folien für unser Produkt.“
- „Bau aus der README einen Tech-Talk und zeig mir die Vorschau.“
- „Folie 4 als Chart statt als Liste.“
- „Exportier die Präsentation als HTML-Datei.“
- „Hier ist meine Präsentation von letzter Woche (HTML) – füg eine Folie zu den Q4-Zahlen hinzu.“
