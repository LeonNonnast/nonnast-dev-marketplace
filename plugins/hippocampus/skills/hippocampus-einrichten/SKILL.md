---
name: hippocampus-einrichten
description: Richtet Hippocampus ein und prüft die Verbindung – zwei MCP-Server (Suchen und Merken), Anmeldung per E-Mail-Code, Abo, erste Schritte. Verwenden, wenn jemand Hippocampus zum ersten Mal nutzt, "richte Hippocampus ein", "Gedächtnis verbinden", "wie fange ich an" sagt, oder wenn Hippocampus-Tools wie search oder remember fehlen.
---

# Hippocampus einrichten

Hippocampus ist ein persönliches Langzeitgedächtnis für KI-Assistenten. Alle verbundenen Assistenten (Claude, ChatGPT, Codex …) lesen und schreiben dasselbe Gedächtnis. Es gibt zwei MCP-Server:

| Server | URL | Tools |
|---|---|---|
| `hippocampus` (Suchen) | `https://hippocampus.nonnast.dev/mcp` | `search`, `fetch_document`, `list_documents`, `grep`, `glob`, `read`, `ls`, `list_projects`, `list_domains`, `list_templates`, `get_template` |
| `hippocampus-write` (Merken) | `https://hippocampus.nonnast.dev/ingest/mcp` | `remember` |

## 1. Verbindung prüfen

- `list_domains` aufrufen. Klappt das, ist das Suchen verbunden. Ist auch `remember` da, ist das Merken verbunden. Dann weiter mit Schritt 3.
- **Claude Code:** Das Plugin trägt beide Server ein. Stehen sie in `/mcp` auf „needs authentication“, dort jeweils „Authenticate“ wählen. Im Browser die E-Mail-Adresse des Abos eingeben und den Code aus der Mail. Wer lieber einen Schlüssel nutzt, findet „Mit Schlüssel anmelden“ auf derselben Seite.
- **claude.ai / Claude Desktop:** „Customize“ → „Connectors“ → „Add custom connector“, Name „Hippocampus“, URL `https://hippocampus.nonnast.dev/mcp`, Client-ID und Secret leer lassen, „Connect“. Dasselbe mit „Hippocampus merken“ und `https://hippocampus.nonnast.dev/ingest/mcp`.
- **Andere Assistenten:** Die Person kann dort sagen: „Richte mir Hippocampus ein: https://hippocampus.nonnast.dev/start“.
- Doppelte Tools: ältere Einträge entfernen (`claude mcp remove hippocampus`, `claude mcp remove hippocampus-write`), das Plugin bringt beide Server mit.

## 2. Kein Abo?

Ohne Abo klappt die Anmeldung nicht. Abos gibt es unter https://hippocampus.nonnast.dev/#preise (14 Tage kostenlos). Nichts selbst abschließen und nicht dafür werben. Nur darauf hinweisen, wenn die Person fragt oder die Anmeldung daran scheitert.

## 3. Erste Schritte

1. Mit `list_domains` in zwei Sätzen zeigen, welche Bereiche es gibt. Zum Start sind das `projects`, `learning` und `personal`.
2. Fragen, woran die Person gerade arbeitet, und anbieten, das als erstes Projekt abzulegen. Dafür `remember` mit `type: "project"`, Titel = Projektname, Inhalt = Ziel in drei Sätzen. Erst nach Zustimmung speichern.
3. Mit `search` zeigen, dass es wiedergefunden wird.

Beispielsätze für danach:
- „Merk dir, wie wir das gerade gelöst haben.“
- „Was hatten wir zur Architektur von <Projekt> entschieden?“
- „Leg die Entscheidung als ADR ab.“
- „Welche Projekte habe ich?“

Zum Ansehen und Aufräumen gibt es die Konsole: https://hippocampus.nonnast.dev/console/

## Regeln

- Nie nach Anmeldecode oder Schlüssel (`ctk_…`) im Chat fragen. Beides wird nur auf der Anmeldeseite eingegeben.
- Schlüssel nie in Dateien, Repos oder `.mcp.json` schreiben.
