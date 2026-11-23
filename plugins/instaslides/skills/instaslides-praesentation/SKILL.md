---
name: instaslides-praesentation
description: Erstellt oder überarbeitet mit Instaslides eine animierte HTML-Präsentation – Inhalt klären, Template wählen, ISPD-YAML schreiben, prüfen, Vorschau im Chat zeigen, als einzelne HTML-Datei exportieren und eine frühere Präsentation (exportierte HTML-Datei) weiterbearbeiten. Verwenden bei "mach mir Folien", "Präsentation zu …", "Pitch-Deck", "Tech-Talk", "Foliensatz aus diesem Dokument", "zeig die Vorschau", "exportier die Präsentation", "bearbeite meine Präsentation", oder wenn eine Instaslides-Präsentation (.yaml oder .html) bearbeitet werden soll.
---

# Präsentation mit Instaslides

Claude schreibt die Folien als YAML (ISPD). Der gehostete Instaslides-Server bekommt das YAML bei jedem Aufruf als `source`, prüft und rendert es – er kann **keine lokalen Dateien lesen** und speichert nichts.

## 1. Inhalt klären (kurz, höchstens drei Fragen)

- Thema und Ziel: Was soll das Publikum danach wissen oder tun?
- Publikum (z. B. Investoren, Team, Kunden, Schulklasse) und ungefähre Folienzahl.
- Quelle: vorhandenes Material (Dokument, README, Zahlen) nutzen, statt Inhalte zu erfinden. Fehlen Zahlen, Platzhalter markieren und darauf hinweisen.

Ist das alles schon gesagt, nicht nachfragen – direkt loslegen.

## 2. Format laden

`get_schema` aufrufen, **bevor** du YAML schreibst oder änderst. Nur Komponenten, Props und Layouts aus dieser Referenz verwenden – nichts erfinden.

## 3. Anlegen

1. `list_templates` – passendes Template: `pitch` (Investoren, Produkt), `lesson` (Unterricht), `report` (Ergebnisse, Zahlen), `tech-talk` (Technik). `[Pro]`-Templates gehen im Free-Plan nicht.
2. `use_template(template, title?, subtitle?, author?, theme?)` liefert das YAML des Templates.
3. Wo das YAML lebt:
   - **Claude Code / mit Dateizugriff:** als Datei im Projekt speichern (Standard `slides/<thema-slug>.yaml`) und mit den Datei-Tools bearbeiten. Bei jedem Tool-Aufruf den aktuellen Dateiinhalt als `source` mitgeben.
   - **claude.ai ohne Dateien:** das YAML im Gespräch halten und bei jedem Aufruf vollständig als `source` übergeben.

## 4. Folien schreiben

Regeln: `references/gestaltung.md`. Kurz:

- Eine Idee pro Folie; die Überschrift sagt die Kernaussage.
- Metriken, Charts, Timelines, Karten und Tabellen statt Aufzählungen.
- Details in die Sprecher-Notizen (`notes`), nicht auf die Folie.
- Wiederkehrende Elemente mit gleichem `flip_id` + `slide_transition: { type: morph }` gleiten lassen.
- Bilder nur als `https://`-URL oder `data:`-URI – lokale Pfade gehen mit dem gehosteten Server nicht.

## 5. Prüfen

`validate(source)` und **jeden** Fehler (✖) beheben, Warnungen möglichst auch. Die Meldungen nennen Zeilennummern im YAML. Wiederholen, bis „✔ Valid“. Unklare Meldungen: Skill `instaslides-fehler`.

## 6. Vorschau

`preview(source)`:
- **claude.ai / Claude Desktop:** Die Präsentation erscheint direkt im Chat (Vollbild-Knopf oben rechts, Download-Knopf für die HTML-Datei). Kurz sagen, dass man mit ←/→ blättert.
- **Claude Code und andere ohne Chat-Ansicht:** Die Antwort enthält einen Link (`https://www.instaslides.io/x/…`), 60 Minuten gültig – der Person geben.

Nach jeder Änderung erneut `preview` aufrufen; es gibt kein automatisches Nachladen. Tasten: ←/→, `F` Vollbild, `N` Notizen.

## 7. Exportieren (wenn gewünscht)

`export_html(source)` liefert einen Download-Link für eine eigenständige `.html`-Datei (60 Minuten gültig).
- **Mit Shell (Claude Code):** herunterladen und neben dem YAML ablegen, z. B. `curl -fsSL -o slides/<name>.html "<link>"`, Pfad nennen.
- **Sonst:** den Link der Person geben (oder in der Chat-Ansicht den Download-Knopf nutzen).

Im Free-Plan trägt die Datei den Hinweis „Made with Instaslides“ – einmal erwähnen, nicht bewerben.

## 8. Später weiterbearbeiten

Jede exportierte Instaslides-HTML-Datei enthält ihr YAML im Block `<script type="text/x-ispd+yaml" id="ispd-source">…</script>` (weit oben im `<head>`).
- **Mit Code-Ausführung / Shell:** nur diesen Block herausziehen, nicht die ganze Datei lesen (sie ist ~100 KB groß), z. B.
  `python3 -c "import re,sys;s=open(sys.argv[1]).read();m=re.search(r'id=\"ispd-source\">\n?(.*?)</script>',s,re.S);print(m.group(1).replace('<\\\\/script','</script').replace('<\\\\!--','<!--'),end='')" deck.html`
- **Ohne:** die ganze HTML-Datei als `source` übergeben – der Server zieht das YAML selbst heraus (kostet mehr Tokens).
Dann wie gewohnt bearbeiten, prüfen, Vorschau, Export.

## Regeln

- Keine Inhalte, Zahlen oder Zitate erfinden, die als Fakten erscheinen.
- Keine fremden Dateien überschreiben.
- Lizenz und Plan: Skill `instaslides-einrichten`.
