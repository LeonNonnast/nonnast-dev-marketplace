# Bekannte Instaslides-Meldungen

✖ = Fehler (muss behoben werden), ⚠ = Warnung (sollte behoben werden). `validate` nennt dazu die Zeile.

## Gehosteter Server

| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `"<pfad>": the hosted Instaslides server cannot read local files — use an https:// image URL or a data: URI …` | Bild oder Hintergrund mit lokalem Pfad | Bild öffentlich per `https://` verlinken oder als `data:`-URI einbetten; für lokale Bilder das lokale npm-Paket nutzen (Skill `instaslides-einrichten`). |
| `Image <url> not loaded: HTTP 404` / `… not an image …` / `… larger than 3 MB` / `… private or reserved address` | Bild-URL nicht erreichbar, kein Bild, zu groß oder intern | URL im Browser prüfen; öffentliches Bild ≤ 3 MB (insgesamt ≤ 10 MB) verwenden. Die Folie wird ohne das Bild gerendert. |
| `This preview has expired — run preview again.` / Seite „This preview link has expired“ | Links und Vorschauen gelten 60 Minuten und werden nicht gespeichert | `preview` bzw. `export_html` erneut aufrufen. |
| `This HTML file has no embedded Instaslides source …` | HTML stammt nicht von Instaslides oder von einer älteren Version ohne eingebettete Quelle | YAML neu schreiben (`get_schema`), ggf. Inhalte aus der alten Datei übernehmen. |
| `The rendered deck is too large (N MB) — use fewer or smaller images.` | Zu viele/große eingebettete Bilder | Bilder verkleinern oder weniger verwenden. |
| `Too many requests — try again in a few minutes.` (HTTP 429) | Ratenbegrenzung pro Konto | Kurz warten; nicht in einer Schleife wiederholen. |
| `Connect Instaslides (OAuth) to use this server.` (HTTP 401) | Nicht (mehr) verbunden | Neu verbinden (`/mcp` → Authenticate bzw. Connector). |

## Dateien und Templates (lokales Paket: Pfade)

| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `File not found: <pfad>. Create it with use_template or write it yourself (see get_schema).` | Pfad falsch oder Datei noch nicht angelegt | Pfad prüfen (relativ zum Projekt) oder mit `use_template` anlegen. |
| `Unknown template "<x>". Available: …` | Template-ID falsch | `list_templates` und exakte ID verwenden. |
| `The "<x>" template is part of Instaslides Pro. Free templates: pitch, lesson. …` | Pro-Template im Free-Plan | `pitch` oder `lesson` nehmen bzw. selbst schreiben. Pro nur auf Wunsch der Person (Skill `instaslides-einrichten`). |
| `<pfad> already exists. Pass overwrite: true to replace it, or choose another path.` | Zieldatei existiert | Anderen Pfad wählen; `overwrite: true` nur nach ausdrücklichem Ja. |
| `Unknown theme "<x>". Available: midnight, paper, corporate, vivid` | Theme-Name falsch | Einen der vier Namen verwenden. |

## Validierung – Fehler

| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `YAML syntax: …` | Einrückung, fehlendes `:` oder Anführungszeichen | Zeile laut Meldung korrigieren; Texte mit `:` oder `#` in Anführungszeichen setzen. |
| `Unknown component type "<x>". Did you mean "<y>"? Known: …` | Komponente gibt es nicht | Vorschlag übernehmen oder Typ aus `get_schema` nehmen. |
| `Duplicate id "<x>" on this slide` | Gleiche `id` zweimal auf einer Folie | IDs pro Folie eindeutig machen. |
| `flip_id "<x>" is used twice on this slide; it must be unique per slide` | Gleicher `flip_id` doppelt | Pro Folie eindeutig; gleiche `flip_id` nur **zwischen** Folien. |
| `Fragment target "<x>" does not match any component id on this slide` | `fragments.targets` zeigt ins Leere | Passende `id` an der Komponente setzen oder Target korrigieren. |
| `Layout "image_full" needs background.image` | Vollbild-Layout ohne Bild | `background: { image: … }` ergänzen oder anderes Layout. |
| `Has N values but there are M labels` | Chart-Datensatz passt nicht zu `labels` | Jede Datenreihe braucht genau so viele Werte wie Labels. |
| `Row has N cells but there are M headers` | Tabellenzeile unvollständig | Zellen ergänzen oder entfernen. |
| `✖ Not exported — fix the errors first.` | Export mit ungültiger Datei | Erst `validate` fehlerfrei machen. |

