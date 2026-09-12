# Colorful Coats - Cats and Dogs! Renew — attribution

Named after **Colorful Coats - Cats and Dogs!**, by **purpleyam**
([2388932599](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599)), and built from
nothing but its idea.

## Status: public

Checked on 2026-09-12: no licence or reuse permission was found in the installed
original's files, the Steam descriptions, all 20 original comments and all 31
comments on the official successor. The public author profile has no reuse terms.

An upstream repository was actively sought through Steam/profile links, About.xml,
web searches by author, title and packageId, and GitHub repository search for
"Colorful Coats". The four GitHub results are vbardales' Renew repositories;
none is purpleyam's upstream repository. No upstream repository was found, so no
upstream README is claimed to have been reviewed. If one is located, its README,
licence files and other textual documents must be checked for terms before
relying on this classification.

Under the user's classification, an abandoned source means one not updated to
RimWorld 1.6. The original declares up to 1.3 and its
[official successor](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130)
up to 1.4. Therefore `silent` is retained: no 1.6 update and no licence or permission
found. Elapsed time and the author's personal activity are not classification
criteria. The unofficial suffix remains. Absence of a licence is not permission
to reuse.

The question barely arises here, because **nothing of purpleyam's is redistributed**. What is
borrowed is the name and the idea, and both are credited by name, in `About.xml`, in `LICENSE` and
here, with removal on request and without argument.

## What was taken: the colours, not the files

Not a texture and not a line of purpleyam's XML. But the palette is theirs, measured out of their
own coats, and that is worth more than either.

The original is a single patch file that adds `alternateGraphics` to fourteen `PawnKindDef`s of
*Vanilla Animals Expanded — Cats and Dogs*, pointing at 78 textures purpleyam painted. All of that
survives elsewhere: Vanilla Animals Expanded absorbed the Cats and Dogs module, and the fourteen
breeds still carry purpleyam's painted coats through **Colorful Coats - Vanilla Animals Expanded!
Renew** (`nelim.colorfulcoats.vaerenew`), where the same textures are shipped byte for byte.

Re-porting the original would therefore have patched the same fourteen defs of the same mod twice.
What was actually missing was the rest of the cats and dogs on 1.6, which is what this mod is.

### How the palette was recovered

For each of purpleyam's coats, `_tools/Measure-Coats.ps1` takes the mean colour of its opaque
pixels, takes the same for the sprite it was painted over, and divides one by the other. That ratio
is the `<color>` that makes `AlternateGraphic.GetGraphic` land on purpleyam's coat starting from the
untouched sprite. It is a measurement of their work, reproducible from the two mods on disk, and it
travels to animals their textures never could.

purpleyam painted **26 coats**, shipped as 78 files, three rotations each. **Seventeen are
reachable** as a tint and are the whole palette of this mod:

| tint | from | tint | from |
|---|---|---|---|
| `(102,94,90)` | PoodleC | `(192,192,192)` | CatBengalA |
| `(111,124,166)` | GreatDaneA | `(195,206,208)` | CatSphynxB |
| `(122,122,122)` | CatMunchkinA | `(221,197,170)` | CatPersianA |
| `(137,132,130)` | ChihuahuaA | `(231,216,204)` | ShihTzuA |
| `(138,113,98)` | PoodleB | `(234,216,172)` | ChihuahuaC |
| `(145,120,100)` | ChihuahuaB | `(242,205,190)` | PoodleD |
| `(150,155,171)` | CatSomaliB | `(246,244,215)` | PoodleA |
| `(155,174,176)` | CatSphynxA | `(255,249,201)` | CatNorwegianA |
| `(188,228,255)` | CatSomaliA | | |

The other nine are true repaints — lighter than the sprite underneath, or a pattern rather than a
shade — and a multiply cannot reach them. The tool says so rather than rounding them down.

Two places where the palette lands close to home: **the standard poodle of Stray Dogs takes
purpleyam's four poodle coats**, in their order, and the labrador of the base game takes their
chocolate and their black, which happen to be the labrador's own two.

### And why the textures themselves stay where they are

Four of purpleyam's cats have a namesake in *Let's Have a Cat!* — persian, maine coon, siamese,
norwegian forest — and the poodle has one in *Stray Dogs*. Shipping the textures onto those would
mean an alternate graphic that replaces the sprite outright, so half the animals of a breed would
be drawn in Vanilla Animals Expanded's art, at roughly twice the resolution of the mod they belong
to. The colours travel; the pixels do not.

| taken from purpleyam | shipped here |
|---|---|
| the idea: a coat is a `PawnKindDef` away | 41 breeds' worth of it |
| the name, and the family it belongs to | `Colorful Coats - Cats and Dogs! Renew` |
| 17 of their 26 coats, as colours | the whole palette |
| the poodle at four coats and 80% | their four coats at 80%, on another poodle |

## What was made

