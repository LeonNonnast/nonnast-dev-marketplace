---
name: instaslides-einrichten
description: Richtet Instaslides ein und prüft die Verbindung – gehosteter MCP-Server mit Anmeldung, Free oder Pro, lokale Alternative mit npm-Paket und Lizenzschlüssel. Verwenden, wenn jemand Instaslides zum ersten Mal nutzt, "richte Instaslides ein", "wie fange ich an", "Pro aktivieren", "Wasserzeichen entfernen", "Instaslides verbinden" sagt, oder wenn Instaslides-Tools wie get_schema fehlen.
---

# Instaslides einrichten

Instaslides macht aus YAML (Format **ISPD**) eine animierte HTML-Präsentation. Der MCP-Server läuft **gehostet** unter `https://www.instaslides.io/mcp`; man meldet sich mit seinem Instaslides-Konto an (E-Mail-Link, kein Passwort). Präsentationen werden dort nur zum Rendern verarbeitet und nicht gespeichert. Website: https://instaslides.io

## 1. Verbindung prüfen

- Sind Tools wie `get_schema`, `validate` und `preview` da, ist der Server verbunden – weiter mit Schritt 2.
- **Claude Code:** Das Plugin trägt den Server `instaslides` ein. Steht er in `/mcp` auf „needs authentication“, dort `instaslides` wählen → „Authenticate“ → im Browser anmelden und einmal auf „Connect“ klicken.
- **claude.ai / Claude Desktop:** „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“, URL `https://www.instaslides.io/mcp`, „Connect“. Wer auf instaslides.io schon angemeldet ist, wird ohne weitere Rückfrage verbunden; sonst kommt ein E-Mail-Link.
- Doppelte Tools: einen älteren Eintrag entfernen (`claude mcp remove instaslides`), das Plugin bringt den Server mit.
- Verbundene Assistenten lassen sich im Konto auf https://www.instaslides.io/account trennen.

## 2. Plan prüfen

`license_status` aufrufen und das Ergebnis in einem Satz wiedergeben. Der Plan hängt am angemeldeten Konto.

| | Free | Pro |
|---|---|---|
| Komponenten, Vorschau im Chat, Export | ✔ | ✔ |
| Templates | `pitch`, `lesson` | zusätzlich `report`, `tech-talk` |
| Themes | `midnight`, `paper`, `corporate`, `vivid` | zusätzlich eigene Farben, Schriften, Radius |
| Hinweis „Made with Instaslides“ | ja | nein |

## 3. Pro (nur wenn gewünscht)

Keine Abos abschließen oder bewerben. Fragt die Person selbst danach: Pro gibt es im Konto unter https://www.instaslides.io/account. Danach wirkt es sofort beim nächsten Tool-Aufruf – kein Schlüssel nötig.

## 4. Lokale Alternative (nur bei Bedarf)

Für Präsentationen mit **lokalen Bildern** oder eine Live-Vorschau, die beim Speichern neu lädt, gibt es das npm-Paket als lokalen stdio-Server (Node.js ≥ 20): `claude mcp add instaslides-local -- npx -y instaslides`. Die Tools nehmen dann Dateipfade (`path`) statt Text (`source`). Pro lokal: Schlüssel (`isl_…`) im Konto holen, die Person führt `npx instaslides activate isl_…` aus (in Claude Code: `! npx instaslides activate isl_…`). Den Schlüssel nie selbst in Dateien, Repos oder Chat-Ausgaben schreiben.

## 5. Abschluss

Zwei, drei Beispielsätze zeigen, z. B.:
- „Mach mir 8 Folien zu unserem Quartalsergebnis.“
- „Bau aus dieser README einen Tech-Talk und zeig die Vorschau.“
- „Exportier die Präsentation als HTML-Datei.“

Für das Erstellen selbst: Skill `instaslides-praesentation`.
