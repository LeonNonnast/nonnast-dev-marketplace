---
name: taskflow-routine
description: Legt in TaskFlow eine wiederkehrende Routine an oder führt sie aus – z. B. jeden Morgen Mails sichten und Aufgaben vorschlagen, freitags Wochenrückblick. Speichert die Routine in den Projekt-Instruktionen und plant sie im Client ein. Verwenden bei "Routine", "jeden Morgen", "regelmäßig", "automatisch jede Woche", "führe die Routine aus", "Projektregeln ändern".
---

# Routinen

TaskFlow führt selbst nichts zeitgesteuert aus. Eine Routine ist eine **Beschreibung** in den Projekt-Instruktionen; ausgeführt wird sie vom Planer des Clients (Claude Code: `/schedule` oder `/loop`) oder auf Zuruf.

## Routine anlegen (braucht Einstellungs-Zugriff)
1. Mit der Person klären: Name, Zeitplan, Quellen, Ablauf, wann nachgefragt wird.
2. `get_instructions(project_id)` – aktuellen Text und `version` lesen.
3. Abschnitt **anhängen** (Bestehendes unverändert lassen):
   ```markdown
   ## Routine: Morgen-Inbox
   - Zeitplan: werktags 8:00
   - Quellen: Outlook-Posteingang der letzten 24 h
   - Ablauf: Mails mit Handlungsbedarf als Aufgaben vorschlagen (external_refs system "mail"), Dubletten prüfen
   - Rückfrage: Vorschläge immer bestätigen lassen, nichts automatisch anlegen
   ```
4. Ganzen neuen Text zeigen; nach dem Ja `set_instructions(project_id, markdown, expected_version)`.
5. Einplanen im Client – Claude Code: mit `/schedule` einen wiederkehrenden Lauf anlegen, der „Führe die TaskFlow-Routine ‚Morgen-Inbox‘ im Projekt <Name> aus“ startet. In claude.ai die Routine bei Bedarf per Zuruf starten.

## Routine ausführen
1. `get_instructions(project_id)` und den Abschnitt `## Routine: <Name>` lesen.
2. Den Ablauf genau so ausführen; Aufgaben aus Quellen über Skill `taskflow-aufgaben-erfassen` (mit `external_refs` und Dublettencheck).
3. Kurzes Ergebnis: was gefunden, was angelegt, was offen ist.

`conflict: Instructions changed concurrently; reload before retrying` → neu lesen, Änderung erneut einarbeiten, mit neuer `expected_version` speichern.