Four patch files, three tools, a showcase image and an icon. No textures, no assembly, no `Defs`,
no DLC.

| file | breeds |
|---|---|
| `Patches/Coats_StrayDogs.xml` | 19, in Stray Dogs (rescued) |
| `Patches/Coats_LetsHaveACat.xml` | 11, in Let's Have a Cat! Continued |
| `Patches/Coats_VanillaAnimalsExpanded.xml` | 7, in Vanilla Animals Expanded |
| `Patches/Coats_Core.xml` | 4, in the base game |

## How it works

`Verse.AlternateGraphic` carries more than a texture path. Decompiled from the 1.6
`Assembly-CSharp.dll`:

```csharp
public Graphic GetGraphic(Graphic other)
{
    if (graphicData == null) graphicData = new GraphicData();
    graphicData.CopyFrom(other.data);
    if (!texPath.NullOrEmpty()) graphicData.texPath = texPath;
    graphicData.color    = color    ?? other.color;
    graphicData.colorTwo = colorTwo ?? other.colorTwo;
    return graphicData.Graphic;
}
```

An alternate with a `color` and **no** `texPath` keeps the animal's own sprite and recolours it. So
a coat costs one line of XML and no artwork at all, and it belongs to whoever drew the sprite.

This is not a trick found in a mod: **Core does it itself**. The guinea pig of
`Races_Animal_CatGroup.xml` lists three texture coats and two colour coats side by side:

```xml
<li><color>(0.494,0.356,0.164,1)</color></li>
<li><color>(0.333,0.333,0.333,1)</color></li>
```

`Verse.ParseHelper.ParseColor` reads a component greater than 1 as 0-255, which is the form used
throughout this mod.

Verified by reflection against 1.6, all still under these names:

```
Verse.PawnKindDef.alternateGraphics      List<Verse.AlternateGraphic>
Verse.PawnKindDef.alternateGraphicChance float
Verse.AlternateGraphic.texPath           string
Verse.AlternateGraphic.color             Color?
Verse.AlternateGraphic.colorTwo          Color?
Verse.AlternateGraphic.weight            float
```

## The coat is never written down

```csharp
public static bool TryGetAlternate(this Pawn pawn, out AlternateGraphic ag, out int index)
{
    Rand.PushState(pawn.thingIDNumber ^ 0xB415);
    if (Rand.Chance(pawn.kindDef.alternateGraphicChance)
        && pawn.kindDef.alternateGraphics.TryRandomElementByWeight(x => x.Weight, out ag))
        index = pawn.kindDef.alternateGraphics.IndexOf(ag);
    Rand.PopState();
    return ag != null;
}
```

The roll is seeded from the pawn's own ID, so an animal keeps its coat across life stages and
across saves with nothing stored, and gets one retroactively the moment the mod is added. It also
means the coat is an index into the list: **reordering the entries of a breed recolours every
animal of it**, in saves already running. Entries are appended, never inserted.

`Weight` defaults to 0.5 and is left at its default everywhere here, so the coats of a breed are
drawn uniformly.

## Why every operation is a conditional

Each breed is patched inside a `PatchOperationConditional` that fires only when the breed has **no**
`alternateGraphics` of its own, and the inner `PatchOperationAdd` carries `<success>Always</success>`.

Both halves earn their place, and neither is decoration:

- **The conditional keeps two mods off one def.** `PatchOperationAdd` appends; two mods adding an
  `<alternateGraphics>` element to the same `PawnKindDef` leave two elements on it, and the loader
  then has to pick one. Several living mods paint coats for animals in this list — Animal Variety
  Coats, Erin's Cat Overhaul, Colorful Coats - Vanilla Animals Expanded! Renew — and painted coats
  are better than tinted ones, so they win by default: `About.xml` declares `loadAfter` on each, and
  this mod finds the field already filled and writes nothing.
- **`<success>Always</success>` keeps the log quiet.** `PatchOperation.Complete` logs
  `[mod] Patch operation … failed` for any operation that never succeeded on any file, which is
  exactly what happens when a player does not run Stray Dogs. The flag is on each operation, never
  only on a container: a `PatchOperationSequence` stops at the first operation that fails, so one
  renamed breed costs every breed listed after it its coats.

## The limit of a tint, stated once

A colour multiplies the sprite, so a coat is always **darker or warmer** than the original, never
lighter. That decides three things in the patches:

- the original coat stays the most common one, with chances from 40% to 80%;
- dark breeds get fewer coats and a lower chance;
- the black cat of Let's Have a Cat! gets none at all. Its texture averages 29 out of 255, so every
  tint would land within two shades of where it started.

## Thanks

- **purpleyam**, for the idea and the name.
- **SpiderCamp**, and **Qux** for keeping the dogs alive.
- **akairo** and **Bernau31**, for the cats.
- **Oskar Potocki**, **Sarg Bjornson** and **Erin**, for the animals of Vanilla Animals Expanded.
