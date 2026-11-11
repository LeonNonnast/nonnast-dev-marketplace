---
name: plugin-aufbau
description: Konvention für Plugins in diesem Marketplace – jedes Plugin = ein MCP-Server + Skills, die zeigen, wie man ihn nutzt. Verwenden, wenn ein neues Plugin angelegt, ein Skill geschrieben, eine .mcp.json eingebunden, ein Plugin in die marketplace.json eingetragen oder ein Plugin vor dem Veröffentlichen geprüft werden soll ("neues Plugin", "Skill hinzufügen", "Plugin-Checkliste").
---

# Plugin-Aufbau: MCP-Server + Skills

Die meisten Plugins in diesem Repo bestehen aus zwei Teilen:

- **MCP-Server** – die „Hände“: Zugriff auf die Anwendung (Daten lesen, Aktionen ausführen).
- **Skills** – das „Wissen“: wie man mit diesem Zugriff sinnvoll arbeitet (Abläufe, Konventionen, Fehlerbilder).

## Konvention

> Jedes Plugin = ein MCP-Server + Skills, die zeigen, wie man ihn nutzt.
> Ein Plugin ohne MCP ist erlaubt. Ein MCP ohne mindestens einen Workflow-Skill ist die Ausnahme und muss begründet werden.

## Beispiel: dieses Repo

```
nonnast-dev-marketplace/
├── CLAUDE.md
├── .claude-plugin/marketplace.json
└── plugins/
    └── culinari/
        ├── .claude-plugin/plugin.json
        ├── .mcp.json
        ├── README.md
        └── skills/
            ├── culinari-einrichten/
            │   ├── SKILL.md
            │   └── references/tarife.md
            ├── culinari-wochenplan/
            │   └── SKILL.md
            └── culinari-fehler/
                ├── SKILL.md
                └── references/known-errors.md
```

**Wichtig:** Alle Komponentenordner (`skills/`, `agents/`, `hooks/` usw.) liegen auf der Plugin-Root-Ebene. In `.claude-plugin/` liegt nur die `plugin.json`.

## MCP-Server einbinden

Der MCP-Server wird in einer `.mcp.json` im Plugin-Root oder inline in der `plugin.json` definiert. Beispiel für einen Remote-Server:

```json
{
  "mcpServers": {
    "culinari": {
      "type": "http",
      "url": "https://culinari.nonnast.dev/mcp"
    }
  }
}
```

- MCP-Server eines Plugins starten automatisch, sobald das Plugin aktiviert ist.
- Für lokale Skripte oder Binaries immer `${CLAUDE_PLUGIN_ROOT}` verwenden, damit Pfade auf jedem Rechner stimmen.
- Keine Tokens, Keys oder Header mit Secrets in `.mcp.json` – das Repo ist öffentlich. Anmeldung läuft über OAuth.

## Aufbau eines Skills

```markdown
---
name: culinari-wochenplan
description: Plant mit Culinari die Mahlzeiten einer Woche aus der eigenen
  Rezeptsammlung und trägt sie in den Mahlzeitenplan ein. Verwenden bei
  "plan die Woche", "Wochenplan", "was essen wir nächste Woche".
---

1. Zeitraum klären und als JJJJ-MM-TT umrechnen
2. Bestand mit culinari_get_meal_plan lesen
3. Rezepte mit culinari_search_recipes finden …

Tarife und Grenzen: siehe references/tarife.md
```

Die **`description`** ist der wichtigste Teil: Claude aktiviert einen Skill selbstständig, wenn der Aufgabenkontext zur Beschreibung passt. Sie sollte deshalb sagen, *was* der Skill tut und *wann* er verwendet werden soll, inklusive typischer Formulierungen von Nutzern.

Der Inhalt von `SKILL.md` wird erst geladen, wenn der Skill greift. Umfangreiches Detailwissen gehört in `references/`, damit es nur bei Bedarf gelesen wird.

Skill-Namen in diesem Repo tragen den Plugin-Namen als Präfix (`culinari-…`, `taskflow-…`), damit sie auch als einzeln hochgeladene Skills in claude.ai eindeutig bleiben.

## Typische Skill-Arten

| Art | Zweck | Beispiel |
| :- | :- | :- |
| **Workflow** | Feste Abläufe mit dem MCP, inkl. Tool-Reihenfolge. Häufigster und wertvollster Typ. | „Wochenplan“, „Aufgaben erfassen“ |
| **Domänenwissen** | Fachbegriffe, Konventionen, Datenmodelle der Anwendung (meist in `references/`). | Tarife, Filter-Syntax |
| **Prüfung / Review** | Checklisten vor kritischen Schritten. | „Vor dem Löschen prüfen“ |
| **Troubleshooting** | Bekannte Fehlermeldungen des MCP mit Ursache und Fix. | „Fehler beheben“ mit `known-errors.md` |
| **Generator** | Erzeugt Dateien oder Vorlagen, oft mit Skripten im Skill-Ordner. | Einkaufsliste, Projektplan |

## Checkliste für ein neues Plugin

- [ ] `.claude-plugin/plugin.json` mit `name`, `description`, `version`, `author`
- [ ] `.mcp.json` (falls MCP) mit funktionierender Verbindung
- [ ] Mindestens ein Workflow-Skill mit aussagekräftiger `description`
- [ ] Troubleshooting-Skill (`<plugin>-fehler`) mit `references/known-errors.md`
- [ ] `README.md` im Plugin-Ordner
- [ ] Eintrag in `.claude-plugin/marketplace.json`
- [ ] `claude plugin validate .` ohne Fehler
- [ ] Keine Secrets, internen Hosts oder privaten E-Mail-Adressen im Plugin
- [ ] Version in `plugin.json` und `marketplace.json` gleich hochgezählt
