# Filter-Rezepte für `list_tasks` und `count_tasks`

Einfache Filter (alle UND-verknüpft):

| Frage | Parameter |
|---|---|
| Offene Aufgaben | `status: ["open", "in_progress"]` |
| Überfällig | `overdue: true` (offen/in Arbeit und Fälligkeit vor jetzt) |
| Fällig im Zeitraum | `due_after: "2026-11-16"`, `due_before: "2026-11-23"` (halboffen) |
| Ohne Fälligkeit | `has_due_date: false` |
| In Projekt | `project: ["<uuid>"]`; ohne Projekt: `project: ["none"]` |
| Unteraufgaben von X | `parent: ["<uuid>"]`; nur oberste Ebene: `parent: ["none"]` |
| Tags | `tags_any`, `tags_all`, `tags_none` (Groß-/Kleinschreibung egal) |
| Volltext | `text: "angebot"` |
| Aus Quelle | `external_system: ["mail"]`, `has_external_ref: true` |
| Kürzlich geändert | `updated_after: "2026-11-10T00:00:00Z"` |
| Papierkorb | `deleted: "only"` |
| Workspace | `workspace: ["<uuid>"]` |

Sortierung: `sort: [{field: "due", dir: "asc"}, {field: "priority", dir: "desc"}]` – Felder `due`, `priority`, `status`, `title`, `createdAt`, `updatedAt`; max. 5 Kriterien. Standard: Fälligkeit, dann Priorität, dann neueste zuerst.

Komplexe Bedingungen mit ODER/NICHT über `where`, ein Baum aus `and`, `or`, `not`. Blätter: `status`/`priority`/`workspace`/`project`/`parent` als `{in: [...]}`, `due` als `{after, before, isNull}`, `overdue`, `tags` als `{any, all, none}`, `text`, `external` als `{system, externalId, exists}`, `createdAt`/`updatedAt` als `{after, before}`. Beispiel „dringend ODER überfällig, aber nicht mit Tag warten“:

```json
{
  "where": {
    "and": [
      { "or": [ { "priority": { "in": ["urgent"] } }, { "overdue": true } ] },
      { "not": { "tags": { "any": ["warten"] } } }
    ]
  }
}
```

Datumsformat: ISO-Datum (`2026-11-01`) oder Datum mit Uhrzeit und Offset (`2026-11-01T09:00:00+01:00`). Reine Daten bedeuten Mitternacht UTC – für „heute“ in Deutschland lieber mit Offset arbeiten.
