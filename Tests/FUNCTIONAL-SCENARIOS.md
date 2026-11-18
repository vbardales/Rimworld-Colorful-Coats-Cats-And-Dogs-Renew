# Functional scenarios, to be played in game

Offline suite (`Test-Mod.ps1` next door) answers "do files parse, resolve, still target what exists". Can't answer "does result look like dog" — needs map + eyes. These scenarios do. Each: one thing to watch, one way to be wrong.

**No log errors ≠ pass here, even less than usual.** Every operation carries `<success>Always</success>`, letting player run one target mod of four without wall of red. Cost: misses invisible. Only animals on screen settle it.

**Setup for everything below.** Dev mode on. Stray Dogs (rescued), Let's Have a Cat! Continued, Vanilla Animals Expanded active, this mod last. Spawn animals with debug tool, not traders: ten at a time, so 60% chance shows as ~six, not one animal that may or may not have rolled.

---

## 0. It loads, and the patches take

**Do.** Start game with mod active, load any save, open animals tab.

**Expect.** No red at startup. Mod does nothing at any other moment: no assembly, no tick, no job — fault not here is nowhere.

**Watch for in `Player.log`.** Four lines, each different meaning. All game's own wording, read off 1.6 assembly:

- `[Colorful Coats - Cats and Dogs! Renew] Patch operation ... failed` — operation never matched anything, any file. With `<success>Always</success>` on every add, should be impossible; if appears, flag lost in edit.
- `XML Verse.PawnKindDef defines the same field twice: alternateGraphics.` — **the one real risk of this mod.** Two mods each added coat list to same animal. See scenario 4.
- `Exception parsing <alternateGraphics>... to type UnityEngine.Color` — malformed colour.
- `Could not find type named ... from node` — `Class=` attribute no longer resolves; RimWorld renamed patch operation class.

**If it fails here, stop.** Everything below assumes patches live.

---

## 1. A dog gets a coat at all

**Do.** Spawn ten golden retrievers. Then ten standard poodles.

**Expect.** ~Six of ten retrievers differ in colour only — same sprite, outline, size. ~Four original gold, matching 0.6 chance. ~Eight of ten poodles differ, four coats distinguishable from each other.

**If every animal is identical**, patch didn't apply. Check `Qux.stray.dogs` really in mod list and this mod loads after it.

**Why the poodle.** Only breed with four coats at 0.8 — fails loudest.

## 2. The tint reads as fur, not as dirt

Scenario no checker replaces; only real risk left. Colours are purpleyam's, measured — but against Vanilla Animals Expanded sprites. Stray Dogs ships textures inside Unity asset bundle, so tint targets couldn't be checked from disk like cats'.

**Do.** Look at each of nineteen dogs at normal zoom, not zoomed in.

**Expect**, ask two questions per coat:

- **Still reads as that breed?** Tint multiplies: grey over golden dog = muddy olive, not grey dog. If coat looks dirty not different, raise colour towards white — don't change hue.
- **Difference visible at all?** Dark dog — newfoundland, bernese mountain dog — tint has almost nothing to work with. If either looks identical to original, cut from patch rather than keep entry pretending to work.

**Then same pass on eleven cats**, where sprites were measured: white cat and persian most convincing, brown tabby least.

## 3. One animal, one coat, for life

**Do.** Spawn puppies and kittens, watch one through growth, or else confirm juveniles show coat variety at all. Then save, quit to menu, load.

**Expect.** Rust-coated puppy grows into rust-coated dog; every animal keeps coat across save.

**Why it holds.** Nothing stored. `PawnGraphicUtils.TryGetAlternate` rolls coat from `pawn.thingIDNumber ^ 0xB415` every ask — same animal, same answer for life, zero bytes in save.

**Same fact, other side.** Add mod to colony with existing dogs: they take coats **immediately**, not just newborns. Remove it: back to original coats, save intact.

**Warning that follows.** Coat is *index* into list. Reordering a breed's entries recolours every such animal in running saves — append entries, never insert.

## 4. Two mods never dress the same animal

**Do.** Three passes, this mod loaded last each time.

1. **Erin's Cat Overhaul** active. Spawn twenty vanilla cats.
2. **Animal Variety Coats** active. Spawn ten huskies and ten labradors.
3. **Colorful Coats - Vanilla Animals Expanded! Renew** active. Spawn chihuahuas and siamese cats (theirs), then beagles and corgis (ours).

**Expect.** In 1 and 2, those mods' painted coats, none of ours — conditional found `alternateGraphics` already present, wrote nothing. In 3, both sets appear; no animal flickers or fails to draw.

**Watch for.** `XML Verse.PawnKindDef defines the same field twice: alternateGraphics.` Means two coat lists on one animal; loader kept one at random. Conditional exists to prevent it — also what happens if this mod forced to load *before* one of those three.

**Why it is worth three passes.** Three fail differently. Animal Variety Coats removes any found coat list before adding own — survives either order. Erin's Cat Overhaul doesn't; that's the pass where duplicate line can actually appear.

## 5. A colony running none of the four target mods

**Do.** Vanilla + this mod only. Start colony. Spawn husky, labrador, yorkshire terrier.

**Expect.** Coats on all three, **no red in log**. Thirty-seven of forty-one operations target absent mods; must pass silently.

**Red here means a `<success>Always</success>` went missing**, and it names the breed.

## 6. The absences are deliberate — do not file them

Three things look like bugs, aren't. Uninformed tester reports all three.

- **Let's Have a Cat! black cat never varies.** Texture averages 29/255, tint only darkens — every coat within two shades of original.
- **Stray Dogs collie, doberman, six Japanese dogs never vary either**, nor fourteen Vanilla Animals Expanded breeds covered by other port. Already have coats; this mod stands aside wherever one exists.
- **Dark breed varies less than pale one, on purpose.** Newfoundland and bernese mountain dog: two coats at 0.4; white cat: five at 0.8.

## 7. The poodle wears purpleyam's own four coats

**Do.** Spawn twenty standard poodles.

**Expect.** Apricot, chocolate, black, rose-grey, roughly equal, on ~four in five.

**Why it is a scenario and not a detail.** Only breed where palette lands back on animal it was painted for: four values = purpleyam's four poodle coats, measured from their mod. Four plausible poodles → measured-palette idea sound. Four muddy poodles → tint wrong, not breed — and scenario 2 applies to other eighteen dogs too.