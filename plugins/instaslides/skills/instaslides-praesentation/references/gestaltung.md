# Gestaltungsregeln für Instaslides

Die Grenzen unten prüft `validate` als Warnung; die genaue Syntax steht immer in `get_schema`.

## Inhalt

- Eine Idee pro Folie. Überschrift = Kernaussage („Umsatz +32 % seit März“ statt „Umsatz“), höchstens 80 Zeichen.
- Absätze höchstens 320 Zeichen – den Rest in `notes`.
- Listen höchstens 6 Punkte; mehr → Folie teilen oder mit `fragments` Schritt für Schritt einblenden.
- Tabellen höchstens 8 Zeilen; jede Zeile so viele Zellen wie `headers`.
- Code höchstens 16 Zeilen, Zeilen höchstens 72 Zeichen.
- Nicht zu viele Komponenten auf einer Folie – lieber zwei Folien.
- Bilder immer mit `alt`-Text; Dateien relativ zur YAML-Datei.

## Layouts

| Layout | Wofür |
|---|---|
| `cover` | Titelfolie |
| `section_header` | Kapitelanfang |
| `content` | Standard (Voreinstellung) |
| `split` | Zwei Spalten – jede Komponente mit `slot: left` oder `slot: right` |
| `grid` | Mehrere gleichwertige Elemente |
| `image_full` | Vollbild-Bild, braucht `background.image` |
| `blank` | Freie Fläche |

## Bewegung

- Übergänge: `fade`, `slide`, `zoom`, `morph`, `none`.
- `morph` wirkt nur, wenn die Folie mindestens einen `flip_id` mit der vorherigen teilt – sonst wird es ein Fade. `flip_id` pro Folie eindeutig.
- `fragments` zeigen Elemente nacheinander; `targets` müssen auf `id`s derselben Folie zeigen.
- Sparsam einsetzen: Bewegung soll Zusammenhänge zeigen, nicht dekorieren.

## Themes

- Eingebaut: `midnight` (dunkel, Voreinstellung), `paper` (hell, ruhig), `corporate` (geschäftlich), `vivid` (kräftig).
- Eigene Farben, Schriften und Radius nur mit Pro. Kontrast Text/Hintergrund mindestens 4,5 : 1, Nebentext mindestens 3 : 1.
- Formate: `16:9` (Standard), `4:3`, `1:1`, `9:16` (Hochformat, z. B. für Social Media).

## Typische Folgen

- **Pitch:** Problem → Lösung → Demo/Screenshot → Markt (Metriken) → Geschäftsmodell → Traktion (Chart) → Team → Ask.
- **Bericht:** Kernaussage → Kennzahlen → Entwicklung (Chart) → Ursachen → Nächste Schritte.
- **Tech-Talk:** Problem → Idee → Architektur → Code (kurz) → Ergebnisse → Lessons learned.
- **Unterricht:** Lernziel → Einstieg/Frage → Erklärung in Schritten (Fragments) → Beispiel → Zusammenfassung.
