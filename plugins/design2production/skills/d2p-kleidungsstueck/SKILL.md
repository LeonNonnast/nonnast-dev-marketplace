---
name: d2p-kleidungsstueck
description: Begleitet mit Design2Production ein Kleidungsstück von der Vorlage bis zum gedruckten Schnittmuster – Vorlage suchen, nach Konfektionsgröße starten, Länge und Weite mit Reglern anpassen, auf A4 oder A3 drucken, Stand abfragen. Verwenden bei "ich möchte einen Rock nähen", "Schnittmuster in Größe 38", "mach den Rock länger", "druck mir den Schnitt", "was ist der Stand bei meinem Kleid".
---

# Ein Kleidungsstück mit Design2Production

Die genauen Regeln stehen in den Hinweisen des Servers und den Tool-Beschreibungen – sie haben Vorrang vor dieser Skill. Werkzeugnamen und IDs exakt aus den Antworten übernehmen, nie ausdenken. Nichts anlegen, ändern oder drucken ohne ein Ja der Person zu genau diesem Schritt.

## Ablauf

1. **Wunsch klären** (eine Frage auf einmal): Was soll es werden, für wen (Damen, Herren, Kind), welche Größe?
2. **Vorlage suchen:** `d2p.atelier.search_templates` mit Kleidungsart und Zielgruppe. Zwei, drei passende Vorlagen in Alltagssprache vorstellen.
3. **Größe:** Mit `d2p.atelier.size_options` die Größen der Vorlage zeigen. Kennt die Person ihre Größe nicht, schlägt `d2p.atelier.nearest_size` die nächstliegende vor.
4. **Starten:** `d2p.atelier.start` mit Vorlage, Version und `sizeKey`. Einen eigenen `idempotencyKey` vergeben und bei Wiederholung genau gleich lassen. Ohne `projectId` braucht es die Erlaubnis „Neue Kleidungsstücke anlegen“ (siehe `d2p-einrichten`).
5. **Anpassen (optional):** `d2p.atelier.adjust` – Länge, Weite usw. in Zentimetern, nur innerhalb des Bereichs, den der Server nennt. Erst die Vorschau zeigen, dann nach Ja speichern.
6. **Drucken:** `d2p.atelier.print` mit Papier (A4 oder A3). Ergebnis: Link zum PDF und Anzahl der Blätter. Hinweis geben: mit 100 % (tatsächliche Größe) drucken, nicht „an Seite anpassen“, und vor dem Zuschneiden das 100-mm-Kontrollquadrat messen.
7. **Stand:** `d2p.atelier.status` bzw. `d2p.atelier.list_projects` sagen, welcher Schritt als Nächstes dran ist.

## Körpermaße (wichtig)

- Maße nie im Chat abfragen. Nennt die Person sie trotzdem, zuerst sagen, dass der Anbieter dieses Assistenten den Chat erhält; besser trägt sie sie in der App ein.
- Der Server gibt Maße nie heraus. Bei Kleidungsstücken mit eigenen Maßen endet Vorschau oder Druck mit `PRINT-IN-APP` bzw. `BODY-VALUES-IN-APP` und einem Link in `details.openInApp` – diesen Link weitergeben: Gedruckt wird dann in der App.

## Eigene Vorlagen

Eigene Schnitte vom leeren Blatt entwirft die Person in der App unter „Eigene Vorlagen“. Für fertige Entwürfe helfen `d2p.workshop.list_drafts`, `d2p.workshop.check_adjustments` und `d2p.workshop.preview_template`.

Fehlercodes: Skill `d2p-fehler`.
