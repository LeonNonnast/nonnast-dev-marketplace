# Bekannte Fehler von Design2Production

| Code / Meldung | Ursache | Lösung |
|---|---|---|
| `PROJECT-REQUIRED` | `d2p.atelier.start` ohne `projectId`, aber die Erlaubnis „Neue Kleidungsstücke anlegen“ fehlt. | Verbindung neu herstellen und das Häkchen setzen, oder ein vorhandenes Kleidungsstück freigeben und dessen `projectId` übergeben. |
| `AGENT-CREATE-LIMIT` | Grenze für neue Kleidungsstücke erreicht (50 je Verbindung, 20 je 24 Stunden). | Später erneut versuchen oder ein vorhandenes Kleidungsstück nutzen. |
| `PRINT-IN-APP` | Das Kleidungsstück nutzt eigene Körpermaße; Assistenten drucken nur nach Konfektionsgröße. | Link aus `details.openInApp` weitergeben, gedruckt wird in der App. Ein Probedruck in einer Tabellengröße geht nur ausdrücklich mit `sizeKey`. |
| `PROFILE-NOT-READABLE` | Vorschau mit eigenen Maßen ist für Assistenten gesperrt. | Regler trotzdem speichern lassen; die Vorschau zeigt die App über den Link in `details.openInApp`. |
| `BODY-VALUES-IN-APP` | Körpermaße oder daraus berechnete Geometrie werden nie an Assistenten gegeben. | Auf die App verweisen; nicht nach Maßen fragen. |
| `UNKNOWN-SIZE` | Die Größe gibt es in der Tabelle der Vorlage nicht. | Mit `d2p.atelier.size_options` die vorhandenen Größen zeigen. |
| `SIZE-OR-MEASUREMENTS` | Weder Größe noch Maße angegeben. | Größe nennen lassen (`sizeKey`) oder in der App mit eigenen Maßen starten. |
| `NO-TEMPLATE-SIZE-TABLE` / `TABLE-MISSES-MEASUREMENT` | Die Vorlage hat keine passende Größentabelle bzw. der Tabelle fehlt ein Pflichtmaß. | Andere Vorlage wählen oder in der App mit eigenen Maßen arbeiten. |
| `MEASUREMENT-INVALID` | Ein eingegebenes Maß liegt außerhalb des erlaubten Bereichs. | Maß in der App prüfen und neu eingeben. |
| `PRINT-INVALID` | Druckauftrag passt nicht (Papier, Größen, Modus). | Papier A4 oder A3, höchstens 16 Größen; Angaben korrigieren. |
| `idempotency_key_reused` | Derselbe `idempotencyKey` wurde mit anderen Angaben benutzt. | Für einen neuen Start einen neuen Schlüssel vergeben; zum Fortsetzen genau dieselben Angaben senden. |
| `not_found` | ID unbekannt oder nicht freigegeben (unsichtbar = nicht vorhanden). | IDs nur aus Antworten übernehmen; mit `d2p.atelier.list_projects` neu suchen. |
| `forbidden` | Recht fehlt (z. B. Scope nicht erteilt). | Verbindung mit den nötigen Rechten neu herstellen. |
| Regler „außerhalb des Bereichs“ | Wert außerhalb von Minimum/Maximum oder nicht im Raster. | Bereich und Schritt aus der Antwort nennen und einen gültigen Wert wählen. |
