# Colorful Coats - Cats and Dogs! Renew: Pickle suite

Development only. Nothing under `Tests/` is part of the Workshop payload: Steam publishes `Mod/`
and nothing else. **Written, built and not yet played.** No run has been submitted, so no scenario
here has a result, and none is claimed. The step assembly compiles, and `Tests/Pickle/Check-Steps.ps1` (run it after every edit of a feature or a
step) checks the features against Pickle's real steps: every step is defined exactly once and every map entry
resolves. That proves the phrases exist, not that a step
does what its sentence says; only a run does.

## Scope

The offline suites own everything provable without a game, and this mod is unusually well served
by them: `_tools/Run-Functional-Tests.ps1` runs **RimWorld's own patch engine** on the real defs of
the real target mods (41 breeds, 22 tests, 17 seen red under mutation), `_tools/Check-Coats.ps1`
and `_tools/Check-PatchFields.ps1` check the defNames and every injected field, and the shared
`Check-XmlClasses`, `Check-DefRefs` and `Check-TypeRefs` cover the rest. A scenario that only repeats
one of those was not written.

Pickle is limited to what needs a running game:

- **what the game kept** after loading a whole mod list through the real loader - inheritance,
  ordering, every other mod's patches - which the offline harness, working on isolated documents,
  cannot see;
- **that the game really parsed the colours** on the 0-255 scale (the offline suite mirrors that rule
  because `ParseHelper.ParseColor` cannot be called under Windows PowerShell 5.1);
- **the one fault the whole design exists to prevent**, two coat lists on one animal, which the game
  reports itself as `defines the same field twice: alternateGraphics`;
- **a coat drawn**, and surviving a save and reload;
- **the pictures a person reads**, which are the reason this suite exists at all: scenario 2 of
  `_tools/FUNCTIONAL-SCENARIOS.md`, whether a tint reads as fur or as dirt, is the one thing nothing
  here can decide by assertion.

## Passes

Three passes plus three single-target passes (2bis) and one two-launch removal chain (added 2026-10-02). No French launch: the mod owns no player-facing text
(`localization: not_applicable` in `STATUS.md`), so a French pass would only re-check the game's own
strings. That is a decision, not an oversight, and the owner confirmed it on 2026-09-28; reopen it if the mod ever gains text.

| Pass | Map | Feature | What it establishes |
| --- | --- | --- | --- |
| 1. Without optional mods | `wsl-deps.sans-facultatifs.map` | `01` | The four base-game pets alone; the 37 operations aimed at absent mods left no trace |
| 2. The three target mods | `wsl-deps.avec-cibles.map` | `02` | Stray Dogs, Let's Have a Cat! and Vanilla Animals Expanded together; no double coat list; the animals that already had coats were left alone |
| 3. The mods that paint | `wsl-deps.avec-peintres.map` | `03` | Animal Variety Coats, Erin's Cat Overhaul and the sibling port own their animals; this mod wrote nothing on them |
| 2bis-a. Stray Dogs alone | `wsl-deps.stray-dogs.map` | `02a` | A red can only be Stray Dogs or this mod; poodle puppies get coats and keep them on growing up |
| 2bis-b. Let's Have a Cat! alone | `wsl-deps.lets-have-a-cat.map` | `02b` | Same for the cats; kittens |
| 2bis-c. Vanilla Animals Expanded alone | `wsl-deps.vae.map` | `02c` | Same, with its framework, without the sibling port; beagle puppies |
| 3. Removal chain | `wsl-deps.retrait.map` | `31` then `retrait-check` | Two launches, one lock: `-Filter 31-retrait-write -Then retrait-check -ThenWithout nelim.colorfulcoats.catsanddogs,nelim.colorfulcoats.catsanddogs.pickletests`. A game saved with the mod loads and runs without it, and the save holds nothing of the mod |
| 2ter. Review captures, every other breed | `wsl-deps.avec-cibles.map` | `08` | 34 `@review` captures (scenario 2): 17 Stray Dogs, 10 cats, 7 VAE breeds. Each opened and described in `docs/runs/` |
| Add to a running colony | `wsl-deps.stray-dogs.map` | `32` | Needs the save `colorfulcoats-without-mod` (written by the removal chain) copied to `Tests/Pickle/Mod/Pickle/Fixtures/` first |
| Gallery | `wsl-deps.galerie.map` | `07` | Three Workshop shots on the studio colony |

