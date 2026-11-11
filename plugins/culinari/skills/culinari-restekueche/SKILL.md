---
name: culinari-restekueche
description: Findet mit Culinari Gerichte für Zutaten, die noch im Kühlschrank sind. Verwenden bei "was kann ich mit … kochen", "Reste verwerten", "Kühlschrank leer machen", "ich habe noch …", "leftovers".
---

# Resteküche

1. Klären, was da ist (mit grober Menge) und wie viel Zeit bleibt – nur fragen, was nicht schon gesagt wurde.
2. `culinari_get_my_family` → aktiven Koch als `chef_name` nehmen.
3. `culinari_search_recipes(chef_name, query=<Hauptzutat>, ingredients=<alle genannten Zutaten>)` in der eigenen Sammlung; bei Bedarf mit einer zweiten Hauptzutat wiederholen. `restrictions` aus den Vorlieben (z. B. „vegetarisch“) mitgeben.
4. Höchstens drei Vorschläge, zuerst die mit den wenigsten fehlenden Zutaten; fehlende Zutaten jeweils nennen.
5. Passt nichts: selbst ein Gericht aus den Zutaten vorschlagen (Vorlieben und Allergien beachten) und anbieten, es mit `culinari_recipe_create` zu speichern (Skill `culinari-rezeptarchiv`).
6. Auf Wunsch gleich loskochen: Skill `culinari-kochbegleitung`.
