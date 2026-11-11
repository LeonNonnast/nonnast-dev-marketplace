# TaskFlow-Plugin

[TaskFlow](https://www.task-flow.ai) ist eine Aufgabenverwaltung im Browser und direkt im Chat – Liste, Kanban, Eisenhower-Matrix und Kalender, mit Projekten, Workspaces und Freigaben. Dieses Plugin verbindet den TaskFlow-MCP-Server und bringt Skills für die typischen Abläufe mit.

## Installation

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install taskflow@nonnast-dev
```

Dann `/mcp` → `taskflow` → im Browser mit Microsoft- oder Google-Konto anmelden und auf „Zugriff erlauben?“ den gewünschten Umfang wählen (für die Einrichtung: „Alles lesen, schreiben und einstellen“).

In claude.ai: Custom Connector mit `https://www.task-flow.ai/mcp` anlegen (bei Nachfrage „Register automatically“) und die Skills als ZIP hochladen (siehe Haupt-README).

## MCP-Server

| | |
|---|---|
| URL | `https://www.task-flow.ai/mcp` |
| Transport | Streamable HTTP |
| Anmeldung | OAuth 2.1 (PKCE, dynamische Client-Registrierung), Scopes `tasks:read`, `tasks:write` – alternativ persönliches Zugangstoken `tfh_…` als Bearer-Header |
| Einrichtung für Assistenten | https://www.task-flow.ai/start.md |

Die angebotenen Tools hängen vom erteilten Zugriff ab (lesen / schreiben / einstellen). `get_access` zeigt, was die Verbindung darf.

## Skills

| Skill | Art | Wofür |
|---|---|---|
| `taskflow-einrichten` | Workflow | Verbindung, Zugang, erstes Projekt, geführter Einstieg |
| `taskflow-aufgaben-erfassen` | Workflow | Aufgaben aus Gespräch, Mails, Meetings – ohne Dubletten |
| `taskflow-ueberblick` | Workflow + Domänenwissen | Heute, überfällig, Woche, Zählungen, Änderungen; Filter-Syntax |
| `taskflow-projekt-planen` | Generator | Projekt mit Features, Unteraufgaben, Abhängigkeiten |
| `taskflow-routine` | Workflow | Wiederkehrende Routinen anlegen und ausführen |
| `taskflow-fehler` | Troubleshooting | Fehlercodes mit Ursache und Lösung |

## Beispiele

- „Richte mir TaskFlow ein.“
- „Was steht heute an?“
- „Mach Aufgaben aus den Mails von heute Morgen.“
- „Plan das Projekt Website-Relaunch bis Ende Januar.“
- „Leg eine Routine an: jeden Montag 8 Uhr Wochenüberblick.“
- „Wie viele offene Aufgaben habe ich pro Projekt?“
