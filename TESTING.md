# Test scenarios

Four patch files, no textures, no assembly. There is little here to break, and what can break
breaks **silently** — which is why this mod needs the game rather than a checker.

**The absence of errors in the log is not a pass.** Every operation carries
`<success>Always</success>`, so an operation that finds no animal reports success and writes
nothing. That flag is what lets a player run one target mod out of four without a wall of red;
it buys that by making a miss invisible. Only animals on screen settle it.

## What is settled before the game starts

`_tools/Check-Coats.ps1` answers the questions that do not need RimWorld running: every `defName`
still exists in the mod its patch names, none of them has grown `alternateGraphics` upstream since,
every colour is in the form `Verse.ParseHelper.ParseColor` reads as 0-255, and every operation has
the conditional-plus-`Always` shape. It exits non-zero and names the breed when one fails.

```
powershell -File _tools/Check-Coats.ps1
```

It skips, loudly, any target mod that is not installed on the machine it runs on.

The repository's shared checkers cover the rest: `Check-XmlFields.ps1` for elements that map to no
1.6 field, `Check-XmlClasses.ps1` for the `Class=` values, `Check-DefRefs.ps1` for dangling
references, `Check-TypeRefs.ps1` for third-party types.

None of that says a coat appears on a dog. That is what the scenarios below are for.

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

## 1 — A dog gets a coat at all

Dev mode, **Stray Dogs** active. Spawn ten golden retrievers.

Expect: roughly six of the ten differ from the other four, and from each other, in colour only —
same sprite, same outline, same size. Four of ten is the original gold, which is what
`alternateGraphicChance` 0.6 asks for. If all ten are identical, the patch did not apply; check
that the mod list really contains `Qux.stray.dogs` and that this mod loads after it.

Repeat with **standard poodles**, where the chance is 0.8 and there are five coats. Eight in ten
should differ, and the five should be distinguishable from one another.

## 2 — The tint does not ruin the sprite

This is the scenario the checker cannot replace, and the only real risk in the mod. The tints
themselves are sound — they are purpleyam's, measured — but they were measured against Vanilla
Animals Expanded's sprites, and the dogs of Stray Dogs ship their textures inside a Unity asset
bundle, so what those tints land on could not be checked from disk the way the cats' were.

Look at each of the nineteen dogs at normal zoom and ask two questions:

- **Does it still read as that breed?** A tint multiplies: a grey laid over an already-golden dog
  gives a muddy olive rather than a grey dog. If a coat looks dirty rather than different, its
  colour wants raising towards white, not changing hue.
- **Is the difference visible at all?** On a dark dog — newfoundland, bernese mountain dog — a tint
  has almost nothing to work with. If those two look identical to their original, cut them from the
  patch rather than leaving an entry that pretends to do something.

Same pass on the eleven cats, where the measurements were real: the white cat and the persian
should be the most convincing, and the brown tabby the least.

## 3 — Puppies and kittens

Spawn juveniles. A coat is not stored on the pawn: `PawnGraphicUtils.TryGetAlternate` rolls it from
`pawn.thingIDNumber ^ 0xB415` every time it is asked, so the same animal gets the same coat for
life, across life stages and across saves, without anything being written down. A rust-coated puppy
must therefore grow into a rust-coated dog. Watch one through a growth if you can; failing that,
confirm that puppies show coat variety at all.

## 4 — Nothing is patched twice

**Erin's Cat Overhaul** active, this mod after it. Spawn twenty vanilla cats.

Expect: Erin's nineteen painted coats, and none of the four tints from `Coats_Core.xml`. The
conditional saw `alternateGraphics` already there and wrote nothing. The same test with **Animal
Variety Coats** active covers the husky and the labrador.

Then **Colorful Coats - Vanilla Animals Expanded! Renew** active beside this mod: spawn chihuahuas
and siamese cats, which belong to that mod, and beagles and corgis, which belong to this one. Both
sets should have coats, and no animal should flicker or fail to draw.

## 5 — A colony that runs none of the target mods

Vanilla plus this mod, nothing else. Expect coats on the husky, the labrador, the yorkshire terrier
and the cat, and **no red in the log**: the thirty-seven operations aimed at absent mods must pass
in silence. Red here means a `<success>Always</success>` went missing.

## 6 — Added to a save, and removed from one

Load a colony that already has dogs, with the mod added. They must take their coats **immediately**,
not only the next ones born: the roll depends on the pawn's ID and nothing else, so it applies
retroactively the moment the list exists.

Save, quit to the menu, load again. Each animal must keep the coat it had — same ID, same seed,
same index.

Then remove the mod and load the save once more. The animals go back to their original coats and
the save keeps working. Nothing about the coat is written into the save file.
