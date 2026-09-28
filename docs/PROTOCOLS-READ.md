# Protocols read for this mod

Tracks which shared protocol documents were read for an audit or a work session on this mod, at
which revision, so a later pass does not have to re-read a document that did not move — and does
re-read one that did. Update the row when a document is re-read, whether or not it changed.

| document | last read | revision/date read | useful here? |
|---|---|---|---|
| `../AGENTS.md` | 2026-09-28 | working tree, 2026-09-28 | yes — session title format, evidence policy, publishing-by-CI gates |
| `../AUDIT.md` | 2026-09-28 | working tree, 2026-09-28 | yes — the ordered workflow chain, the whole `stage` vocabulary |
| `../PUBLISHING.md` | 2026-09-13 | as of prior audit | yes — description BBCode order, `PUBLICATION.md` contents |
| `../STYLE_RIMWORLD.md` | 2026-09-13 | as of prior audit | yes — ModIcon control criteria, Preview contrast/camera checks |
| `../MOD_SETTINGS.md` | 2026-09-13 | as of prior audit | not applicable — mod has no settings, confirmed and recorded in STATUS.md |
| `../TRANSLATIONS.md` | 2026-09-13 | as of prior audit | not applicable — mod has no owned player-facing text |
| `../WORKSHOP_COMMENTS.md` | not yet read | — | pending — needed only at `tested -> prepublished`, for the thank-you comments |
| `../scripts/SEARCHING.md` | 2026-09-28 | working tree; first 60 lines (of 12 230 bytes) | yes for one rule - never walk an unbounded root; `Search-Workshop.sh` for the Workshop. It made this mod drop a whole-Workshop walk from two of its own scripts. The rest (assembly searches, ledger mode) has no target here |
| `../PickleTools/Authoring/README.md` | 2026-09-28 | working tree (its own header: reviewed 2026-09-22) | yes, read in full - suite layout, pass matrix, waits, evidence; the model for `Tests/Pickle/` |
| `../PickleTools/TESTING.md` | 2026-09-28 | working tree; only "What to keep after a test" read | yes - the keep/delete table copied into `Tests/Pickle/README.md` |
| `../PickleTools/docs/steps.md` | 2026-09-28 | working tree; grepped for spawn, animal, camera, screenshot, patched, not read whole | partly - no shared step spawns an animal or reads a coat, hence the local `CoatSteps.cs` |
| `../PickleTools/README.md` | not yet read | - | pending - only its table of shared tools would matter here |
| `../PickleTools/Headless/README.md` | not yet read | - | pending - needed before the first ticket is actually filed |
| `../DalmatiansRenew/Tests/Pickle/` | 2026-09-28 | working tree | yes - the model suite: `Scene`, coat steps, camera framing, pass maps, README layout |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | not yet read | — | pending — needed only at the actual `publish` dispatch, not before |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 2026-09-28 | working tree (not a git-tracked doc; 12 663 bytes) | yes, read in full - `-Filter` terms, `-DepMap` and the load order (the mod under test loads LAST, loadAfter is not what orders a staging), one request per pass, no SHA in a request, keep the tree frozen until RUN_DONE, do not watch the queue |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | 2026-09-28 | working tree (13 983 bytes) | yes, read in full - every option, the exit codes (7 = nothing played, 2 = machine busy), `-RunTimeoutMinutes` (a filter naming a file is a targeted run: 20 min unless given) |

## Not yet applicable to this mod

This mod is four XML patch files with no C#, no settings, and no owned player-facing text. A Pickle suite
was written on 2026-09-28 but not yet played, so the following sections of `AGENTS.md`/`AUDIT.md` have no target
here and were skipped rather than read closely: the Pickle lock/queue mechanics, the WSL staging
script, sound-capture rules, and the headless launcher. They become relevant the day the first
request is actually filed, which is when `Headless/README.md` and the two Ticket-Dispatcher docs
must be read. The suite exists mainly for scenario 2 of `_tools/FUNCTIONAL-SCENARIOS.md` (does a
tint read as fur), the one thing here that needs a running game rather than the patch-engine
harness in `_tools/Run-Functional-Tests.ps1`.