## Validierung – Warnungen

| Meldung (Auszug) | Lösung |
|---|---|
| `N list items — more than 6 is hard to read; …` | Folie teilen oder `fragments` nutzen. |
| `Paragraph has N characters — shorten it (≤ 320) or move details to notes` | Kürzen, Rest in `notes`. |
| `Heading is longer than 80 characters` | Kernaussage knapper formulieren. |
| `N lines of code — show ≤ 16 lines per slide` / `Longest code line has N characters …` | Code kürzen bzw. umbrechen. |
| `N table rows — more than 8 will be cramped` | Tabelle aufteilen oder Chart nutzen. |
| `N components on one slide — consider splitting it` | Folie teilen. |
| `Image has no alt text` | `alt` ergänzen. |
| `File not found: <bild>` (lokales Paket) | Bildpfad relativ zur YAML-Datei angeben; Bild muss im Ordner der Präsentation liegen. |
| `"slot" only has an effect on layout "split"` | `slot` entfernen oder `layout: split`. |
| `Split layout: give components slot: left or slot: right …` | Komponenten einer Spalte zuordnen. |
| `Donut charts only show the first dataset` | Nur eine Datenreihe oder anderen Chart-Typ. |
| `Morph transition, but no flip_id is shared with the previous slide — it will fall back to a fade` | Gleichen `flip_id` auf beiden Folien setzen oder anderen Übergang wählen. |
| `Text/background contrast is X:1 (WCAG needs ≥ 4.5:1)` / `Secondary text contrast …` | Farben im Theme anpassen oder eingebautes Theme nutzen. |
| `Custom theme colors, fonts and radius are a Pro feature — using the built-in "<x>" theme. …` | Im Free-Plan eigene Theme-Werte entfernen; das eingebaute Theme wird verwendet. |

## Lizenz (lokales Paket; gehostet hängt der Plan am angemeldeten Konto)

| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `No license key. Get Pro at …` | Free-Plan, kein Schlüssel | Normal. Pro nur auf Wunsch. |
| `That does not look like an Instaslides license key (isl_…).` | Falscher Text bei `activate` | Schlüssel vollständig aus https://instaslides.io/account kopieren (beginnt mit `isl_`). |
| `License key is unknown or was rotated. Copy the current key from …` | Schlüssel neu erzeugt oder falsch | Aktuellen Schlüssel kopieren und erneut `npx instaslides activate <key>`. |
| `No active Pro subscription. …` | Abo beendet oder nicht abgeschlossen | Abo im Konto auf instaslides.io prüfen – nicht selbst abschließen. |
| `Could not reach https://instaslides.io to check the license. Running as Free.` | Offline oder Lizenzserver nicht erreichbar | Später erneut; mit gültigem Token läuft Pro bis zu 7 Tage offline weiter. |
| `Offline — using cached license.` | Offline, Token noch gültig | Kein Handlungsbedarf. |
| `Received an invalid license token — update instaslides.` | Veraltete Paketversion | Neueste Version: `npx -y instaslides@latest`, Claude Code neu starten. |
| `… comes from the INSTASLIDES_LICENSE_KEY environment variable …` | Variable überschreibt `activate` | Variable in der MCP-Konfiguration anpassen oder entfernen. |
