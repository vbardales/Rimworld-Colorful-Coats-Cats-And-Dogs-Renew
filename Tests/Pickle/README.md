# Colorful Coats - Cats and Dogs! Renew: Pickle suite

Dev only. Nothing under `Tests/` in Workshop payload: Steam publishes `Mod/` only. **Played:** passes recorded in `STATUS.md` and `Docs/runs/` (three passes, 34-breed review, cats and painters replays, removal chain, 1.7 run without optional mods, gallery runs). `scripts/Check-Steps.ps1 -ModRoot <this folder>` of protocols repo (run after every feature/step edit) checks features against Pickle's real steps: each step defined exactly once, each map entry resolves. Proves phrases exist, not that step does what sentence says; only run does.

## Scope

Offline suite (`Tests/Test-Mod.ps1`, shared checks `Check-ModBasics`, `Check-DefRefs`,
`Check-Textures`, `Check-PatchTargets` and `Check-ConfigErrors`) owns all provable without game. Scenario only repeating one of those not written. Local suite running RimWorld's own patch engine outside game removed 2026-10-20 (commit `4f15825`).

Pickle limited to what needs running game:

- **what game kept** after loading whole mod list through real loader - inheritance, ordering, every other mod's patches - offline harness on isolated documents can't see;
- **game really parsed colours** on 0-255 scale (offline suite mirrors rule because `ParseHelper.ParseColor` not callable under Windows PowerShell 5.1);
- **the one fault whole design prevents**, two coat lists on one animal, game reports itself as `defines the same field twice: alternateGraphics`;
- **coat drawn**, surviving save and reload;
- **pictures a person reads**, the reason suite exists: scenario 2 of `Tests/FUNCTIONAL-SCENARIOS.md`, tint reads as fur or dirt, only thing nothing here decides by assertion.

## Passes

Three passes + three single-target passes (2bis) + one two-launch removal chain (added 2026-10-02). No French launch: mod owns no player-facing text (`localization: not_applicable` in `STATUS.md`), so French pass only re-checks game's own strings. Decision, not oversight; owner confirmed 2026-09-28. Reopen if mod gains text.

| Pass | Map | Feature | What it establishes |
| --- | --- | --- | --- |
| 1. Without optional mods | `wsl-deps.sans-facultatifs.map` | `01` | Four base-game pets alone; 37 operations aimed at absent mods left no trace |
| 2. The three target mods | `wsl-deps.avec-cibles.map` | `02` | Stray Dogs, Let's Have a Cat! and Vanilla Animals Expanded together; no double coat list; animals already with coats left alone |
| 3. The mods that paint | `wsl-deps.avec-peintres.map` | `03` | Animal Variety Coats, Erin's Cat Overhaul and sibling port own their animals; this mod wrote nothing on them |
| 2bis-a. Stray Dogs alone | `wsl-deps.stray-dogs.map` | `02a` | Red can only be Stray Dogs or this mod; poodle puppies get coats, keep them growing up |
| 2bis-b. Let's Have a Cat! alone | `wsl-deps.lets-have-a-cat.map` | `02b` | Same for cats; kittens |
| 2bis-c. Vanilla Animals Expanded alone | `wsl-deps.vae.map` | `02c` | Same, with framework, without sibling port; beagle puppies |
| 3. Removal chain | `wsl-deps.retrait.map` | `31` then `retrait-check` | Two launches, one lock: `-Filter 31-retrait-write -Then retrait-check -ThenWithout nelim.colorfulcoats.catsanddogs,nelim.colorfulcoats.catsanddogs.pickletests`. Game saved with mod loads and runs without it; save holds nothing of mod |
| 2ter. Review captures, every other breed | `wsl-deps.avec-cibles.map` | `08` | 34 `@review` captures (scenario 2): 17 Stray Dogs, 10 cats, 7 VAE breeds. Each opened and described in `docs/runs/` |
| Add to a running colony | `wsl-deps.stray-dogs.map` | `32` | Needs save `colorfulcoats-without-mod` (written by removal chain) copied to `Tests/Pickle/Mod/Pickle/Fixtures/` first |
| Gallery | `wsl-deps.galerie.map` | `07` | Three Workshop shots on studio colony |

