---
name: hippocampus-merken
description: Legt dauerhaftes Wissen in Hippocampus ab oder aktualisiert es – Lösungen, Erkenntnisse, Projektideen, Architekturnotizen und Entscheidungen als ADR (MADR, Nygard, Y-Statement). Verwenden bei "merk dir das", "speicher das im Gedächtnis", "leg das als ADR ab", "halt die Entscheidung fest", "neues Projekt anlegen", oder wenn am Ende einer Arbeit eine wiederverwendbare Lösung entstanden ist.
---

# Wissen merken

Speichern geht nur über den Server `hippocampus-write` (Tool `remember`). Fehlt er, der Person sagen, was du speichern würdest, und auf den Skill `hippocampus-einrichten` verweisen.

## Ablauf

1. **Verdichten.** Wissen ablegen, keinen Chatverlauf. Klarer Titel, Inhalt in Markdown, so kurz wie möglich und so vollständig wie nötig. Bei Lösungen: Problem, Ursache, Fix.
2. **Datenschutz prüfen (Pflicht).** Vor jedem `remember` den Inhalt durchsehen:
   - Keine Namen von Kunden oder Auftraggebern, deren Mitarbeitenden, und keine URLs oder Repo-Pfade, die sie verraten. Stattdessen allgemein formulieren („ein Kundenprojekt“, „Werk A“), die Branche darf bleiben. Ausnahme: Die Person verlangt es ausdrücklich.
   - Keine Passwörter, API-Keys, Tokens oder anderen Secrets.
3. **Einordnen.**
   - `type`: `insight`, `troubleshooting`, `news`, `reminder`, `quote`, `reference`, `note`, `project`, `idea`, `architecture` oder `decision`.
   - `domain`: nur eine vorhandene aus `list_domains`, nie eine erfinden. Mit `project` ist es automatisch `projects`.
   - Für Projektarbeit `project` mit dem exakten Namen aus `list_projects`. Für Wissen ohne Projekt `area` und ggf. `language` (z. B. `area: "power-platform"`, `language: "python"`).
   - Vorhandene Areas, Tags und Projektnamen wiederverwenden. Zeitlich begrenzte Infos (News, Erinnerungen) bekommen `expires_at` (ISO-8601).
4. **Speichern.** `remember(title, content, type, …)` aufrufen und das Ergebnis auswerten:
   - `created` / `updated`: kurz bestätigen und Titel nennen. Neue Einträge sind nach wenigen Minuten bis spätestens am nächsten Morgen in der Suche, weil sie erst indexiert werden.
   - `similar` in der Antwort: Passt ein Treffer inhaltlich, lieber diesen aktualisieren (`id` mitgeben). Weggelassene `domain`, `area`, `language` und `project` bleiben erhalten.
   - `possible_duplicate`: Eintrag mit gleichem Titel existiert. Diesen aktualisieren, `force: true` nur nach ausdrücklichem Ja.
   - `ambiguous_project`: Projektname ähnelt einem vorhandenen. Mit dem exakten Namen erneut aufrufen. `force: true` legt ein neues Projekt an und nur auf Wunsch.
   - `busy`: Die vorige Version wird noch indexiert. Nach der genannten Zeit erneut versuchen.

## Projekte

Ein Projekt ist ein Eintrag mit `type: "project"`: Titel = Name, Inhalt = Vision und Ziel. Andere Einträge gehören dazu, wenn sie `project: "<Name>"` tragen. Ein unbekannter Name legt den Projektkopf automatisch an.

## Entscheidungen (ADR)

1. `list_templates`, dann `get_template`. Für Software `madr`, für alles andere `decision`. `nygard` und `y-statement` nur auf Wunsch.
2. Jeden Abschnitt füllen. Fehlende Infos (Alternativen, Konsequenzen) kurz erfragen statt erfinden.
3. Pro Projekt nummerieren: mit `search` und `{"project": "<Name>", "type": "decision"}` die höchste Nummer finden, Titel `ADR-007: …`.
4. Mit `type: "decision"`, den Tags aus dem Template und dem Projektnamen speichern.
5. Eine abgelöste Entscheidung wird aktualisiert (Statuszeile „Superseded by ADR-…“) und nie gelöscht.
