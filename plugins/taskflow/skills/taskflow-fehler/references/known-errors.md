# Bekannte TaskFlow-Fehlermeldungen

## forbidden – Zugriff
| Meldung (Auszug) | Ursache | Lösung |
|---|---|---|
| `forbidden: <tool> is not available to this connection (needs <right> access). Call get_access …` | Tool gehört nicht zum erlaubten Zugriff (oft veraltete Tool-Liste) | `get_access`; ggf. neu verbinden mit mehr Rechten. |
| `forbidden: <tool> needs write access, but this connection was granted read-only scope (tasks:read). Reconnect and allow writing …` | Nur Lesezugriff erteilt | Neu verbinden und Schreiben erlauben. |
| `forbidden: <tool> needs <right> access to <project\|workspace> "<name>" (this connection: <granted>). …` | Objekt sichtbar, aber ohne Schreib-/Einstellungsrecht | Anderes Projekt wählen oder Rechte von Owner holen / neu verbinden. |
| `forbidden: <tool>: changing icon and color needs settings access to project "<name>" …` | Icon/Farbe ohne Einstellungs-Zugriff | Ohne Icon/Farbe ändern oder Einstellungs-Zugriff erteilen. |
| `forbidden: <tool> needs a project: this connection may write only to projects "<name>" (<id>), …. Pass project_id.` | Verbindung darf nur in bestimmte Projekte schreiben | `project_id` eines erlaubten Projekts übergeben. |
| `forbidden: Write access to a workspace required (this caller may write only in single projects)` | `create_project` mit Projekt-Zugriff | Workspace-Schreibzugriff erteilen lassen. |
| `forbidden: <uri> is not available to this connection.` | Ressource nicht freigegeben | `get_access`. |

## payment_required – Abo
| `payment_required: <tool> is not available: this TaskFlow account has no active subscription (status: X). Ask the user to subscribe at <url>.` | Kein aktives Abo | Die Person auf die genannte Seite verweisen; nicht selbst abschließen. |
|---|---|---|

## conflict – Konflikte
| Meldung | Ursache | Lösung |
|---|---|---|
| `conflict: Version mismatch: expected N, current is M` | Zwischenzeitlich geändert | `get_task`/`get_instructions` neu lesen, Änderung erneut anwenden, neue Version mitsenden. |
| `conflict: External reference is already linked to another task` | Quelle schon erfasst | Vorhandene Aufgabe suchen (`list_tasks(external_system=…)`) und zeigen. |
| `conflict: Idempotency key was already used for a different request` | Gleicher Schlüssel, anderer Inhalt | Neuen, eindeutigen `idempotency_key` verwenden. |
| `conflict: Task already has a parent. Pass replace_parent: true to move it.` | Aufgabe hat schon ein Elternteil | Mit `replace_parent: true` verschieben (nach Rückfrage). |
| `conflict: Parent would create a cycle` | Zyklus in der Hierarchie | Andere Elternaufgabe wählen. |
| `conflict: Instructions changed concurrently; reload before retrying` | Instruktionen parallel geändert | Neu lesen, zusammenführen, erneut speichern. |

## validation – Eingaben
| Meldung | Lösung |
|---|---|
| `validation: workspace_id is required: choose a writable workspace. Call list_workspaces.` | `list_workspaces`, `workspace_id` oder `project_id` mitgeben. |
| `Expected an ISO-8601 date (2026-11-01) or datetime with offset (2026-11-01T09:00:00Z)` | Datumsformat korrigieren. |
| `Unknown parent <id>` / `Unknown project <id>` | IDs aus `list_tasks` / `list_projects` nehmen, nie raten. |
| `Project belongs to another workspace` / `Cannot move tasks between workspaces` | Projekt im selben Workspace wählen; ggf. Aufgabe neu anlegen. |
| `Parent task is in the trash` / `Target task is in the trash` | Erst `restore_task`. |
| `A task cannot be linked to itself` / `A task cannot be its own parent` | Andere Ziel-Aufgabe. |
| `A task can have at most 500 non-hierarchical links` | Beziehungen aufräumen (`unlink_tasks`). |
| `limit must be between 1 and 100.` | `limit` anpassen (bei `list_tasks` bis 200). |
| `group_by supports project, status, priority, tags (at most 4); facets at most 12.` | Parameter reduzieren. |
| `Invalid cursor` | Ohne `cursor` neu beginnen. |

## not_found
`Task not found`, `Project not found`, `Workspace not found`, `Manual page not found`. Nicht sichtbare Objekte melden immer `not_found`, nie `forbidden` – also auch Rechte prüfen (`get_access`).

## HTTP / Anmeldung
| Meldung | Lösung |
|---|---|
| 401 `Authentication required` / `Invalid or expired token` | Neu anmelden (`/mcp` bzw. Connector „Connect“); Token in der Web-App unter „Zugriffe“ prüfen. |
| 403 `Origin not allowed for /mcp …` | Nur bei Browser-Clients mit fremdem Origin; Claude Code und claude.ai sind nicht betroffen. |
| `Redirect URI not allowed (https required, http only for localhost)` | Client-Konfiguration prüfen. |
