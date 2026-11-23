---
name: instaslides-fehler
description: Erklärt Fehlermeldungen und Probleme von Instaslides mit Ursache und Lösung – Verbindung/Anmeldung klappt nicht, Tools fehlen, "cannot read local files", Bild nicht geladen, Link abgelaufen, Validierungsfehler, Template ist Pro, Vorschau erscheint nicht im Chat, Morph-Übergang wirkt nicht. Verwenden, wenn ein Instaslides-Tool einen Fehler oder eine Warnung liefert oder die Person sagt "Instaslides geht nicht".
---

# Instaslides-Fehler beheben

1. Die exakte Meldung nehmen und in `references/known-errors.md` nachschlagen.
2. Ursache in einem Satz erklären, dann beheben – Änderungen an der YAML-Datei direkt, Überschreiben fremder Dateien oder Lizenzänderungen nur nach Zustimmung.
3. Nach jeder Korrektur `validate` erneut aufrufen.
4. Nicht in der Liste: Meldung wörtlich zeigen, mit `get_schema` die richtige Syntax nachschlagen.

## Schnellcheck Verbindung (gehosteter Server)

- **Tools fehlen ganz:** Claude Code → `/mcp`; steht `instaslides` auf „needs authentication“ oder „failed“: dort „Authenticate“ wählen und im Browser anmelden. claude.ai: Connector unter „Customize“ → „Connectors“ prüfen und neu verbinden.
- **401 / „Connect Instaslides (OAuth)“:** Anmeldung abgelaufen oder im Konto getrennt → neu verbinden.
- **Doppelte Tools:** älteren Eintrag mit `claude mcp remove instaslides` entfernen; das Plugin bringt den Server mit.
- **Vorschau erscheint nicht im Chat:** Claude Code und manche Clients zeigen keine MCP-Apps – dann den Link aus der `preview`-Antwort nutzen (60 Minuten gültig).
- **Lokales npm-Paket statt gehostet:** Meldungen wie `File not found: <pfad>` oder eine localhost-Vorschau-URL kommen vom lokalen Server. Dort gelten `node --version` (≥ 20), `npx -y instaslides --help`, `INSTASLIDES_PORT` für den Port, und die Vorschau-URL nur auf demselben Rechner.
