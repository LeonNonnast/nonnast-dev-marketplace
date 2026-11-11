---
name: taskflow-aufgaben-erfassen
description: Erfasst Aufgaben in TaskFlow – aus Mails, Meeting-Transkripten, Kalendereinträgen, Chats oder einfach aus dem Gespräch, ohne Dubletten und mit Quelle. Verwenden bei "leg eine Aufgabe an", "schreib das auf meine Liste", "mach Tasks aus der Mail", "Aufgaben aus dem Meeting", "erinnere mich an …", "add a task", "todo".
---

# Aufgaben erfassen

## Einzelne Aufgabe aus dem Gespräch
1. `get_instructions(project_id?)` lesen – Workspace- und Projektregeln (Titelstil, Pflichtangaben, Tags) gelten.
2. Projekt bestimmen: `list_projects` (passendes Projekt vorschlagen). Ohne Projekt und bei mehreren Workspaces `workspace_id` aus `list_workspaces` nötig.
3. Felder ableiten: `title` (kurz, mit Verb), `description` (Markdown), `priority` (low/medium/high/urgent), `due_at` (ISO-8601; reines Datum = Mitternacht UTC – lieber Datum mit Uhrzeit und Offset), `tags`.
4. Kurz zeigen und nach dem Ja `create_task(...)`. Das `url` aus dem Ergebnis als „In TaskFlow öffnen“ anbieten.

## Aufgaben aus Quellen (Mail, Meeting, Kalender, Chat)
1. Nur mit Zustimmung die Quelle über die Connectors **dieses** Clients lesen.
2. **Dubletten vermeiden:** `list_tasks(external_system=["mail"], text=…)` bzw. passendes System prüfen, ob die Quelle schon erfasst ist.
3. Vorschläge als Liste zeigen: Titel · Fälligkeit · Priorität · Quelle. Die Person wählt aus.
4. Für jede bestätigte Aufgabe `create_task` mit
   - `external_refs=[{system: "mail" | "transcript" | "calendar" | "chat", externalId: <ID des Objekts>, url?, title?}]`
   - `idempotency_key` (z. B. `<system>:<externalId>`), damit Wiederholungen nichts doppelt anlegen
   - Quelle kurz in der `description` vermerken.
5. `conflict: External reference is already linked to another task` heißt: gibt es schon – die vorhandene Aufgabe zeigen statt neu anlegen.

## Ändern und abschließen
- Finden: `list_tasks(text=…)` → `get_task(id)`.
- Ändern: `update_task(id, …, expected_version)` – `null` löscht ein Feld; `tags` und `external_refs` ersetzen die ganze Liste, also vorher lesen und vollständig senden.
- Erledigt: `update_task(id, status="completed")` – nur nach Rückfrage.
- Löschen: `delete_task(id)` landet im Papierkorb; `restore_task(id)` holt es zurück.
