# Bekannte Hippocampus-Meldungen

## Verbindung und Anmeldung

| Meldung / Symptom | Ursache | Lösung |
|---|---|---|
| HTTP 401, „needs authentication“ | Nicht oder nicht mehr angemeldet | `/mcp` → „Authenticate“ bzw. den Connector neu verbinden. Auf der Anmeldeseite E-Mail des Abos und Code aus der Mail eingeben. |
| Anmeldung mit E-Mail klappt nicht | Kein Abo mit dieser Adresse | Adresse prüfen. Ohne Abo: https://hippocampus.nonnast.dev/#preise (nur auf Nachfrage nennen). |
| Nur Lese-Tools da, kein `remember` | `hippocampus-write` fehlt oder ist nicht angemeldet | Zweiten Server (`/ingest/mcp`) verbinden. Bis dahin der Person sagen, was gespeichert würde. |
| Erster Aufruf läuft in ein Timeout | Dienst schläft bei Leerlauf | Erneut aufrufen. |

## `remember`

| Meldung / `status` | Ursache | Lösung |
|---|---|---|
| `title must not be empty` / `content must not be empty` | Pflichtfeld leer | Titel und Inhalt füllen. |
| `unknown type '<x>'; one of …` | Typ gibt es nicht | Einen der genannten Typen nehmen (`insight`, `troubleshooting`, `note`, `decision` …). |
| `tag '<x>' must not contain ','` / `tags must not be empty` | Komma im Tag oder leerer Tag | Tags als Liste einzelner Wörter übergeben. |
| `repo_url must be an http(s) URL` | `repo_url` ist kein Link | Vollständige `https://`-URL oder weglassen. |
| `expires_at '<x>' is not an ISO-8601 timestamp` | Datum falsch formatiert | z. B. `2026-12-31` oder `2026-12-31T18:00:00Z`. |
| `no Hippocampus entry with id '<x>'` | `id` falsch oder Eintrag gelöscht | Mit `search` die richtige `hippo:<uuid>` suchen. |
| `status: possible_duplicate` | Eintrag mit gleichem Titel existiert | Den vorhandenen aktualisieren (`id` aus `similar`). `force: true` nur nach Ja. |
| `status: ambiguous_project` | Projektname ähnelt einem vorhandenen (`candidates`) | Exakten Namen aus `candidates` nehmen. `force: true` legt ein neues Projekt an. |
| `status: busy`, „retry in N s“ | Vorige Version wird noch indexiert | Nach N Sekunden erneut. Nicht in einer Schleife. |
| `project_note: Created new project '<x>'.` | Unbekannter Projektname, Projektkopf angelegt | Kein Fehler. War ein Tippfehler gemeint, der Person sagen und Eintrag korrigieren. |

## Suchen und Lesen

| Meldung / Symptom | Ursache | Lösung |
|---|---|---|
| Neuer Eintrag wird nicht gefunden | Neue Einträge warten auf die Indexierung, oft bis zum nächsten Morgen | `fetch_document(id)` mit der `id` aus `remember` funktioniert sofort. Später erneut suchen. |
| Suche liefert nichts, obwohl es den Eintrag gibt | Volltextsuche: andere Wörter oder zu enger Filter | Konkrete Begriffe, Synonyme oder Englisch probieren. Filter lockern. Mit `list_documents` und Filter nachsehen. |
| Filter `project` greift nicht | Name nicht exakt | Exakten Namen aus `list_projects` nehmen. |
| `unknown template '<x>'; available: …` | Template-Name falsch | Einen der genannten Namen (`madr`, `nygard`, `y-statement`, `decision`). |