**No declared-incompatibility pass:** `About.xml` declares no `incompatibleWith`, so there is no
claim to go and look at. The three painters are `loadAfter` entries, covered by pass 3.

**No restart sequence:** a coat is stored nowhere (`PawnGraphicUtils.TryGetAlternate` rolls it from the
animal's id every time it is asked), so the in-process save-and-reload scenario is the whole of it.

**No DLC-absent pass:** the mod references no DLC and its `LoadFolders` is the default.

Passes 2 and 3 are not merged into one on purpose. Stray Dogs and the painters could all be loaded
together, but a red in a merged pass could not say whether a target or a painter caused it, and the
painters (Erin's Cat Overhaul above all) have their own quirks that are not this mod's.

## Running it

From the collection root, once `scripts/Pickle-Status.ps1` says the machine is free. **A session
never launches the game**: it files a request, and the dispatcher's worker plays it.

```powershell
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.sans-facultatifs.map -Filter '01-sans-facultatifs' -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 1, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass1
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.avec-cibles.map     -Filter '02-cibles'            -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 2, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass2
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.avec-peintres.map   -Filter '03-peintres'          -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 3, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass3
```

A request carries no SHA: the mod is staged when its ticket is played, from the working tree of that
moment. Keep the tree of `Mod/` untouched from the filing to the `RUN_DONE`, and put the SHA in the
label so it can be found in the report.

Before filing: check that each map exists (the staging script silently ignores a missing one), and
that the target mods are present in the WSL copy. The Workshop ids in the maps are the ones this
audit found installed on Windows; they have not been checked against what the WSL staging resolves.

## Reading a result

Read `exitReason` before the counts. Compare the scenarios played with the scenarios discovered:
pass 1 has 10, pass 2 has 18, pass 3 has 10 (each row of a Scenario Outline counts as one). A `@review`
scenario asserts nothing about the picture: its green says the route ran, not that the tints are
right. **Open every capture and look**, and write down what was seen.

Two reds that are not necessarily this mod's:

- pass 3, `no animal received two coat lists`: Erin's Cat Overhaul appends its list to the vanilla cat
  without checking what is there, so it can conflict with Animal Variety Coats on its own. Read the
  log line: if it names an animal this mod also patches, it is ours.
- any pass, `no errors were logged`: covers everything logged during the scenario, other mods'
  included. A red is a lead, not a verdict, until the line is read.

## Evidence to keep

What to keep after a run, and what to delete, following `AGENTS.md` ("Test evidence") and
`PickleTools/TESTING.md`. `Tests/Pickle/Evidence/` is **gitignored**: it holds proof on disk, not in
git, and the disk is full.

| Keep, per pass | Why |
|---|---|
| `summary.json`, `summary.md` | The verdict. `exitReason` first |
| `junit.xml` | Per-step outcome and failure messages |
| `evidence-complete.txt` or `no-report.txt` | Says the copy is whole, or that no report exists |
| **The `@review` captures a person actually opened**, minified to JPEG | The only evidence that tints read as fur: 3 in pass 2 (poodles, newfoundlands, persians), 1 in pass 1 (huskies) |
| One line in `docs/runs/` per run | The history, as text, never as folders |

Delete once the run is read: `Player.log` and `messages.ndjson` (the log check goes into the one
`docs/runs/` line: what was grepped for, what was found), any `screenshots/` folder copied whole, `report.html` once the verdict is written, a report
of a failed or infrastructure attempt once its cause is in `STATUS.md`, and any report for a
superseded revision once the pass has been repeated on the current one. **Exception, worth stating
here because it is this mod's only visual evidence:** the `@review` captures of pass 2 are the sole
proof of scenario 2, and are kept until a later run replaces them for the same revision.

Never delete a report a `STATUS.md` field still points to: repoint it first.

## Build

```powershell
dotnet build Tests/Pickle/Source/ColorfulCoatsCatsAndDogs.PickleSteps.csproj -c Release
```

Output goes to `Tests/Pickle/Mod/Pickle/Assemblies/`; intermediates to `.build/pickle/` (ignored).
Pickle loads step assemblies at game start, so rebuild **before** filing a request, and check the DLL
is newer than `CoatSteps.cs`. The DLL is tracked, as in the other suites.
