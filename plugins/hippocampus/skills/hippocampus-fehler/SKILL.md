---
name: hippocampus-fehler
description: Erklärt Fehlermeldungen und Probleme von Hippocampus mit Ursache und Lösung – Tools fehlen, Anmeldung klappt nicht, remember lehnt ab (unknown type, possible_duplicate, ambiguous_project, busy), neuer Eintrag wird nicht gefunden, Template unbekannt. Verwenden, wenn ein Hippocampus-Tool einen Fehler liefert oder die Person sagt "Hippocampus geht nicht" oder "er findet nichts".
---

# Hippocampus-Fehler beheben

1. Die exakte Meldung bzw. den `status` nehmen und in `references/known-errors.md` nachschlagen.
2. Ursache in einem Satz erklären, dann beheben. `force: true`, Löschen oder Überschreiben fremder Einträge nur nach Zustimmung.
3. Nicht in der Liste: Meldung wörtlich zeigen und nichts raten.

## Schnellcheck Verbindung

- **Tools fehlen ganz:** In Claude Code `/mcp` öffnen. Stehen `hippocampus` oder `hippocampus-write` auf „needs authentication“ oder „failed“, dort „Authenticate“ wählen. In claude.ai die Connectors unter „Customize“ → „Connectors“ prüfen und neu verbinden.
- **Suchen geht, Merken nicht:** Der Schreib-Server `hippocampus-write` (`/ingest/mcp`) ist nicht verbunden. Er wird getrennt angemeldet.
- **Doppelte Tools:** alte Einträge mit `claude mcp remove hippocampus` und `claude mcp remove hippocampus-write` entfernen.
- **Erster Aufruf dauert lange:** Der Server schläft bei Leerlauf und wacht beim ersten Aufruf auf. Einmal erneut versuchen.
