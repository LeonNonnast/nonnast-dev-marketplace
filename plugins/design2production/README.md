# Design2Production-Plugin

[Design2Production](https://d2p.nonnast.dev) ist ein digitales Atelier für Schnittmuster. Man sucht sich eine Vorlage aus (Rock, Kleid, Mantel, Kinderkleidung), wählt eine Konfektionsgröße, passt Länge und Weite mit Reglern an und druckt das Schnittmuster auf A4 oder A3 zum Zusammenkleben. Dieses Plugin bindet den gehosteten MCP-Server ein und bringt Skills für den Ablauf mit. Die Web-App ist der zweite, gleichwertige Weg.

## Installation

### Claude Code

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install design2production@nonnast-dev
```

Danach `/mcp` öffnen, `d2p` wählen und im Browser anmelden (E-Mail-Link, kein Passwort). Damit Claude neue Kleidungsstücke anlegen darf, bei der Zustimmung das Häkchen „Neue Kleidungsstücke für mich anlegen“ setzen.

### Claude (claude.ai, Desktop)

Connector: „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“, URL `https://d2p.nonnast.dev/mcp`, „Connect“. Skills als ZIP hochladen (siehe Haupt-README).

Ausführliche Anleitungen für Assistenten (auch ChatGPT): https://d2p.nonnast.dev/start

## MCP-Server

| | |
|---|---|
| URL | `https://d2p.nonnast.dev/mcp` |
| Transport | Streamable HTTP |
| Anmeldung | OAuth 2.1 (Konto per E-Mail-Link; Zugang derzeit über Warteliste mit Einladung) |
| Wichtige Tools | `d2p.atelier.search_templates`, `d2p.atelier.start`, `d2p.atelier.status`, `d2p.atelier.adjust`, `d2p.atelier.print`, `d2p.atelier.list_projects`, `d2p.identity.whoami` |
| Daten | Körpermaße verlassen den Server nie über MCP; mit eigenen Maßen gedruckt wird in der App (Link kommt vom Server) |

## Skills

| Skill | Art | Wofür |
|---|---|---|
| `d2p-einrichten` | Workflow | Verbindung und Anmeldung prüfen, Erlaubnis „Neue Kleidungsstücke anlegen“ |
| `d2p-kleidungsstueck` | Workflow | Vorlage finden, nach Größe starten, mit Reglern anpassen, drucken; Übergabe in die App bei eigenen Maßen |
| `d2p-fehler` | Troubleshooting | Fehlercodes des Servers mit Ursache und Lösung |

## Beispiele

- „Ich möchte einen einfachen Rock in Größe 38 nähen.“
- „Mach den Rock 5 cm länger und druck ihn auf A4.“
- „Was ist der Stand bei meinem Kinderkleid?“
