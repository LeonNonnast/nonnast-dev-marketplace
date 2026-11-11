---
name: culinari-rezeptarchiv
description: Speichert Rezepte in Culinari – aus einem Link importieren, Familienrezepte aus der Erzählung erfassen, vorhandene Rezepte ändern oder löschen. Verwenden bei "speicher das Rezept", "Omas Rezept aufschreiben", Rezept-Links, "importier das", "ändere das Rezept", "save recipe".
---

# Rezeptarchiv

## Rezept aus einem Link
1. `culinari_recipe_import(url)`.
2. Kurz zusammenfassen, was gespeichert wurde (Titel, Portionen, Anzahl Zutaten/Schritte), und auf Warnungen eingehen (`duplicate_warning`, `quality_warning`).

## Erzähltes oder abgetipptes Rezept
1. Nachfragen, bis Zutaten mit Mengen und die Schritte klar sind. Ungenaue Angaben („eine Handvoll“) so übernehmen und als Hinweis im Schritt stehen lassen.
2. **Dublettencheck:** `culinari_search_recipes(chef_name, query=<Gerichtsname>)`.
3. Entwurf zeigen. Erst nach dem Ja:
   ```
   culinari_recipe_create(
     title, description, servings, prep_time, cook_time, difficulty, cuisine,
     ingredients=[{name, amount, unit}],
     steps=[{instruction, duration_minutes}],   # Dauer optional
     tags=["familienrezept", …])
   ```
4. Die Geschichte zum Rezept (von wem, Anlass) in die `description`. Nährwerte berechnet Culinari automatisch.

## Ändern oder löschen
- `culinari_recipe_list` bzw. Suche → `recipe_id` ermitteln, `culinari_recipe_get(recipe_id)` zeigen.
- Ändern: `culinari_recipe_update(recipe_id, …)` – nur die übergebenen Felder ändern sich.
- Löschen nur nach ausdrücklicher Bestätigung: `culinari_recipe_delete(recipe_id)`.

## Wenn Speichern abgelehnt wird
Culinari prüft Inhalte vor dem Speichern. Bei „sieht nicht wie ein echtes Koch-Rezept aus“ oder „bitte entferne Werbung, Links, persönliche Daten …“ den Text bereinigen; bei „konnte gerade nicht geprüft werden“ in ein paar Minuten erneut versuchen. Details: Skill `culinari-fehler`.
