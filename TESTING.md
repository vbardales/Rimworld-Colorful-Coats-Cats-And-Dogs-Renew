# Test scenarios

Four patch files, no textures, no assembly. Little here to break. What can break breaks **silently** — so mod needs game, not checker.

**No errors in log is not a pass.** Every operation carries
`<success>Always</success>`, so operation finding no animal reports success, writes
nothing. Flag lets player run one target mod out of four without wall of red;
cost: miss invisible. Only animals on screen settle it.

## What is settled before the game starts

Two main scripts, plus field-checking wrapper, answer different questions.

**`scripts/Check-Coats.ps1`** is quick one: every `defName` still exists in mod its patch
names, none grew `alternateGraphics` upstream since, every colour in form game reads as 0-255, every operation has conditional-plus-`Always` shape.

**`scripts/Run-Functional-Tests.ps1`** runs game's own code. RimWorld patch
engine is ordinary .NET: shipped XML turned back into real `PatchOperationConditional` and
`PatchOperationAdd` objects, their `Apply` called on document built from target mods'
own defs. So "patch writes right coats", "breed already having coats left alone" and
"absent target mod costs nothing" answered by game, not by description of it.
Also sweeps IL of `Assembly-CSharp` for whoever reads `AlternateGraphic.color`, because setting nothing reads is mod that loads, logs nothing, does nothing.

Twenty-two tests, twenty-five seconds once mod-folder cache warm. Seventeen seen to fail under mutation; other five assert game's own behaviour, cannot be made to fail from here. Mutations listed in script header.

```
powershell -File scripts/Check-Coats.ps1
powershell -File scripts/Run-Functional-Tests.ps1
powershell -File scripts/Check-PatchFields.ps1
```

Both skip, loudly, any target mod not installed on machine they run on.
Quick checker reuses functional suite's mod-folder cache after verifying
folder location and packageId, falling back to discovery when entry stale.

Shared checkers in `../scripts/` cover `Class=` values (`Check-XmlClasses.ps1`),
dangling references (`Check-DefRefs.ps1`) and third-party types (`Check-TypeRefs.ps1`).
`Check-XmlFields.ps1` only reads Defs documents, skips patches. Local wrapper
`scripts/Check-PatchFields.ps1` therefore extracts all 41 injected payloads into temporary
PawnKindDefs, passes them to that checker, including nested AlternateGraphic fields.
Supply `-FieldChecker` if shared script lives elsewhere; missing checker is error.

Verified 2026-09-12: 22 functional tests passed, zero failed or skipped; all 41 payloads
passed field check; XML class, def-reference, third-party-type checks also passed.
Manual scenarios not yet executed in game.

None of that says coat appears on dog. That is what scenarios are for.

## Load order

```
Qux.stray.dogs                          Stray Dogs (rescued)             3549460027
akairo.LetsHaveaCat                     Let's Have a Cat! Continued      3682940618
VanillaExpanded.VanillaAnimalsExpanded  Vanilla Animals Expanded         2871933948
nelim.colorfulcoats.vae            Colorful Coats - VAE! Renew
Erin.Cats                               Erin's Cat Overhaul              2763428090
cucumpear.azrael.varietycoats           Animal Variety Coats             1511926373
nelim.colorfulcoats.catsanddogs         this mod                         last
```

Order matters one direction only. Loading **after** coat-painting mods lets
conditional see their work, stand aside. Loading before not crash: this mod would add
tints, Animal Variety Coats would remove them, add own, Erin's Cat Overhaul would
leave two `<alternateGraphics>` elements on vanilla cat for loader to choose between.
`About.xml` declares `loadAfter` entries, so autosorter gets this right unaided.

## What only the game can settle

Scenarios live next to suite that cannot replace them, in
[`Tests/FUNCTIONAL-SCENARIOS.md`](Tests/FUNCTIONAL-SCENARIOS.md): eight, each with one
thing to watch, one way of being wrong, and line in `Player.log` that says so.

Most important is second. Tints are purpleyam's, measured, but measured against Vanilla Animals Expanded's sprites, and Stray Dogs' dogs keep textures in Unity asset bundle — so what those colours land on never seen outside game.

## Manual scenarios against what the game has already shown (2026-10-02)

Criterion for `tested`: no manual test left to validate. Each of eight scenarios of
`Tests/FUNCTIONAL-SCENARIOS.md` either automated and green, or listed not applicable with reason. State on revision `3dad095` (patches unchanged since); no `@wip` scenario, no `@requires`
tag (three passes decide which mods present, by pass map, each played in full:
38 of 38, `exitReason: passed`, `setName` read in each `summary.json`).

| Scenario | Covered by | State |
| --- | --- | --- |
| 0. loads, patches take, no red | pass 1 `the mod is loaded...`, `the operations aimed at absent mods left no trace`, `no errors were logged`; Player.log grepped for the four lines the scenario names, 0 hits | automated, green |
| 1. a dog gets a coat | pass 1 forty huskies, pass 2 forty standard poodles (`wear several different coats`) | automated, green |
| 2. a tint reads as fur | `@review` captures of all 34 breeds read (`08-revue`, 34/34, docs/runs/2026-10-10-revue.txt); a few breeds show only a subtle spread | automated and read, green |
| 3. one coat for life | save and reload (green, passes 1-3); puppies/kittens keep their coats on growing up (2bis-a, 2bis-b, 2bis-c green); removal chain green (`7faf`); add-to-a-running-colony `32-ajout` green (`def6`) | **done** |
| 4. two mods never dress one animal | pass 3 (`no animal received two coat lists`, Erin's cat, Animal Variety Coats husky and labrador, sibling port) | automated, green |
| 5. none of the four target mods | pass 1 | automated, green |
| 6. the deliberate absences | pass 2 `the black cat has no coats`, `animals that already had coats were left alone` | not a test: a list of things not to report; the two assertions above cover it |
| 7. the poodle's four coats | pass 2 `the standard poodle wears purpleyam's four poodle coats` plus its capture | automated, green |

Nothing left before `tested` on in-game side: scenario 2 covered for all 34 breeds (`08-revue`, 2026-10-10)
and scenario 3 closed by 2bis-a/b/c, removal chain, `32-ajout`. Whether subtle spread of few
cat breeds acceptable is owner's call. English only for any manual pass; no French pass, mod owns
no text (owner, 2026-09-28).