**No declared-incompatibility pass:** `About.xml` declares no `incompatibleWith`, so no claim to check. Three painters are `loadAfter` entries, covered by pass 3.

**No restart sequence:** coat stored nowhere (`PawnGraphicUtils.TryGetAlternate` rolls it from animal's id every ask), so in-process save-and-reload scenario is all of it.

**No DLC-absent pass:** mod references no DLC; `LoadFolders` default.

Passes 2 and 3 not merged on purpose. Stray Dogs and painters could load together, but red in merged pass can't say target or painter caused it, and painters (Erin's Cat Overhaul above all) have own quirks not this mod's.

## Running it

From collection root, once `scripts/Pickle-Status.ps1` says machine free. **Session never launches game**: files request, dispatcher's worker plays it.

```powershell
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.sans-facultatifs.map -Filter '01-sans-facultatifs' -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 1, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass1
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.avec-cibles.map     -Filter '02-cibles'            -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 2, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass2
Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 -Mod ColorfulCoatsCatsAndDogsRenew -Owner local_<id> -DepMap wsl-deps.avec-peintres.map   -Filter '03-peintres'          -Language English -Label "ColorfulCoatsCatsAndDogsRenew local_<id> pass 3, <sha>" -EvidenceDir ColorfulCoatsCatsAndDogsRenew/Tests/Pickle/Evidence/<date>-<sha>-pass3
```

Request carries no SHA: mod staged when ticket played, from working tree at that moment. Keep `Mod/` tree untouched from filing to `RUN_DONE`; put SHA in label so findable in report.

Before filing: check each map exists (staging script silently ignores missing one), and target mods present in WSL copy. Workshop ids in maps are those this audit found installed on Windows; not checked against what WSL staging resolves.

## Reading a result

Read `exitReason` before counts. Compare scenarios played vs discovered: pass 1 has 10, pass 2 has 18, pass 3 has 10 (each Scenario Outline row counts as one). `@review` scenario asserts nothing about picture: green means route ran, not tints right. **Open every capture and look**, write down what seen.

Two reds not necessarily this mod's:

- pass 3, `no animal received two coat lists`: Erin's Cat Overhaul appends its list to vanilla cat without checking, so can conflict with Animal Variety Coats on own. Read log line: if names animal this mod also patches, ours.
- any pass, `no errors were logged`: covers all logged during scenario, other mods' included. Red is lead, not verdict, until line read.

## Evidence to keep

What keep after run, what delete, per `AGENTS.md` ("Test evidence") and `PickleTools/TESTING.md`. `Tests/Pickle/Evidence/` **gitignored**: proof on disk, not git, and disk full.

| Keep, per pass | Why |
|---|---|
| `summary.json`, `summary.md` | Verdict. `exitReason` first |
| `junit.xml` | Per-step outcome, failure messages |
| `evidence-complete.txt` or `no-report.txt` | Says copy whole, or no report exists |
| **`@review` captures a person actually opened**, minified to JPEG | Only evidence tints read as fur: 3 in pass 2 (poodles, newfoundlands, persians), 1 in pass 1 (huskies) |
| One line in `docs/runs/` per run | History, as text, never folders |

Delete once run read: `Player.log` and `messages.ndjson` (log check goes into the one `docs/runs/` line: what grepped for, what found), any `screenshots/` folder copied whole, `report.html` once verdict written, report of failed or infrastructure attempt once cause in `STATUS.md`, any report for superseded revision once pass repeated on current. **Exception, stated here because mod's only visual evidence:** pass 2 `@review` captures are sole proof of scenario 2, kept until later run replaces them for same revision.

Never delete report a `STATUS.md` field still points to: repoint first.

## Build

```powershell
dotnet build Tests/Pickle/Source/ColorfulCoatsCatsAndDogs.PickleSteps.csproj -c Release
```

Output to `Tests/Pickle/Mod/Pickle/Assemblies/`; intermediates to `Tests/Pickle/Source/obj/` and `bin/` (ignored).
Pickle loads step assemblies at game start, so rebuild **before** filing request; check DLL newer than `CoatSteps.cs`. DLL tracked, as in other suites.