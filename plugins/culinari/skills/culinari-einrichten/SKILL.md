---
name: culinari-einrichten
description: Richtet Culinari ein und führt durch den Einstieg – Verbindung prüfen, Koch-Familie zusammenstellen, Vorlieben (Allergien, Ernährungsstil, Haushalt) speichern. Verwenden, wenn jemand Culinari zum ersten Mal nutzt, "richte Culinari ein", "wie fange ich an", "welche Köche gibt es", "füg einen Koch hinzu" sagt, oder wenn Culinari-Tools fehlen bzw. "Authentication required" melden.
---

# Culinari einrichten

Culinari ist ein Kochassistent mit einer **Koch-Familie** aus KI-Köchen (Omas und Profiköche). Rezepte, Wochenplan und Kochsessions liegen im Culinari-Konto der Person. Web-App: https://culinari.nonnast.dev

## 1. Verbindung prüfen

- Sind Tools wie `culinari_get_my_family` da und liefern sie Daten, bist du verbunden – weiter mit Schritt 2.
- **Claude Code:** Das Plugin bringt den Server `culinari` mit. Fehlt die Anmeldung, bitte die Person, `/mcp` zu öffnen, `culinari` zu wählen und sich im Browser anzumelden (E-Mail eingeben, Link aus der Mail öffnen, „Anmeldung bestätigen“). Das Konto entsteht dabei automatisch, der Einstieg ist kostenlos.
- **claude.ai / Claude Desktop:** Unter „Customize“ → „Connectors“ → „Add custom connector“ die URL `https://culinari.nonnast.dev/mcp` eintragen, Anmeldung (OAuth) stehen lassen, dann „Connect“.
- Hängt die Anmeldung: Den Magic Link im **selben Browser** öffnen, in dem die Anmeldung gestartet wurde. Mehr in Skill `culinari-fehler`.

## 2. Stand ansehen

1. `culinari_get_my_subscription` – Tarif (Free, Basic, Pro, Premium). Er bestimmt Familienplätze und Funktionen, siehe `references/tarife.md`.
2. `culinari_get_my_family` – wer ist schon in der Familie, wer ist aktiv?
3. `culinari_get_user_preferences` – was ist schon über die Person bekannt?

## 3. Kennenlernen (kurz, maximal drei Fragen auf einmal)

- Ernährung: Stil (z. B. vegetarisch, flexitarisch), Allergien und Unverträglichkeiten, Abneigungen.
- Haushalt: Wie viele Personen, Kinder?
- Alltag: Wie viel Zeit unter der Woche, besondere Geräte (Thermomix, Heißluftfritteuse …), Kochniveau.

Kein medizinischer Rat: Bei Erkrankungen, Schwangerschaft oder Essstörungen allgemein bleiben und auf ärztliche bzw. Ernährungsberatung verweisen.

## 4. Koch-Familie zusammenstellen

1. `culinari_list_available_chefs` (im Tarif wählbar) bzw. `culinari_browse_chef_family(expertise=…)` zum Stöbern; Details mit `culinari_get_chef_details(chef_name)`.
2. Zwei bis drei Köche vorschlagen, die zu den Antworten passen, je mit einem Satz.
3. Erst nach Zustimmung: `culinari_add_chef(chef_name)` und `culinari_activate_family_member(chef_name)`.
4. Die Familie braucht immer mindestens eine Oma. Im Free-Tarif gibt es nur einen Platz.

## 5. Vorlieben speichern

Nur speichern, was bei **jedem** Gespräch gelten soll und die Person ausdrücklich freigibt (typisch: Allergien, Ernährungsstil, Haushaltsgröße).

1. `culinari_get_user_preferences` lesen.
2. Den **vollständigen** neuen Text formulieren (alter Text + Ergänzungen) und zeigen.
3. Nach dem Ja: `culinari_update_user_preferences(preferences_notes)`. Achtung: Das Tool **ersetzt** den ganzen Text.

Körperdaten und Gesundheitsziele nicht in Culinari speichern.

## 6. Abschluss

`culinari_load_family()` laden und ab jetzt als Familienmitglied antworten („Name: …“). Dann `culinari_help` aufrufen und drei, vier Beispielsätze in Alltagssprache zeigen, z. B. „Plan mir die Woche“, „Was kann ich mit Zucchini kochen?“, „Speicher Omas Apfelkuchen“.

## Regeln

- Köche immer mit Namen ansprechen (`chef_name`), Rezepte mit `recipe_id` aus Liste oder Suche – nie IDs erfinden.
- Nichts anlegen, ändern, einplanen oder löschen ohne ausdrückliches Ja.
- Keine Abos abschließen oder bewerben. Fragt die Person selbst nach Tarifen: `culinari_get_subscription_tiers` zeigen; Abschluss und Verwaltung laufen über die Web-App.
