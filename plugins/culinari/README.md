# Culinari-Plugin

[Culinari](https://culinari.nonnast.dev) ist ein deutschsprachiger Kochassistent mit einer **Koch-Familie** aus KI-Köchen (Omas und Profiköche). Dieses Plugin verbindet den Culinari-MCP-Server und bringt Skills für die typischen Abläufe mit.

## Installation

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install culinari@nonnast-dev
```

Dann `/mcp` → `culinari` → im Browser anmelden: E-Mail eingeben, Link aus der Mail öffnen, „Anmeldung bestätigen“. Das Konto entsteht dabei automatisch; der Einstieg (Free) ist kostenlos.

In claude.ai: Custom Connector mit `https://culinari.nonnast.dev/mcp` anlegen und die Skills als ZIP hochladen (siehe Haupt-README).

## MCP-Server

| | |
|---|---|
| URL | `https://culinari.nonnast.dev/mcp` |
| Transport | Streamable HTTP |
| Anmeldung | OAuth 2.1 mit dynamischer Client-Registrierung (Magic Link per E-Mail) |
| Einrichtung für Assistenten | https://culinari.nonnast.dev/start |

## Skills

| Skill | Art | Wofür |
|---|---|---|
| `culinari-einrichten` | Workflow | Verbindung, Koch-Familie zusammenstellen, Vorlieben speichern |
| `culinari-wochenplan` | Workflow | Mahlzeiten der Woche planen und eintragen |
| `culinari-einkaufsliste` | Generator | Einkaufsliste aus dem Plan, nach Abteilungen |
| `culinari-restekueche` | Workflow | Gerichte für vorhandene Zutaten |
| `culinari-rezeptarchiv` | Workflow | Rezepte importieren, erfassen, ändern |
| `culinari-kochbegleitung` | Workflow | Schritt-für-Schritt-Kochsession mit einem Koch |
| `culinari-naehrwerte` | Workflow | Nährwerte über BLS 4.0 |
| `culinari-fehler` | Troubleshooting | Fehlermeldungen mit Ursache und Lösung |

## Beispiele

- „Richte mir Culinari ein.“
- „Plan mir die Abendessen für nächste Woche, freitags Pizza.“
- „Mach die Einkaufsliste dazu.“
- „Was kann ich mit Zucchini, Feta und Reis kochen?“
- „Speicher das Rezept: https://…“
- „Lass uns Omas Gulasch kochen.“
- „Wie viele Kalorien hat eine Portion?“
