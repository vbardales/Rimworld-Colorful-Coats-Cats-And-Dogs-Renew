# Colorful Coats - Cats and Dogs! Renew

Coat variations for forty-one breeds of cat and dog on RimWorld 1.6 that have none.

Named after **purpleyam's Colorful Coats - Cats and Dogs!** and built on its idea. **No file of
theirs is in it, but every colour in it is theirs**, measured out of the coats they painted. Their
mod patched *Vanilla Animals Expanded — Cats and Dogs*, which no longer exists as a mod of its own,
and the coats themselves are already shipped by a different port. See
[ATTRIBUTION.md](ATTRIBUTION.md) for the whole of that story.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599 — declares 1.3 and
nothing further.

## What the mod does

Four patch files. No textures, no assembly, no Harmony, no DLC, no `Defs` of its own. Safe to add
to a save in progress and safe to remove from one: it changes how an animal is drawn, nothing else.

| patch | target | breeds |
|---|---|---|
| `Coats_StrayDogs.xml` | Stray Dogs (rescued), `Qux.stray.dogs` | 19 |
| `Coats_LetsHaveACat.xml` | Let's Have a Cat! Continued, `akairo.LetsHaveaCat` | 11 |
| `Coats_VanillaAnimalsExpanded.xml` | Vanilla Animals Expanded | 7 |
| `Coats_Core.xml` | the base game | 4 |

None of the four targets is a dependency. A patch whose animals are absent writes nothing and says
nothing, so the mod is useful with any one of them and harmless with none.

## A coat without a texture

`Verse.AlternateGraphic` takes a `color` as well as a `texPath`, and `GetGraphic` applies the
colour over the animal's **own** sprite when no path is given. One line of XML is therefore a coat,
and the artwork stays where it belongs — with whoever drew the animal.

Core does this itself: the guinea pig lists three texture coats and two colour coats in the same
`alternateGraphics` block.

```xml
<li><color>(246,244,215)</color></li>   <!-- purpleyam's apricot poodle, as a tint -->
```

## The palette is purpleyam's, measured

The colours are not invented. `_tools/Measure-Coats.ps1` takes each coat purpleyam painted, divides
its mean colour by the mean colour of the sprite it was painted over, and that ratio is the tint
which reproduces it. Of their 26 coats, **17 are reachable that way** and those seventeen are the
whole palette here; the other nine are repaints a multiply cannot reach, and the tool says so
rather than rounding them down.

The standard poodle of Stray Dogs ends up wearing purpleyam's four poodle coats, in their order.

```
powershell -File _tools/Measure-Coats.ps1
```

The limit is that a colour **multiplies** the sprite. A coat can only come out darker or warmer
than the original, never lighter. Three things follow, and all three are deliberate:

- the original coat is the most common one everywhere, with chances between 40% and 80%;
- dark breeds — newfoundland, bernese mountain dog, maine coon — get two coats and a low chance;
- the black cat of Let's Have a Cat! gets none. Its texture averages 29 out of 255, and every tint
  on it would land within two shades of the original. A variation nobody can see is worse than none.

## It fills gaps, and never fights

Each breed is patched inside a `PatchOperationConditional` that fires **only when the breed has no
`alternateGraphics` already**, and `About.xml` declares `loadAfter` on every mod that paints coats
for animals in this list: Animal Variety Coats, Erin's Cat Overhaul, and Colorful Coats - Vanilla
Animals Expanded! Renew. Painted coats are better than tinted ones, so those win by default and
this mod writes nothing for the animals they cover.

That is also what keeps two `<alternateGraphics>` elements off one `PawnKindDef`, which is what
would otherwise happen: `PatchOperationAdd` appends, it does not merge.

## What was checked

- **Every field exists in 1.6**, by reflection against `Assembly-CSharp.dll`: `alternateGraphics`,
  `alternateGraphicChance`, and `AlternateGraphic.texPath`, `color`, `colorTwo`, `weight`.
- **`GetGraphic` really applies a colour without a path** — read in the decompiled 1.6 assembly,
  quoted in [ATTRIBUTION.md](ATTRIBUTION.md), and used by Core itself for the guinea pig.
- **All 41 `defName`s exist in the mod each patch names**, and none of them already ships
  `alternateGraphics` upstream. `_tools/Check-Coats.ps1` re-checks this against the installed mods,
  and names the breed when it stops being true.
- **Nothing else in the workshop already does this.** The 9 726 installed mods were swept for one
  representative breed of each target — `SCGoldenRetriever`, `akaNEKO_Persian`, `AEXP_Beagle` — and
  nothing patches their graphics: the hits are the target mods themselves, Dog Wool and A Dog Said,
  neither of which is about how an animal looks. Animal Variety Coats does cover the cat, the husky
  and the labrador with real artwork, which is why those three sit behind a conditional; it has
  never covered the yorkshire terrier, and nor has anything else.

```
powershell -File _tools/Check-Coats.ps1
```

## Layout

```
Mod/          published — the junction into RimWorld/Mods points here
  About/
  Patches/
Art/          full-resolution sources for the showcase and the icon
_tools/       the checker, and the tool that recovers the palette
```

Everything outside `Mod/` stays out of the Steam upload by construction:
`SteamUGC.SetItemContent` takes the junction's target directory as it stands on disk, with no
filtering.

## Credit and removal

purpleyam declared no licence, checked at all four places one could be. No file of theirs is
redistributed here in any case — what is borrowed is the idea, the name, and the colours measured
from their coats. If purpleyam would rather this mod did not carry that name or those colours, say
so and it is renamed, repainted or taken down, without argument.

The animals belong to Qux and SpiderCamp, to akairo and Bernau31, to Vanilla Animals Expanded, and
to Ludeon. This mod ships no part of any of them.

See [TESTING.md](TESTING.md) for what the game has to settle, [ATTRIBUTION.md](ATTRIBUTION.md) for
what was taken and what was made, [LICENSE](LICENSE) for what the MIT grant covers, and
[CHANGELOG.md](CHANGELOG.md).

The work was done with the help of an AI assistant (Claude, by Anthropic), under human direction
and in-game testing.
