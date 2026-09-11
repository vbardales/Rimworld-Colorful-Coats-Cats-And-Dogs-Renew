# Colorful Coats - Cats and Dogs! Renew — attribution

Named after **Colorful Coats - Cats and Dogs!**, by **purpleyam**
([2388932599](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599)), and built from
nothing but its idea.

## Status: public

The source mod is **dead** — it declares 1.3 and nothing further — and **no licence is declared
anywhere**, checked at the four places one could be: no `LICENSE` file in the mod, no mention in
its `About.xml`, no linked repository (`<url>` is absent entirely), and nothing in the body of the
description on its Steam page. That last check is the one that matters: it is the one that was
skipped once on たたら製鉄, whose ban on redistribution turned out to be a sentence in its
description and nowhere else.

The question barely arises here, because **nothing of purpleyam's is redistributed**. What is
borrowed is the name and the idea, and both are credited by name, in `About.xml`, in `LICENSE` and
here, with removal on request and without argument.

## What was taken, and it is not files

Nothing. Not a texture, not a line of XML, not a colour value.

The original is a single patch file that adds `alternateGraphics` to fourteen `PawnKindDef`s of
*Vanilla Animals Expanded — Cats and Dogs*, pointing at 78 textures purpleyam painted. All of that
survives elsewhere: Vanilla Animals Expanded absorbed the Cats and Dogs module, and the fourteen
breeds still carry purpleyam's painted coats through **Colorful Coats - Vanilla Animals Expanded!
Renew** (`nelim.colorfulcoats.vaerenew`), where the same textures are shipped byte for byte.

Re-porting the original would therefore have patched the same fourteen defs of the same mod twice.
What was actually missing was the rest of the cats and dogs on 1.6, which is what this mod is.

| taken from purpleyam | shipped here |
|---|---|
| the idea: a coat is a `PawnKindDef` away | 41 breeds' worth of it |
| the name, and the family it belongs to | `Colorful Coats - Cats and Dogs! Renew` |
| the poodle at four coats and 80% | five coats at 80%, on a different poodle |

## What was made

Four patch files, a showcase image and an icon. No textures, no assembly, no `Defs`, no DLC.

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
