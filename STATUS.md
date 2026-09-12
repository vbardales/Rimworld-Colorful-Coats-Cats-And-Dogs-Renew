---
mod:          Colorful Coats - Cats and Dogs! Renew
packageId:    nelim.colorfulcoats.catsanddogsrenew
repo:         Rimworld-Colorful-Coats-Cats-And-Dogs-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   no licence anywhere from purpleyam: no LICENSE file, no About.xml, no linked repository, no body text on the Steam page. Dead source, stopped at 1.3. None of its files is reused here; the palette is measured off its coats and the name is its own, both credited.
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
  - unverified: the tints of the 19 Stray Dogs dogs have never been seen on their sprites, which live in an asset bundle unreadable from disk
session:      local_c77edc6e-276f-43fc-8c2d-fea14a5b8b01
updated:      2026-09-12, fields confirmed by the session that holds this mod
---

# Colorful Coats - Cats and Dogs! Renew — status

Status card, read by a pass over every mod rather than by asking each thread one at a time. It
lives at the root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Three of them cannot be, and wait on the
session that holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
