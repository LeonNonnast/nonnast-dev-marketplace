---
name: taskflow-projekt-planen
description: Plant ein Vorhaben in TaskFlow als Projekt mit Features, Unteraufgaben und Abhängigkeiten – zerlegt Ziele in Aufgaben, legt Reihenfolge und Fälligkeiten fest. Verwenden bei "plan das Projekt", "zerleg das in Aufgaben", "leg ein Projekt an", "Unteraufgaben", "was blockiert was", "Projektplan", "break this down".
---

# Projekt planen

## 1. Rahmen
1. Ziel, Endtermin und Beteiligte klären.
2. Projekt wählen oder anlegen: `list_projects`; neu mit `list_icons(query=…)` → `create_project(workspace_id, name, description, icon, color)`.
3. `get_instructions(project_id)` lesen – Projektregeln gelten für alle neuen Aufgaben.

## 2. Struktur vorschlagen
- Ein **Feature** ist eine Elternaufgabe mit Kindern. Zwei Ebenen reichen meist: Feature → Aufgaben.
- Pro Aufgabe: Titel mit Verb, kurzer Markdown-Beschreibung mit „Fertig, wenn …“, Priorität, Fälligkeit.
- Abhängigkeiten benennen: „B kann erst starten, wenn A fertig ist“.
- Alles als eingerückte Liste zeigen und auf Freigabe warten.

## 3. Anlegen (nach dem Ja)
1. Features: `create_task(project_id, title, description, …)`.
2. Aufgaben darunter: `create_task(project_id, parent_id=<Feature-ID>, …)`.
3. Abhängigkeiten: `link_tasks(task_id=A, type="blocks", target_id=B)` (oder `predecessor`/`successor`). Weitere Typen: `related`, `duplicate_of`.
4. Jeweils `idempotency_key` setzen (z. B. `plan:<projekt>:<lfd-nr>`), damit ein Wiederholen nach Abbruch nichts doppelt anlegt.
5. Zum Schluss Übersicht mit Links (`url`) und `count_tasks(project=[id], group_by=["status"])`.

## Umbauen
- Aufgabe verschieben: `link_tasks(task_id, type="parent", target_id=<neues Feature>, replace_parent=true)`.
- Beziehung lösen: `unlink_tasks(task_id, type, target_id)`.
- Projekt umbenennen oder archivieren: `update_project(id, name | archived=true, expected_version)`. Icon/Farbe ändern braucht Einstellungs-Zugriff.

Hinweise: Aufgaben können nicht zwischen Workspaces verschoben werden; Zyklen in der Hierarchie werden abgelehnt (`conflict: Parent would create a cycle`).
