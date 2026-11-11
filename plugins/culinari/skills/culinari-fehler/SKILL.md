---
name: culinari-fehler
description: Erklärt Fehlermeldungen und Verbindungsprobleme von Culinari mit Ursache und Lösung – Anmeldung hängt, "Authentication required", Rezept wird nicht gespeichert, Session-Limit, Koch nicht gefunden. Verwenden, wenn ein Culinari-Tool einen Fehler liefert, Culinari-Tools fehlen oder die Person sagt "Culinari geht nicht".
---

# Culinari-Fehler beheben

1. Die exakte Fehlermeldung nehmen und in `references/known-errors.md` nachschlagen.
2. Ursache in einem Satz erklären, dann die Lösung ausführen – Lösungen, die etwas ändern (Session beenden, Koch hinzufügen), nur nach Zustimmung.
3. Nicht in der Liste: Meldung wörtlich zeigen und anbieten, es mit angepassten Parametern erneut zu versuchen.

## Schnellcheck Verbindung

- **Tools fehlen ganz:** Claude Code → `/mcp` öffnen; steht `culinari` auf „failed“ oder „needs authentication“, dort anmelden. claude.ai → Connector unter „Customize“ → „Connectors“ prüfen und „Connect“ wählen.
- **Anmeldung hängt bei „Connect“:** Den Magic Link im selben Browser öffnen, in dem die Anmeldung begonnen hat. Höchstens 3 Links pro Stunde – sonst kurz warten.
- **Server nicht erreichbar (404, „endpoint not found“):** Culinari ist gerade nicht erreichbar. Später erneut versuchen; Status in der Web-App https://culinari.nonnast.dev prüfen.
- **Doppelte Tools in Claude Code:** Ist Culinari zusätzlich per `claude mcp add` eingetragen, den alten Eintrag mit `claude mcp remove culinari` entfernen – das Plugin bringt den Server mit.
