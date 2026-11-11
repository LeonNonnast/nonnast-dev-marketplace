---
name: culinari-wochenplan
description: Plant mit Culinari die Mahlzeiten einer Woche aus der eigenen Rezeptsammlung und trägt sie in den Mahlzeitenplan ein. Verwenden bei "plan die Woche", "Wochenplan", "Essensplan", "was essen wir nächste Woche", "meal plan".
---

# Wochenplan

1. **Zeitraum** klären (Standard: Montag bis Sonntag der kommenden Woche) und als `JJJJ-MM-TT` umrechnen. Welche Mahlzeiten? (Standard: nur Abendessen.)
2. **Bestand:** `culinari_get_meal_plan(start_date, end_date)` – beide Daten inklusive. Bereits geplante Tage nicht überschreiben.
3. **Regeln sammeln:** `culinari_get_user_preferences` (Ernährung, Allergien, Haushalt) plus Wünsche aus dem Gespräch (z. B. „freitags Pizza“, „unter der Woche schnell“).
4. **Rezepte finden:** `culinari_recipe_list` für den Überblick, gezielt mit `culinari_search_recipes(chef_name, query)` – `chef_name` ist ein aktiver Koch aus `culinari_get_my_family`, `query` sind Zutaten oder Gerichtsnamen, keine Adjektive. Die Suche durchsucht nur die **eigene** Sammlung.
5. **Vorschlag** als Tabelle zeigen: Tag | Mahlzeit | Gericht | Zeit. Kein Gericht zweimal pro Woche, Fleisch über die Woche verteilen.
6. Fehlt ein passendes Rezept: eigenes Gericht vorschlagen und anbieten, es zu speichern (Skill `culinari-rezeptarchiv`). Einplanen geht nur mit **gespeichertem** Rezept.
7. **Erst nach dem Ja** je Tag `culinari_plan_meal(recipe_id, plan_date, meal_type)` mit `meal_type` = `breakfast`, `lunch` oder `dinner`.
8. Zum Schluss anbieten: „Soll ich die Einkaufsliste machen?“ (Skill `culinari-einkaufsliste`).

Fehler `Ungültiges Datum. Erwartet wird das Format JJJJ-MM-TT.` → Datum umformatieren und erneut senden.
