# Protocols read for this mod

Since 2026-10-09 the version of what was read is `protocols_read_sha` in `STATUS.md`, written by
`scripts/Mark-ProtocolsRead.ps1` (run from the rimworld root). This file keeps only the documents
judged of no use here, each with the trigger that would make them useful, so they are not re-read
when they change.

Last full pass: 2026-10-10 (AUDIT.md, AGENTS.md, PICKLE.md, PUBLISHING.md, TRANSLATIONS.md,
MOD_SETTINGS.md, STYLE_RIMWORLD.md, scripts/SEARCHING.md, the Ticket Manager WELCOME.md).

| document | useful here? | trigger |
|---|---|---|
| `scripts/SEARCHING.md` | no: nothing to search in the Workshop corpus | a script that walks the Workshop |
| `WORKSHOP_COMMENTS.md` | not yet | drafting thank-you comments (`writeDocs`, 11.h) |
| `STYLE_RIMWORLD.md` | little: only the ModIcon and Preview checks | `mountPreview`, or a changed ModIcon source |
| `MOD_SETTINGS.md` | once, to justify `settings_audit: not_applicable` | an option, a settings page or a shortcut appears |
| `PUBLISHING-CI.md`, `Rimworld-Release-Admin/docs/OPERATIONS.md` | not yet | `publish` |
| `GALLERY.md`, `ANIMALS.md`, `TOOLING-PITFALLS.md` | no: no gallery work yet, no animal added | `shootGallery`; never for animals; several sessions committing in one repository |

## Not applicable to this mod

Four XML patch files, no C#, no settings, no owned player-facing text. The sound-capture rules, the
Prepatcher/Concord notes, the language-switch rules and the publication-screenshot rules have no
target here. The Pickle suite exists for what no offline check can say: whether a tint reads as fur
(scenario 2 of `Tests/FUNCTIONAL-SCENARIOS.md`).
