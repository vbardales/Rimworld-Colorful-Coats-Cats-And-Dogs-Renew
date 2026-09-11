# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — 2026-09-11

First release. Not a port: purpleyam's **Colorful Coats - Cats and Dogs!** had nothing left to
port, so this is its idea rebuilt against the cats and dogs that are alive on 1.6.

### Added

- Coats for **19 dogs of Stray Dogs (rescued)** — the seventeen Spidercamp breeds that ship with
  none, plus the bernese mountain dog and the swedish vallhund. Its collie, its doberman and its
  six Japanese dogs already have coats and are untouched.
- Coats for **11 of the 12 cats of Let's Have a Cat! Continued**, which had none at all.
- Coats for the **7 cats and dogs of Vanilla Animals Expanded** purpleyam never painted: the
  abyssinian cat, the beagle, the corgi, the french bulldog, the german shepherd, the pug and the
  welsh terrier. The other fourteen are left to *Colorful Coats - Vanilla Animals Expanded! Renew*,
  which ships purpleyam's own artwork for them.
- Coats for the **4 base-game pets** — husky, labrador retriever, yorkshire terrier, cat — behind a
  conditional, so Animal Variety Coats and Erin's Cat Overhaul win wherever they are running. The
  yorkshire terrier is the one animal in the list that nothing else has ever covered.
- `_tools/Check-Coats.ps1`, which re-checks every `defName` against the installed target mod, that
  no target has since grown `alternateGraphics` of its own, and that every colour is in the form
  `ParseHelper` reads as 0-255.
- `_tools/Measure-Coats.ps1`, which recomputes the palette from purpleyam's mod and Vanilla Animals
  Expanded, so the provenance of every colour can be checked rather than believed.
- `About/Preview.png`, with the mod name and a summary engraved into it per STYLE_RIMWORLD.md, and
  `About/ModIcon.png`. `Art/preview.html` is the page headless Chrome rasterises, so the glyphs
  are composed at 896 x 504 and never resampled.

### Decided

- **A coat is a colour, not a texture.** `Verse.AlternateGraphic` applies its `color` over the
  animal's own sprite when no `texPath` is given — read in the decompiled 1.6 assembly, and used by
  Core itself for the guinea pig. So the mod ships no artwork and borrows nobody's.
- **The palette is purpleyam's, measured rather than invented.** Each tint is one of their coats
  divided by the sprite it was painted over, which is the colour that reproduces it. They painted
  26 coats; **17 are reachable as a tint** and those 17 are the whole palette. The other nine are
  repaints, lighter than the sprite or a pattern rather than a shade, and `_tools/Measure-Coats.ps1`
  reports them as unreachable rather than rounding them down. The standard poodle of Stray Dogs
  wears their four poodle coats in their order, and the labrador takes their chocolate and black.
- **Their textures still stay where they are.** Four of their cats have a namesake in Let's Have a
  Cat! and the poodle has one in Stray Dogs, but an alternate with a `texPath` replaces the sprite
  outright: half the animals of a breed would be drawn in another mod's art at twice the
  resolution. The colours travel; the pixels do not.
- **The black cat of Let's Have a Cat! gets no coats.** A colour multiplies the sprite, and that
  texture averages 29 out of 255: every tint would land within two shades of the original. Dark
  breeds elsewhere get two coats and a chance of 40% for the same reason.
- **Every operation is a `PatchOperationConditional` on `alternateGraphics`.** Two mods adding that
  element to one `PawnKindDef` leave two of them on it — `PatchOperationAdd` appends, it does not
  merge. The conditional means a mod with painted coats always wins, and `About.xml` declares
  `loadAfter` on each of them so the order is right by default.
- **`<success>Always</success>` on every inner operation, never on a container alone.**
  `PatchOperation.Complete` logs a failure for any operation that never matched anything, which is
  the normal case for a player who runs only one of the four target mods.
- **No count is engraved on the banner.** Forty-one breeds is not a number this repository
  controls: each of the four target mods can add one tomorrow, and every operation here is
  conditional on what they do. It is the compatibility-mod case of `STYLE_RIMWORLD.md` — the number
  would go stale without anyone touching the mod, so nothing would ever trigger a re-engraving.
- **The name and the family are kept**, `nelim.colorfulcoats.catsanddogsrenew`, in line with the
  Dodos, Megafauna and Vanilla Animals Expanded ports. `<author>` reads `nelim, after purpleyam`
  rather than the family's usual `purpleyam - 1.6 port: nelim`, because nothing of purpleyam's is
  in the files.

### Not done

- **purpleyam's mod was not ported.** Its 14 breeds, their chances and its 78 textures are already
  inside *Colorful Coats - Vanilla Animals Expanded! Renew*, identical; its own target,
  `VanillaExpanded.VAECD`, stopped at 1.3 and was absorbed by Vanilla Animals Expanded. Re-porting
  it would have patched the same fourteen defs of the same mod twice.
