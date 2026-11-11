---
name: culinari-einkaufsliste
description: Erstellt aus dem Culinari-Mahlzeitenplan eine zusammengefasste Einkaufsliste, sortiert nach Supermarkt-Abteilungen. Verwenden bei "Einkaufsliste", "was muss ich einkaufen", "shopping list", "Zutaten für die Woche".
---

# Einkaufsliste

1. **Zeitraum** klären (Standard: die nächsten 7 Tage ab heute) und `culinari_get_meal_plan(start_date, end_date)` holen.
2. Für jedes geplante Rezept `culinari_recipe_get(recipe_id)` – Zutaten mit Menge und Einheit, Portionen.
3. **Mengen umrechnen** auf die Personenzahl (aus dem Gespräch oder `culinari_get_user_preferences`), gleiche Zutaten zusammenfassen (Einheiten angleichen: g/kg, ml/l, EL, TL, Stück).
4. **Vorrat weglassen** (Salz, Pfeffer, Öl, Mehl, Zucker), aber darunter als „Vorrat prüfen“ nennen. Die Person kann die Vorratsliste anpassen.
5. **Nach Abteilungen** sortieren: Obst & Gemüse · Brot & Backwaren · Kühlregal · Fleisch & Fisch · Trockenware & Konserven · Gewürze · Tiefkühl · Getränke · Drogerie. Jede Zeile mit „[ ]“ zum Abhaken.
6. Unter der Liste kurz nennen, für welche Rezepte und Tage sie gilt.

Ist kein Plan vorhanden: anbieten, erst einen Wochenplan zu machen (Skill `culinari-wochenplan`), oder die Liste aus einzelnen genannten Rezepten bauen.
