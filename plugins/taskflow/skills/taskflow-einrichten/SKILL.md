---
name: taskflow-einrichten
description: Richtet TaskFlow ein und führt durch den Einstieg – Verbindung und Zugriff prüfen, erstes Projekt anlegen, erste Aufgaben aus vorhandenen Quellen übernehmen. Verwenden, wenn jemand TaskFlow zum ersten Mal nutzt, "richte TaskFlow ein", "wie fange ich an", "verbinde TaskFlow" sagt, oder wenn TaskFlow-Tools fehlen bzw. 401/"Authentication required" melden.
---

# TaskFlow einrichten

TaskFlow ist eine Aufgabenverwaltung (Liste, Kanban, Eisenhower, Kalender) mit Web-App und MCP-Server. Web-App und Hilfe: https://www.task-flow.ai

## 1. Verbindung prüfen

- Sind Tools wie `start_onboarding` oder `list_tasks` da, bist du verbunden – weiter mit Schritt 2.
- **Claude Code:** Das Plugin bringt den Server `taskflow` mit. Bitte die Person, `/mcp` zu öffnen, `taskflow` zu wählen und sich im Browser anzumelden (Microsoft- oder Google-Konto). Auf „Zugriff erlauben?“ für die volle Einrichtung „Alles lesen, schreiben und einstellen“ wählen.
- **claude.ai / Claude Desktop:** „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“, Name `TaskFlow`, URL `https://www.task-flow.ai/mcp`. Fragt Claude nach dem OAuth-Client, „Register automatically“ wählen. Danach „Connect“, anmelden, Zugriff erlauben und den Connector im Chat unter „+“ → „Connectors“ einschalten. In Team/Enterprise fügt ein Owner den Connector hinzu.
- **Ohne Browser-Anmeldung (z. B. Server, CI):** In der Web-App unter „Zugriffe“ ein Zugangstoken (`tfh_…`) erstellen und in Claude Code eintragen:
  `claude mcp add --transport http taskflow https://www.task-flow.ai/mcp --header "Authorization: Bearer <token>"`. Das Token nie in Dateien im Repo ablegen.

## 2. Geführter Einstieg

Rufe `start_onboarding` auf. Es sagt, was die Verbindung darf, welcher Schritt als Nächstes kommt und wie er geht. Nach **jedem** Schritt erneut aufrufen (ab Schritt 2 mit `project_id`).

1. **Zugang:** Für die Einrichtung ist Schreibzugriff nötig. Fehlt er: `get_access` zeigen und neu verbinden lassen.
2. **Projekt:** `list_projects` – vorhandenes wählen oder neu anlegen: passendes Icon mit `list_icons(query=<englisches Wort>)` suchen, dann `create_project(workspace_id, name, icon, color)` (Workspace aus `list_workspaces`).
3. **Quellen:** Schauen, welche Connectors die Person in **diesem** Client schon hat (Outlook/Microsoft 365, Gmail, Kalender, Meeting-Transkripte, Slack/Teams). TaskFlow selbst hat keine. Nur mit Zustimmung lesen.
4. **Aufgaben:** Vorschläge machen und erst nach ausdrücklicher Bestätigung anlegen – Ablauf im Skill `taskflow-aufgaben-erfassen`.
5. **Routine (optional):** Skill `taskflow-routine`.
6. **Abschluss:** `get_help` aufrufen und 3–4 Beispielsätze zeigen, die zum Eingerichteten passen – ohne Tool-Namen. Sagen, dass „Hilfe“ jederzeit geht.

## Regeln

- Vor dem Anlegen oder Umschreiben von Aufgaben `get_instructions` lesen und befolgen.
- Nichts anlegen, schließen oder löschen ohne Bestätigung.
- Links zu Aufgaben nie selbst bauen: das `url`-Feld aus den Ergebnissen als „In TaskFlow öffnen“ anbieten.
- Fehlt ein Tool oder kommt `forbidden`: `get_access` aufrufen (Skill `taskflow-fehler`).
