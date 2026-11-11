# Bekannte Culinari-Fehlermeldungen

| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `Authentication required. Use OAuth 2.1 (HTTP), API key header (HTTP), or CULINARI_API_KEY env var (stdio).` | Nicht angemeldet | Claude Code: `/mcp` → `culinari` → anmelden. claude.ai: Connector „Connect“. |
| `Nicht authentifiziert` / `❌ Nicht authentifiziert. Bitte API-Key konfigurieren.` | Kein Benutzerkontext | Wie oben neu anmelden. |
| `Für '<name>' wurde kein passendes gespeichertes Rezept gefunden. …` | Kochsession mit nicht gespeichertem Rezept gestartet | Rezept erst mit `culinari_recipe_create` speichern, dann mit **exakt** dem gespeicherten Titel als `recipe_name` neu starten. |
| `Für eine Kochsession wird ein Rezept benötigt. …` | Weder `recipe_name` noch `recipe_url` übergeben | Eins von beiden angeben. |
| `Chef '<X>' ist nicht in deiner Kochfamilie.` | Koch nicht in der Familie | `culinari_get_my_family` prüfen, einen aktiven Koch nehmen oder (mit Zustimmung) `culinari_add_chef`. |
| `❌ Chef '<X>' nicht gefunden` | Name falsch geschrieben | `culinari_list_available_chefs` und exakten Namen verwenden. |
| `Dieser Chef ist derzeit nicht verfügbar.` | Koch gesperrt | Anderen Koch wählen. |
| `Session-Limit erreicht! Dein <TARIF>-Plan erlaubt maximal N aktive Sessions. …` | Zu viele aktive/pausierte Sessions | `culinari_list_my_sessions` → alte Sessions mit `culinari_end_cooking_session` beenden (nach Zustimmung). |
| `❌ Keine aktive Session gefunden. …` | Keine laufende Session | Mit `culinari_start_cooking_session` starten oder pausierte mit `culinari_session_resume` fortsetzen. |
| `⚠️ Du bist bereits beim ersten Schritt!` / `⚠️ Schritt N nicht gefunden` | Schritt-Navigation außerhalb des Rezepts | `culinari_session_show_recipe` für die Schrittzahl. |
| `{"error":"Rezept nicht gefunden"}` / `… oder gehört dir nicht.` | Falsche oder fremde `recipe_id` | ID aus `culinari_recipe_list` bzw. Suche nehmen, nie raten. |
| `{"error":"Ungültiges Datum. Erwartet wird das Format JJJJ-MM-TT."}` | Datumsformat | `2026-11-16` statt „16.11.“. |
| `{"error":"Ungueltige Zutaten"}` / `{"error":"Ungueltige Schritte"}` | Kaputtes JSON in `ingredients`/`steps` | Als echte Liste von Objekten übergeben: `{name, amount, unit}` bzw. `{instruction, duration_minutes}`. |
| `Dieses Rezept konnte nicht gespeichert werden: der Inhalt sieht nicht wie ein echtes Koch-Rezept aus.` | Inhaltsprüfung hat abgelehnt | Rezepttext auf Zutaten und Schritte reduzieren. |
| `…: bitte entferne Werbung, Links, persönliche Daten oder beleidigende Inhalte.` | Inhaltsprüfung hat abgelehnt | Text bereinigen und erneut speichern. |
| `Dieses Rezept konnte gerade nicht geprüft und daher nicht gespeichert werden. …` | Prüfdienst kurz nicht erreichbar | In ein paar Minuten erneut versuchen. |
| `Das konnte ich nicht speichern. Dieser Text sieht nicht wie normale Koch- oder Ernährungsvorlieben aus.` | Vorlieben-Text abgelehnt | Nur Koch-/Ernährungsangaben speichern. |
| `Deine Vorlieben konnten gerade nicht geprüft und daher nicht gespeichert werden.` | Prüfdienst kurz nicht erreichbar | Später erneut versuchen. |
| `❌ Berechtigung fehlt: Chef-Limit erreicht oder Plan-Einschränkung.` / `… Upgrade deine Lizenz …` | Familienplätze im Tarif voll | Einen Koch deaktivieren/entfernen oder Tarif in der Web-App ändern – nicht selbst ein Abo abschließen. |
| `❌ is_oma_variant ist Admins vorbehalten. …` | Feld bei eigenem Koch gesetzt | `is_oma_variant=false`. |
| `❌ Ungültiger Status-Filter: '<x>'. Erlaubt: active, paused, completed` | Falscher Filter | Einen der drei Werte nutzen. |
| `Keine Treffer für '<name>' in der BLS-Datenbank gefunden.` | Zutat unbekannt | Allgemeineren oder englischen Namen versuchen. |
