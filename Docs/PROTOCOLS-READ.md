# Protocols read for this mod

Since 2026-10-09, version of what was read = `protocols_read_sha` in `STATUS.md`, written by
`scripts/Mark-ProtocolsRead.ps1` (run from rimworld root). File keeps only docs judged useless here, each with trigger that would make them useful, so not re-read when they change.

Last full pass: 2026-10-10 (AUDIT.md, AGENTS.md, PICKLE.md, PUBLISHING.md, TRANSLATIONS.md,
MOD_SETTINGS.md, STYLE_RIMWORLD.md, scripts/SEARCHING.md, Ticket Manager WELCOME.md).

| document | useful here? | trigger |
|---|---|---|
| `scripts/SEARCHING.md` | no: nothing to search in Workshop corpus | script walking Workshop |
| `WORKSHOP_COMMENTS.md` | not yet | drafting thank-you comments (`writeDocs`, 11.h) |
| `STYLE_RIMWORLD.md` | little: only ModIcon + Preview checks | `mountPreview`, or changed ModIcon source |
| `MOD_SETTINGS.md` | once, to justify `settings_audit: not_applicable` | option, settings page or shortcut appears |
| `PUBLISHING-CI.md`, `Rimworld-Release-Admin/docs/OPERATIONS.md` | not yet | `publish` |
| `GALLERY.md`, `ANIMALS.md`, `TOOLING-PITFALLS.md` | no: no gallery work yet, no animal added | `shootGallery`; never for animals; several sessions committing in one repo |

## Not applicable to this mod

Four XML patch files, no C#, no settings, no owned player-facing text. Sound-capture rules,
Prepatcher/Concord notes, language-switch rules, publication-screenshot rules: no target here. Pickle suite exists for what no offline check can say: whether tint reads as fur
(scenario 2 of `Tests/FUNCTIONAL-SCENARIOS.md`).