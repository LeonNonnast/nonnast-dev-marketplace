---
name: d2p-fehler
description: Erklärt Fehlermeldungen und Probleme von Design2Production mit Ursache und Lösung – Verbindung/Anmeldung klappt nicht, Tools fehlen, kein Anmeldelink, PROJECT-REQUIRED, PRINT-IN-APP, BODY-VALUES-IN-APP, UNKNOWN-SIZE, Regler außerhalb des Bereichs. Verwenden, wenn ein d2p-Tool einen Fehler liefert oder die Person sagt "Design2Production geht nicht" oder "der Schnitt druckt nicht".
---

# Design2Production-Fehler beheben

1. Den Code aus der Antwort nehmen (`dev.nonnast.d2p…:<CODE>` oder Fehlerart wie `not_found`) und in `references/known-errors.md` nachschlagen.
2. Ursache in einem Satz in Alltagssprache erklären, dann den nächsten Schritt anbieten. Links aus `details.openInApp` immer weitergeben.
3. Nicht in der Liste: Meldung wörtlich zeigen und auf https://d2p.nonnast.dev/hilfe verweisen.

## Schnellcheck Verbindung

- **Tools fehlen ganz:** Claude Code → `/mcp`; steht `d2p` auf „needs authentication“ oder „failed“: „Authenticate“ und im Browser anmelden. claude.ai: Connector unter „Customize“ → „Connectors“ neu verbinden.
- **401 / Anmeldung abgelaufen oder in der App getrennt:** neu verbinden.
- **Kein Anmeldelink kommt:** Zugang nur mit Einladung (Warteliste https://d2p.nonnast.dev/warteliste); Spam-Ordner prüfen; den Link im selben Browser öffnen, in dem die Anmeldung begonnen wurde.
