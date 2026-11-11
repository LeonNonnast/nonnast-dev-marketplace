---
name: taskflow-fehler
description: Erklärt TaskFlow-Fehlermeldungen und Verbindungsprobleme mit Ursache und Lösung – forbidden, payment_required, conflict, validation, 401, fehlende Tools. Verwenden, wenn ein TaskFlow-Tool einen Fehler liefert, ein Tool fehlt oder die Person sagt "TaskFlow geht nicht", "darf ich nicht", "Version mismatch".
---

# TaskFlow-Fehler beheben

Fehler kommen als `<code>: <message>` (Codes: `not_found`, `conflict`, `validation`, `forbidden`, `payment_required`, `internal`).

1. Code und Meldung in `references/known-errors.md` nachschlagen.
2. Bei `forbidden` oder fehlenden Tools immer zuerst `get_access` aufrufen und das Ergebnis in einem Satz erklären.
3. Ursache nennen, Lösung ausführen bzw. der Person den nötigen Schritt sagen. Nichts ohne Zustimmung ändern.

## Schnellcheck Verbindung
- **Tools fehlen ganz / 401 `Authentication required` / `Invalid or expired token`:** Claude Code → `/mcp` → `taskflow` → neu anmelden. claude.ai → Connector „Connect“. Die Anmeldung bleibt bestehen, wenn sie mindestens alle 30 Tage genutzt wird.
- **Nur Lese-Tools sichtbar:** Die Verbindung wurde nur mit Lesezugriff erlaubt. Neu verbinden und auf „Zugriff erlauben?“ Schreiben erlauben.
- **Server nicht erreichbar (404, „endpoint not found“):** TaskFlow ist gerade nicht erreichbar; später erneut versuchen.
- **Doppelte Tools in Claude Code:** Ist TaskFlow zusätzlich per `claude mcp add` eingetragen, den alten Eintrag mit `claude mcp remove taskflow` entfernen – das Plugin bringt den Server mit.
- **`internal`:** Bei Schreibaktionen wurde nichts geändert. Kurz warten, erneut versuchen; bleibt es, auf den Support in der Web-App verweisen.
