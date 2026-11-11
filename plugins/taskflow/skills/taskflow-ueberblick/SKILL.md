---
name: taskflow-ueberblick
description: Gibt einen Überblick über die Aufgaben in TaskFlow – heute fällig, überfällig, diese Woche, nach Projekt oder Priorität, Zählungen und was sich geändert hat. Verwenden bei "was steht heute an", "was ist überfällig", "meine Woche", "Daily", "wie viele offene Aufgaben", "wer hat was geändert", "Status von Projekt X", "what's on my plate".
---

# Überblick

Filter in `list_tasks` und `count_tasks` sind UND-verknüpft. Zeiträume sind halboffen: `due_after` inklusive, `due_before` exklusive. Weitere Filterbeispiele: `references/filter-rezepte.md`.

## Tagesüberblick
1. **Überfällig:** `list_tasks(overdue=true, sort=[{field: "due", dir: "asc"}])`.
2. **Heute:** `list_tasks(status=["open","in_progress"], due_after=<heute 00:00 mit Offset>, due_before=<morgen 00:00>)`.
3. **Dringend ohne Datum:** `list_tasks(status=["open","in_progress"], priority=["urgent","high"], has_due_date=false)`.
4. Kompakt ausgeben: Gruppen „Überfällig · Heute · Wichtig ohne Datum“, je Zeile Titel, Projekt, Priorität, „In TaskFlow öffnen“ (`url`). Höchstens drei Dinge als Fokus für heute vorschlagen.

## Wochenüberblick
1. `count_tasks(status=["open","in_progress"], group_by=["project"])` für die Verteilung.
2. `list_tasks(due_after=<Montag>, due_before=<Montag + 7 Tage>)` für die Woche, nach Tag gruppieren.
3. Hinweise geben: überladene Tage, überfällige Aufgaben, Aufgaben ohne Projekt.

## Zählen statt Blättern
„Wie viele …?“ immer mit `count_tasks` (optional `group_by` project/status/priority/tags, max. 4) beantworten, nicht durch Blättern in `list_tasks`.

## Was hat sich geändert?
`list_changes(since=<Zeitpunkt>, project_id?)` – zeigt wer was geändert hat, mit alt/neu. `origin` unterscheidet diese Verbindung, dieselbe Person (andere App) und andere Personen. Verlauf reicht 30 Tage zurück.

## Viele Ergebnisse
`limit` bis 200, weiter mit `cursor` aus `nextCursor`. Bei sehr vielen Treffern lieber Filter schärfen und zusammenfassen.
