# Test scenarios

Four patch files, no textures, no assembly. There is little here to break, and what can break
breaks **silently** — which is why this mod needs the game rather than a checker.

**The absence of errors in the log is not a pass.** Every operation carries
`<success>Always</success>`, so an operation that finds no animal reports success and writes
nothing. That flag is what lets a player run one target mod out of four without a wall of red;
it buys that by making a miss invisible. Only animals on screen settle it.

## What is settled before the game starts

Two scripts, and they answer different questions.

**`_tools/Check-Coats.ps1`** is the quick one: every `defName` still exists in the mod its patch
names, none of them has grown `alternateGraphics` upstream since, every colour is in the form the
game reads as 0-255, every operation has the conditional-plus-`Always` shape.

**`_tools/Run-Functional-Tests.ps1`** is the one that runs the game's own code. RimWorld's patch
engine is ordinary .NET: the shipped XML is turned back into real `PatchOperationConditional` and
`PatchOperationAdd` objects, and their `Apply` is called on a document built from the target mods'
own defs. So "the patch writes the right coats", "a breed that already has coats is left alone" and
"an absent target mod costs nothing" are answered by the game rather than by a description of it.
It also sweeps the IL of `Assembly-CSharp` for whoever reads `AlternateGraphic.color`, because a
setting nothing reads is a mod that loads, logs nothing and does nothing.

Twenty-two tests, twenty-five seconds once the mod-folder cache is warm. Seventeen of them have
been seen to fail under a mutation; the other five assert the game's own behaviour and cannot be
made to fail from here. The mutations are listed in the script's header.

```
powershell -File _tools/Check-Coats.ps1
powershell -File _tools/Run-Functional-Tests.ps1
```

Both skip, loudly, any target mod that is not installed on the machine they run on.

The repository's shared checkers cover the rest: `Check-XmlFields.ps1` for elements that map to no
1.6 field, `Check-XmlClasses.ps1` for the `Class=` values, `Check-DefRefs.ps1` for dangling
references, `Check-TypeRefs.ps1` for third-party types.

None of that says a coat appears on a dog. That is what the scenarios are for.

## Load order

```
Qux.stray.dogs                          Stray Dogs (rescued)             3549460027
akairo.LetsHaveaCat                     Let's Have a Cat! Continued      3682940618
VanillaExpanded.VanillaAnimalsExpanded  Vanilla Animals Expanded         2871933948
nelim.colorfulcoats.vaerenew            Colorful Coats - VAE! Renew
Erin.Cats                               Erin's Cat Overhaul              2763428090
cucumpear.azrael.varietycoats           Animal Variety Coats             1511926373
nelim.colorfulcoats.catsanddogsrenew    this mod                         last
```

The order matters in one direction only. Loading **after** the coat-painting mods is what lets the
conditional see their work and stand aside. Loading before them is not a crash: this mod would add
its tints, Animal Variety Coats would remove them and add its own, and Erin's Cat Overhaul would
leave two `<alternateGraphics>` elements on the vanilla cat for the loader to choose between.
`About.xml` declares the `loadAfter` entries, so the autosorter gets this right unaided.

## What only the game can settle

The scenarios themselves live next to the suite that cannot replace them, in
[`_tools/FUNCTIONAL-SCENARIOS.md`](_tools/FUNCTIONAL-SCENARIOS.md): eight of them, each with one
thing to watch, one way of being wrong, and the line in `Player.log` that says so.

The one that matters most is the second. The tints are purpleyam's and were measured, but they were
measured against Vanilla Animals Expanded's sprites, and the dogs of Stray Dogs keep their textures
in a Unity asset bundle — so what those colours land on has never been seen outside a game.
