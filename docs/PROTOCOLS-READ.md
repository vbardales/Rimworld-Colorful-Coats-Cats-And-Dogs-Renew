# Protocols read for this mod

Which shared documents were read, at which version, and whether they were of use here, so a later
session re-reads only what moved. Version = size in bytes and last-write time on disk (the monorepo
git is too slow to ask). Update the row when a document is re-read, changed or not.

Last full pass: 2026-10-02.

| document | read | version (bytes, mtime) | useful here? |
|---|---|---|---|
| `../AGENTS.md` | 2026-10-02 | 2 716, 2026-09-29 09:11 | yes: evidence rule, CI publishing guard rails, 0.1.0 |
| `../AUDIT.md` | 2026-10-02, whole | 68 687, 2026-09-29 00:55 | yes: chain, `tested` criteria, `done -> showcase/preTest`, 0.1.0 CHANGELOG format, session title |
| `../PUBLISHING.md` | 2026-10-02 | 63 817, 2026-10-01 20:05 | yes: description order, `PUBLICATION.md` contents, gallery, CI |
| `../STYLE_RIMWORLD.md` | 2026-10-02 | 50 745, 2026-10-01 22:28 | little: only the ModIcon/Preview control criteria, already settled |
| `../MOD_SETTINGS.md` | 2026-10-02 | 7 166, 2026-09-13 | yes, to justify `not_applicable` once; unchanged |
| `../TRANSLATIONS.md` | 2026-10-02 | 13 802, 2026-09-30 16:43 | yes, to justify `not_applicable`; moved since 2026-09-13, plurals rule has no target here |
| `../WORKSHOP_COMMENTS.md` | 2026-10-02 | 28 446, 2026-09-29 09:29 | not yet: only at `tested -> prepublished`, for the thank-you comments |
| `../scripts/SEARCHING.md` | 2026-10-02 | 12 230, 2026-09-27 | no: Workshop-search rules, nothing to search here; do not re-read unless a script walks the Workshop |
| `../PickleTools/README.md` | 2026-10-02 | 9 028, 2026-10-01 17:41 | little: table of shared tools, none needed (local `CoatSteps` covers the one gap) |
| `../PickleTools/Headless/README.md` | 2026-10-02 | 39 421, 2026-09-26 22:52 | yes before any new request: passes, `@wip`, `@requires`, maps (final newline), evidence |
| `../PickleTools/docs/steps.md` | 2026-10-02 | 33 092, 2026-10-01 17:41 | partly: no shared step spawns an animal or reads a coat |
| `../PickleTools/Authoring/README.md` | 2026-09-28 | header reviewed 2026-09-22 | yes, the model for `Tests/Pickle/` |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | 2026-10-02 | 15 568, 2026-09-26 23:20 | not yet: only at the real `publish` dispatch |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 2026-10-02 | 12 663, 2026-09-27 23:25 | yes before any request: `-Filter`, `-DepMap`, no SHA in a request, tree frozen until `RUN_DONE` |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | 2026-10-02 | 13 983, 2026-09-26 18:18 | yes before any request: options, exit codes (7 nothing played, 2 busy) |
| `../DalmatiansRenew/Tests/Pickle/` | 2026-09-28 | working tree | yes, the model suite |

Own files read this session: `STATUS.md`, `README.md`, `CHANGELOG.md`, `ATTRIBUTION.md`, `LICENSE`,
`TESTING.md`, `docs/runs/`, `Tests/Pickle/`, `Mod/About/About.xml`. Do not exist in this repository, and
none is needed yet: `PUBLICATION.md` (due at `tested -> prepublished`), `BACKLOG.md`, `NOTES.md`, `BUGS.md`.

## Not applicable to this mod

Four XML patch files, no C#, no settings, no owned player-facing text. The sound-capture rules, the
Prepatcher/Concord notes, the language-switch rules and the publication-screenshot rules have no
target here. The suite exists for what no offline check can say: whether a tint reads as fur
(scenario 2 of `_tools/FUNCTIONAL-SCENARIOS.md`).
