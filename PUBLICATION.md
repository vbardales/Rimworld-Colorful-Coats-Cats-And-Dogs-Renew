# Publication

What the Workshop page asks for and the repository holds nowhere else. Draft opened 2026-10-02, while the
mod is `done` and not yet `tested`: nothing here is final, and nothing has been sent. The Workshop item
`3806769444` exists (the `0.1.0` upload only created it; it is private).

## Dependencies and DLC

- **Hard dependencies: none.** The mod is four XML patches, each a conditional that does nothing when its target
  is absent. Declaring any of the target mods as a dependency would force a download on players who want one
  of the others.
- **`loadAfter`** (already in `About.xml`): Core, Stray Dogs (`Qux.stray.dogs`), Let's Have a Cat!
  (`akairo.LetsHaveaCat`), Vanilla Animals Expanded (`VanillaExpanded.VanillaAnimalsExpanded`), the sibling port
  (`nelim.colorfulcoats.vae`), Erin's Cat Overhaul (`Erin.Cats`), Animal Variety Coats
  (`cucumpear.azrael.varietycoats`). Loading after them is what lets the conditional see their coats and stand aside.
- **DLC: none referenced.** No `LoadFolders.xml`, no `IfModActive` branch, `supportedVersions` is 1.6 only.

## Adult content boxes

None apply: the images show animals and a colonist in a meadow, no nudity, no violence. Every image is to be
opened and looked at before the boxes are answered.

## Gallery order

`0-preview.png` is a byte-for-byte copy of `Mod/About/Preview.png` (checked by hash). The rest come from
`Tests/Pickle/Mod/Pickle/Features/07-galerie.feature` (pass map `wsl-deps.galerie.map`). Steam shows the first
image large, so the most demonstrative one goes first after the preview.

| # | Shot | What it shows |
| --- | --- | --- |
| 0 | Preview | The banner |
| 1 | Poodles | A row, one animal of each coat, the original first. Four of the coats are purpleyam's own |
| 2 | White cats | The widest range, five coats |
| 3 | Huskies | A base-game dog that no other mod varies |

Not yet taken or looked at: the first run showed no animal in any image and was fixed; the replay (`99ed`) is
pending. The order above is a proposal until the images exist. Further images, if wanted: a breed or two from
`08-revue.feature` (34 captures, not yet played).

## Messages to the authors

One message per recipient, under 1000 characters, BBCode links, in the owner's voice, posted after the item is
public (see `WORKSHOP_COMMENTS.md`, "Writing a comment"). Recipients, each to be checked on its page before writing:

- purpleyam, the original *Colorful Coats - Cats and Dogs!* (Workshop `2388932599`): the idea, and the palette, measured not copied.
- Qux, Stray Dogs (rescued) (`3549460027`), and SpiderCamp, whose dogs it carries.
- akairo and Bernau31, Let's Have a Cat! Continued (`3682940618`).
- Vanilla Animals Expanded (`2871933948`): Oskar Potocki, Sarg Bjornson.
- Erin, Erin's Cat Overhaul (`2763428090`), and the author of Animal Variety Coats (`1511926373`): both are stood aside for.
- Pickle, RimLogging, Harmony and PickleTools (`3806142401`): development only, as the tests run on them.

Drafts are not written: the voice and the true detail of each mod are the owner's.

## Steam change notes

The note is written at the moment of upload. First line is `[b]<version>[/b]` with the exact version, or the CI stops.

### 1.0.0

```
[b]1.0.0[/b]
First complete release. Coat variations for forty-one breeds of cat and dog: nineteen dogs of Stray Dogs, eleven cats of Let's Have a Cat!, seven breeds of Vanilla Animals Expanded and the four base-game pets. Every coat is a tint over the animal's own sprite, so the mod ships no artwork. Nothing is written into the save: add or remove it at any time.
Fixed since the item was created: the load order against Colorful Coats - Vanilla Animals Expanded! Renew now names the right mod.
```

## Description

`About.xml` is read once, when the item is created, so it does not change the live page: the page description is updated by the CI (`update_description` of the manual workflow), from a Markdown block to write here before `prepublished`. The `<description>` of `About.xml` was rewritten on 2026-10-02 to carry, after the body and in PUBLISHING.md order, `IF I GO QUIET` (clause word for word), `AI-GENERATED`, `THANKS`, the line pointing to `ATTRIBUTION.md` and the licence, and the `[url=...]Source code on GitHub[/url]` link. It no longer says that in-game validation is pending.

**AI tools named, per PUBLISHING.md ("Génération par IA", 2026-09-22):** Claude Code, Codex and DALL-E, as stated by the owner on 2026-10-02. The repository itself records no Codex contribution (no commit, no note), so the split of who did what is the owner's wording, not something verifiable here. Tools already named in that block are not repeated in `THANKS`.

## After the upload

Commit `About/PublishedFileId.txt` at once (already done for `0.1.0`, in `97c19d3`). Steam creates every item
private: the owner flips it to public by hand, subscribes to her own item, and watches its comments.
