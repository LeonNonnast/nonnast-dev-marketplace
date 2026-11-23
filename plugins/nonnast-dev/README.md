# nonnast-dev (alle Apps)

Sammel-Plugin: Eine Installation holt alle Plugins dieses Marketplace als Abhängigkeiten, jeweils mit MCP-Server und Skills.

| Plugin | App |
|---|---|
| [`culinari`](../culinari) | Culinari – Kochassistent mit KI-Koch-Familie |
| [`taskflow`](../taskflow) | TaskFlow – Aufgabenverwaltung |
| [`instaslides`](../instaslides) | Instaslides – animierte HTML-Präsentationen aus YAML |
| [`hippocampus`](../hippocampus) | Hippocampus – Langzeitgedächtnis für KI-Assistenten |
| [`design2production`](../design2production) | Design2Production – digitales Atelier für Schnittmuster |

## Installation (Claude Code)

```text
/plugin marketplace add LeonNonnast/nonnast-dev-marketplace
/plugin install nonnast-dev@nonnast-dev
```

Danach `/mcp` öffnen und bei jedem Server einmal „Authenticate“ wählen: `culinari`, `taskflow`, `instaslides`, `hippocampus`, `hippocampus-write` und `d2p`.

Wer nur einzelne Apps will, installiert die Plugins einzeln (siehe Haupt-README). Das Sammel-Plugin selbst enthält keine eigenen Skills oder Server.
