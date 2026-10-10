# Functional scenarios, to be played in game

`Run-Functional-Tests.ps1` next door answers "does the game's patch engine write what these files
say, and does the game still read it". It cannot answer "does the result look like a dog", because
that takes a map and a pair of eyes. These are the scenarios that do, written so each one has a
single thing to watch and a single way of being wrong.

**The absence of errors in the log is not a pass here, and less than usual.** Every operation
carries `<success>Always</success>`, which is what lets a player run one target mod out of four
without a wall of red. It buys that by making a miss invisible. Only animals on screen settle it.

**Setup for everything below.** Development mode on. Stray Dogs (rescued), Let's Have a Cat!
Continued and Vanilla Animals Expanded active, this mod last. Spawn animals with the debug tool
rather than waiting for traders: ten at a time, so a 60% chance is visible as six-ish rather than
as one animal that may or may not have rolled.

---

## 0. It loads, and the patches take

**Do.** Start the game with the mod active, load any save, open the animals tab.

**Expect.** No red at startup. The mod does nothing at any other moment: there is no assembly, no
tick, no job, so a fault that is not here is not anywhere.

**Watch for in `Player.log`.** Four lines, each meaning something different. All four are the
game's own wording, read off the 1.6 assembly:

- `[Colorful Coats - Cats and Dogs! Renew] Patch operation ... failed` — an operation that never
  matched anything, on any file. With `<success>Always</success>` on every add, this line should be
  impossible; if it appears, a flag was lost in an edit.
- `XML Verse.PawnKindDef defines the same field twice: alternateGraphics.` — **the one real risk of
  this mod.** Two mods have each added a coat list to the same animal. Scenario 4 is about it.
- `Exception parsing <alternateGraphics>... to type UnityEngine.Color` — a malformed colour.
- `Could not find type named ... from node` — a `Class=` attribute that no longer resolves, which
  would mean RimWorld renamed a patch operation class.

**If it fails here, stop.** Everything below assumes the patches are live.

---

## 1. A dog gets a coat at all

**Do.** Spawn ten golden retrievers. Then ten standard poodles.

**Expect.** Six-ish of the ten retrievers differ from the rest in colour only — same sprite, same
outline, same size. Four-ish are the original gold, which is what a chance of 0.6 asks for. Eight-ish
of the ten poodles differ, and the four coats are distinguishable from each other.

**If every animal is identical**, the patch did not apply. Check that `Qux.stray.dogs` is really in
the mod list and that this mod loads after it.

**Why the poodle.** It is the only breed carrying four coats at 0.8, so it fails loudest.

## 2. The tint reads as fur, not as dirt

This is the scenario no checker can replace, and the only real risk left in the mod. The colours
are purpleyam's, measured, but they were measured against Vanilla Animals Expanded's sprites, and
the dogs of Stray Dogs ship their textures inside a Unity asset bundle — so what those tints land
on could not be checked from disk the way the cats' were.

**Do.** Look at each of the nineteen dogs at normal zoom, not zoomed in.

**Expect**, and ask two questions of each coat:

- **Does it still read as that breed?** A tint multiplies, so a grey laid over an already-golden dog
  gives a muddy olive rather than a grey dog. If a coat looks dirty rather than different, its
  colour wants raising towards white — not changing hue.
- **Is the difference visible at all?** On a dark dog — newfoundland, bernese mountain dog — a tint
  has almost nothing to work with. If either looks identical to its original, cut it from the patch
  rather than leaving an entry that pretends to do something.

**Then the same pass on the eleven cats**, where the sprites were measured: the white cat and the
persian should be the most convincing, the brown tabby the least.

## 3. One animal, one coat, for life

**Do.** Spawn puppies and kittens and watch one through a growth, or failing that confirm that
juveniles show coat variety at all. Then save, quit to the menu, and load.

**Expect.** A rust-coated puppy grows into a rust-coated dog, and every animal keeps its coat
across the save.

**Why it holds.** Nothing is stored. `PawnGraphicUtils.TryGetAlternate` rolls the coat from
`pawn.thingIDNumber ^ 0xB415` every time it is asked, so the same animal gets the same answer for
life without a byte in the save file.

**The same fact, seen from the other side.** Add the mod to a colony that already has dogs: they
take their coats **immediately**, not only the ones born afterwards. Remove it and they go back to
their original coats, with the save intact.

**And the warning that follows from it.** The coat is an *index* into the list. Reordering the
entries of a breed recolours every animal of it in saves already running, so entries are appended,
never inserted.

## 4. Two mods never dress the same animal

**Do.** Three passes, each with this mod loaded last.

1. **Erin's Cat Overhaul** active. Spawn twenty vanilla cats.
2. **Animal Variety Coats** active. Spawn ten huskies and ten labradors.
3. **Colorful Coats - Vanilla Animals Expanded! Renew** active. Spawn chihuahuas and siamese cats,
   which are theirs, then beagles and corgis, which are ours.

**Expect.** In 1 and 2, the painted coats of those mods and none of ours — the conditional found
`alternateGraphics` already there and wrote nothing. In 3, both sets appear and no animal flickers
or fails to draw.

**Watch for.** `XML Verse.PawnKindDef defines the same field twice: alternateGraphics.` That line
means two coat lists landed on one animal, and the loader kept one of them at random. It is what
the conditional exists to prevent, and it is also what would happen if this mod were forced to load
*before* one of those three.

**Why it is worth three passes.** The three fail differently. Animal Variety Coats removes any coat
list it finds before adding its own, so it survives either order. Erin's Cat Overhaul does not, and
that is the pass where the duplicate line can actually appear.

## 5. A colony running none of the four target mods

**Do.** Vanilla plus this mod, nothing else. Start a colony. Spawn a husky, a labrador and a
yorkshire terrier.

**Expect.** Coats on all three, and **no red in the log**. Thirty-seven of the forty-one operations
are aimed at mods that are not there, and they must pass in silence.

**Red here means a `<success>Always</success>` went missing**, and it will name the breed.

## 6. The absences are deliberate — do not file them

Three things look like bugs and are not. A tester who does not know them will report all three.

- **The black cat of Let's Have a Cat! never varies.** Its texture averages 29 out of 255 and a tint
  only darkens, so every coat would land within two shades of the original.
- **The collie, the doberman and the six Japanese dogs of Stray Dogs never vary either**, nor do the
  fourteen Vanilla Animals Expanded breeds covered by the other port. They already have coats, and
  this mod stands aside wherever one exists.
- **A dark breed varies less than a pale one, on purpose.** Newfoundland and bernese mountain dog
  get two coats at 0.4; the white cat gets five at 0.8.

## 7. The poodle wears purpleyam's own four coats

**Do.** Spawn twenty standard poodles.

**Expect.** Apricot, chocolate, black and a rose-grey, in roughly equal numbers, over four in five
of them.

**Why it is a scenario and not a detail.** It is the one breed where the palette lands back on the
animal it was painted for: those four values are purpleyam's four poodle coats, measured out of
their mod. If they read as four plausible poodles, the whole measured-palette idea is sound. If they
read as four muddy poodles, it is the tint that is wrong, not the breed — and scenario 2 applies to
the other eighteen dogs too.
