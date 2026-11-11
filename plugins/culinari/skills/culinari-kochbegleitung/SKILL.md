---
name: culinari-kochbegleitung
description: Begleitet Schritt für Schritt beim Kochen mit einem Culinari-Koch in einer Kochsession – Rezept zeigen, nächster Schritt, Fragen an den Koch, Pause, Bewertung. Verwenden bei "lass uns kochen", "koch mit mir", "nächster Schritt", "weiter", "ich koche jetzt …", "Session fortsetzen".
---

# Kochbegleitung

## Starten
1. Rezept klären. Es muss **gespeichert** sein – sonst erst speichern (Skill `culinari-rezeptarchiv`) oder `recipe_url` nutzen, dann importiert Culinari es selbst.
2. Offene Session? `culinari_list_my_sessions(status_filter="paused")` – ggf. anbieten, sie mit `culinari_session_resume` fortzusetzen.
3. `culinari_start_cooking_session(chef_name, recipe_name=<exakter gespeicherter Titel>, servings)`.
4. `culinari_session_show_recipe` und die Zutaten bereitlegen lassen.

## Kochen
- Immer nur **einen** Schritt: `culinari_session_next_step`. Bei erfahrenen Köchen auf Wunsch `express=true`.
- Zurück: `culinari_session_previous_step`; springen: `culinari_session_goto_step(step_number)`.
- Fragen beim Kochen („Kann ich statt Sahne Milch nehmen?“): `culinari_session_ask_question(question)` – der Koch antwortet.
- Geräte nennen, wenn bekannt (z. B. Thermomix: Stufe, Zeit, Temperatur je Schritt).
- Pause: `culinari_session_pause`, weiter mit `culinari_session_resume`.

## Abschluss
1. Nach einer Bewertung 1–5 und einem kurzen Kommentar fragen.
2. `culinari_end_cooking_session(session_id, rating, comment)`.
3. Wurde das Rezept beim Kochen angepasst: anbieten, die Variante mit `culinari_save_session_recipe(session_id)` zu speichern.

Hinweis: Die Zahl gleichzeitig aktiver und pausierter Sessions ist je Tarif begrenzt („Session-Limit erreicht!“) – dann alte Sessions mit `culinari_end_cooking_session` beenden.
