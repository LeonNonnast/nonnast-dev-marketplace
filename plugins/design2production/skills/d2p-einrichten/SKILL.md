---
name: d2p-einrichten
description: Richtet Design2Production (digitales Atelier für Schnittmuster) ein und prüft die Verbindung – Anmeldung per E-Mail-Link, Zugang über Warteliste, Erlaubnis „Neue Kleidungsstücke anlegen“. Verwenden, wenn jemand Design2Production zum ersten Mal nutzt, "richte Design2Production ein", "Schnittmuster-App verbinden", "D2P verbinden" sagt, oder wenn Tools wie d2p.atelier.search_templates fehlen.
---

# Design2Production einrichten

Design2Production macht aus einer Vorlage ein Schnittmuster zum Ausdrucken. Der MCP-Server läuft gehostet unter `https://d2p.nonnast.dev/mcp`. Die Person meldet sich mit ihrem Konto an (E-Mail-Link, kein Passwort). Sprich sie mit „Sie“ an und erkläre in Alltagssprache; viele Nutzerinnen sind keine Technikerinnen.

## 1. Verbindung prüfen

- `d2p.identity.whoami` aufrufen. Antwortet es, ist die Verbindung da – weiter mit Schritt 3.
- **Claude Code:** Das Plugin trägt den Server `d2p` ein. Steht er in `/mcp` auf „needs authentication“: dort `d2p` wählen → „Authenticate“ → im Browser anmelden, Anmeldelink im selben Browser öffnen, „Zugriff erteilen“.
- **claude.ai / Claude Desktop:** „Customize“ → „Connectors“ → „+ Add“ → „Add custom connector“, URL `https://d2p.nonnast.dev/mcp`, „Connect“.
- Doppelte Tools: älteren Eintrag mit `claude mcp remove d2p` entfernen; das Plugin bringt den Server mit.

## 2. Kein Konto?

Der Zugang läuft derzeit über eine Warteliste mit Einladung: https://d2p.nonnast.dev/warteliste. Ohne Einladung kommt kein Anmeldelink – das ist kein Fehler.

## 3. Erlaubnis zum Anlegen

Damit der Assistent selbst neue Kleidungsstücke anlegen darf, muss die Person bei der Zustimmung das Häkchen „Neue Kleidungsstücke für mich anlegen“ setzen. Fehlt es, meldet `d2p.atelier.start` ohne `projectId` den Code `PROJECT-REQUIRED`. Dann entweder die Verbindung neu herstellen und das Häkchen setzen, oder sie gibt ein vorhandenes Kleidungsstück frei. Verbindungen und Erlaubnisse verwaltet sie in der App unter Konto → Verbindungen.

## 4. Abschluss

Zwei Beispielsätze zeigen:
- „Ich möchte einen einfachen Rock in Größe 38 nähen.“
- „Zeig mir meine Kleidungsstücke.“

Für den Ablauf selbst: Skill `d2p-kleidungsstueck`.
