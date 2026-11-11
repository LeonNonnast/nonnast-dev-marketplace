---
name: culinari-naehrwerte
description: Berechnet Nährwerte (Kalorien, Eiweiß, Fett, Kohlenhydrate) für Rezepte und Zutatenlisten mit der Lebensmitteldatenbank BLS 4.0 über Culinari. Verwenden bei "wie viele Kalorien", "Nährwerte", "Makros", "wie viel Eiweiß", "nutrition", "kcal pro Portion".
---

# Nährwerte

## Für ein gespeichertes Rezept
1. `culinari_recipe_get(recipe_id)` – gespeicherte Rezepte enthalten bereits berechnete Nährwerte.
2. Bei Änderungen (andere Portionen, Zutat getauscht) die Zutaten unverändert an `culinari_calculate_nutrition(ingredients)` übergeben.

## Für eine freie Zutatenliste
1. Zutaten als Liste übergeben, je `{name, quantity_g}` oder `{name, amount, unit}`. Einheiten: g, kg, ml, l, EL, TL, Prise, Zehe, Stück.
2. **Rohgewichte** verwenden (ungekocht).
3. `culinari_calculate_nutrition(ingredients)`.
4. Zutaten unter „nicht gefunden“: mit `culinari_lookup_ingredient(name)` den passenden BLS-Eintrag suchen (deutsche oder englische Namen) und mit dem gefundenen Namen erneut rechnen. Zutaten unter „ohne Menge“: Menge in Gramm erfragen.

## Ausgabe
- Gesamt und pro Portion als kleine Tabelle (kcal, Eiweiß, Fett, Kohlenhydrate, ggf. Ballaststoffe).
- Darauf hinweisen, welche Zutaten nicht eingerechnet sind.
- Richtwerte, kein medizinischer Rat.
