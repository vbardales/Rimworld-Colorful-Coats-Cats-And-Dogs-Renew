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
| `../scripts/SEARCHING.md` | not yet read | — | pending — not needed so far; this mod's checks use its own `_tools/` scripts |
| `PickleTools/README.md` | not yet read | — | pending — needed before authoring any Pickle suite for this mod |
| `PickleTools/Headless/README.md` | not yet read | — | pending — needed before submitting a Pickle run ticket |
| `PickleTools/docs/steps.md` | not yet read | — | pending — needed before writing a step in a Pickle suite |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | not yet read | — | pending — needed only at the actual `publish` dispatch, not before |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | not yet read | — | pending — needed at first Pickle-run submission (`REGISTER`) |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | not yet read | — | pending — needed at first Pickle-run submission |

## Not yet applicable to this mod

This mod is four XML patch files with no C#, no settings, no owned player-facing text, and (as of
2026-09-28) no Pickle suite. So the following sections of `AGENTS.md`/`AUDIT.md` have no target
here and were skipped rather than read closely: the Pickle lock/queue mechanics, the WSL staging
script, sound-capture rules, and the headless launcher. They become relevant the day a Pickle
suite is written for this mod — most plausibly for scenario 2 of
`_tools/FUNCTIONAL-SCENARIOS.md` (the dyed-coat visual check), which is the one thing here that
genuinely needs a running game rather than the patch-engine harness in `_tools/Run-Functional-Tests.ps1`.
