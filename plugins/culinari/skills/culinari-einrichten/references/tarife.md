# Culinari-Tarife und Grenzen

| Tarif | Familienplätze | Aktive + pausierte Kochsessions | Sessionverlauf | Eigene Köche | Wissens-Ressourcen |
|---|---|---|---|---|---|
| Free | 1 (eine Oma) | 5 | 5 | – | – |
| Basic | 3 | 20 | 20 | – | – |
| Pro | 5 | 50 | 50 | 2 | ja |
| Premium | 5 | unbegrenzt | unbegrenzt | 3 (teilen/veröffentlichen möglich) | ja |

- Familienmitglieder aktivieren (`culinari_activate_family_member`) geht ab Basic.
- Eigene Köche (`culinari_create_chef`, `culinari_update_custom_chef`, `culinari_delete_chef`) und Wissens-Ressourcen (`culinari_create_resource` …) ab Pro.
- Köche sichtbar schalten oder in der Familie veröffentlichen (`culinari_toggle_chef_visibility`, `culinari_publish_chef_to_family`) ab Premium.
- Eine Oma muss immer in der Familie bleiben.
- Anmelde-Links: höchstens 3 pro Stunde und E-Mail-Adresse.

`culinari_help` markiert Funktionen, die der aktuelle Tarif nicht hat, mit „(ab Pro)“ usw. Preise und aktuelle Bedingungen nennt `culinari_get_subscription_tiers`.
