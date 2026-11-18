# Publication

What the Workshop page asks for and the repository holds nowhere else. The Workshop item `3806769444` exists (the `0.1.0` upload only
created it; it is private). Target version `1.0.0`, the first public release (owner, 2026-11-18: 1.0.0 on the 1.6 line first, then non-regression, then 1.1.0 for the 1.7 pass). Nothing has been sent except `0.1.0`.

## Steam description

```markdown
**UNOFFICIAL.** This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Coat variations for forty-one breeds of cat and dog that have none, so a colony's pets stop being interchangeable. Nineteen dogs from [Stray Dogs (rescued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3549460027), eleven cats from [Let's Have a Cat! Continued](https://steamcommunity.com/sharedfiles/filedetails/?id=3682940618), seven breeds from [Vanilla Animals Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2871933948), and the four pets the base game ships with.

Four patch files. No textures, no assembly, no Harmony, no DLC, no Defs of its own. Safe to add to a save in progress and safe to remove from one. Animals already on the map take their coats the moment the mod is added, and go back to their original one if it is removed - nothing is written into the save.

## WHAT IT COVERS, AND WHAT IT LEAVES ALONE

Every operation fires only when the animal has no coat variation already. Run it beside a mod that paints coats for the same breed and that mod wins, silently and every time - so this fills gaps rather than competing.

From [Stray Dogs (rescued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3549460027), by Qux, the living home of SpiderCamp's Dog Pack: afghan hound, border collie, borzoi, bullmastiff, bull terrier, caucasian shepherd, chow chow, golden retriever, greyhound, miniature dachshund, newfoundland, old english sheepdog, pug, saint bernard, schnauzer, standard poodle, welsh corgi, bernese mountain dog and swedish vallhund. Its collie, its doberman and its six Japanese dogs already have coats and are untouched.

From [Let's Have a Cat! Continued](https://steamcommunity.com/sharedfiles/filedetails/?id=3682940618), by akairo and Bernau31: eleven of its twelve breeds. The black cat is deliberately left out - see below.

From [Vanilla Animals Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2871933948): the abyssinian cat, the beagle, the corgi, the french bulldog, the german shepherd, the pug and the welsh terrier. The other fourteen cats and dogs in that mod already have hand-painted coats from Colorful Coats - Vanilla Animals Expanded! Renew, and are left to it.

From the base game: husky, labrador retriever, yorkshire terrier and cat. [Animal Variety Coats](https://steamcommunity.com/sharedfiles/filedetails/?id=1511926373) and [Erin's Cat Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2763428090) both cover some of those with real artwork; when either is running, it wins. The yorkshire terrier is the one animal here that nothing else in the workshop has ever given a second coat.

## HOW IT WORKS, AND WHAT THAT COSTS

The latest RimWorld version lets an alternate graphic carry a colour instead of a texture path. When it does, the game keeps the animal's own sprite and tints it. That is the whole mod: a list of tints per breed, and not one pixel of anyone's art.

The tints are purpleyam's own. Each one was measured out of a coat they painted for the original mod, by dividing that coat by the sprite it was painted over - which gives the colour that reproduces it. They painted 26 coats; 17 can be reached this way and those 17 are the whole palette here. The standard poodle of Stray Dogs ends up wearing their four poodle coats, in their order.

The honest limit of that trick is that a tint multiplies, so a coat can only come out darker or warmer than the original, never lighter. Two consequences, both deliberate:

- The original coat is always the most common one. Chances run from 40% to 80%.
- Animals whose sprite is already almost black get few coats or none. The black cat of Let's Have a Cat! gets none at all: its texture averages 29 out of 255, so every tint on it would land within two shades of where it started. A variation nobody can see is worse than no variation.

## CREDIT

The idea, the name and the whole shape of this mod are purpleyam's. Their [Colorful Coats - Cats and Dogs!](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599) stopped at RimWorld 1.3 with the mod it patched, Vanilla Animals Expanded - Cats and Dogs, which no longer exists on its own: Vanilla Animals Expanded absorbed it, and the coats purpleyam painted for those breeds live on in Colorful Coats - Vanilla Animals Expanded! Renew. So this is not that mod ported. It is the same idea pointed at the cats and dogs that are alive today and still have one coat each.

No file of purpleyam's is included here; the colours are theirs, the measuring is mine.

## IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-GENERATED

This mod was made with AI tools, under human direction: Claude Code (Anthropic) and Codex (OpenAI) for the XML patches, the checks, the test suites, the documentation and the composition of the Preview, and DALL-E (OpenAI) for the illustrations behind the ModIcon and the Preview. The in-game test runs were played by Pickle.

## THANKS

[purpleyam](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599) for the idea and the coats. SpiderCamp and Qux, for the dogs of [Stray Dogs (rescued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3549460027). akairo and Bernau31, for the cats of [Let's Have a Cat! Continued](https://steamcommunity.com/sharedfiles/filedetails/?id=3682940618). Oskar Potocki and Sarg Bjornson, for the animals of [Vanilla Animals Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2871933948). Erin, for [Erin's Cat Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=2763428090), and Think3r and Azrael, for [Animal Variety Coats](https://steamcommunity.com/sharedfiles/filedetails/?id=1511926373): both are read, never required, and win wherever they run. For development only, never a dependency of this mod: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696), [Harmony](https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077) (which Pickle needs) and [PickleTools](https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401).

Full credits and the licence are in ATTRIBUTION.md and LICENSE, in the source repository below.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Colorful-Coats-Cats-And-Dogs-Renew)
```

The block above is the one source of the description: `Mod/About/About.xml` is generated from it (`node .github/scripts/sync-about-description.mjs`).
It ends, after the credits, with the `Source code on GitHub` link to the repository, which is also the `<url>` field. Not linked on purpose:
SpiderCamp (no Workshop page of its own found yet, to verify before posting) and Colorful Coats - Vanilla Animals Expanded! Renew (the sibling item
`3806766686` is private until its own release; link it when it is public).

## Dependencies and DLC

- **Hard dependencies: none.** The mod is four XML patches, each a conditional that does nothing when its target
  is absent. Declaring any of the target mods as a dependency would force a download on players who want one
  of the others.
- **`loadAfter`** (already in `About.xml`): Core, Stray Dogs (`Qux.stray.dogs`), Let's Have a Cat!
  (`akairo.LetsHaveaCat`), Vanilla Animals Expanded (`VanillaExpanded.VanillaAnimalsExpanded`), the sibling port
  (`nelim.colorfulcoats.vae`), Erin's Cat Overhaul (`Erin.Cats`), Animal Variety Coats
  (`cucumpear.azrael.varietycoats`). Loading after them is what lets the conditional see their coats and stand aside.
- **DLC: none referenced.** No `LoadFolders.xml`, no `IfModActive` branch, `supportedVersions` lists the latest RimWorld version only.

## Adult content boxes

None apply: the images show animals and a colonist in a meadow, no nudity, no violence. Every image was opened and looked at (11 gallery
images, accepted by the owner on 2026-11-17, plus the Preview).

## Gallery order

`0-preview.png` is a byte-for-byte copy of `Mod/About/Preview.png` (checked by hash). The eleven others tell one story, a day of
pet-sitting at the sanctuary (Nelim looks after the neighbours' animals, a new group every few hours), and come from
`Tests/Pickle/Mod/Pickle/Features/09-galerie-sanctuaire.feature`, `09b-galerie-soir.feature`, `09c-galerie-chats.feature` and
`09d-galerie-chiens.feature` (pass map `wsl-deps.sanctuary.map`). The order groups the scenes by feature file (sanctuary 1-3, evening 4-6, cats 7-8, dogs 9-11), each file following the day; image 1 opens the day. Clean originals are in
`Art/Gallery-clean/`, subtitled copies in `Art/Gallery/`.
| # | File | Hour | Shot | What it shows |
| --- | --- | --- | --- | --- |
| 0 | `0-preview.png` | | Preview | The banner |
| 1 | `1-breakfast.jpg` | 7h | Breakfast | White cat (Let's Have a Cat!), five coats |
| 2 | `2-fetch-by-the-river.jpg` | 10h | Fetch | Labrador, four coats (base game) |
| 3 | `3-four-poodles-tour-the-statue-garden.jpg` | 12h | Poodle parade | Standard poodle, four coats |
| 4 | `4-chess-in-the-cloister.jpg` | 15h | Chess | Yorkshire terrier, three coats (base game) |
| 5 | `5-evening-training.jpg` | 18h | Evening training | Husky, four coats (base game) |
| 6 | `6-fireside.jpg` | 20h | Fireside | Vanilla Animals Expanded corgi, three coats, and the white cat asleep |
| 7 | `7-siesta-on-the-terrace.jpg` | 13h | Siesta | Six cat breeds (base game and Let's Have a Cat!) |
| 8 | `8-tea-time.jpg` | 17h | At the table | Six more cat breeds, one a Vanilla Animals Expanded Abyssinian |
| 9 | `9-eleven-o-clock-walk.jpg` | 11h | Walk | Nine Stray Dogs breeds, one coat each |
| 10 | `10-garden-rest.jpg` | 16h | Rest | Stray Dogs breeds resting round Nelim's stool |
| 11 | `11-dogs-supper.jpg` | 19h | Supper | Five Vanilla Animals Expanded dogs |

Every patched animal is in a shot (the 08-revue captures show every coat of every breed). Review copies under 2 MB each,
Gallery 4.8 MB, Gallery-clean 4.0 MB. Status: the eleven images were accepted by the owner on 2026-11-17 ("je valide tout").

## Gallery subtitles

| index | file | line |
| --- | --- | --- |
| 1 | `1-breakfast.jpg` | Seven o'clock breakfast: one white cat, five coats. |
| 2 | `2-fetch-by-the-river.jpg` | Fetch by the river: four labradors, one log. |
| 3 | `3-four-poodles-tour-the-statue-garden.jpg` | Four poodles tour the statue garden. |
| 4 | `4-chess-in-the-cloister.jpg` | A game of chess, watched from below. |
| 5 | `5-evening-training.jpg` | Evening training, and four huskies at the gate. |
| 6 | `6-fireside.jpg` | By the fire, the corgis keep their own colours. |
| 7 | `7-siesta-on-the-terrace.jpg` | One o'clock siesta: six cats take the terrace. |
| 8 | `8-tea-time.jpg` | Five o'clock at the table: six cats keep Nelim company. |
| 9 | `9-eleven-o-clock-walk.jpg` | Eleven o'clock walk: nine stray dogs, nine coats. |
| 10 | `10-garden-rest.jpg` | Four o'clock rest: seven dogs gather round Nelim's stool. |
| 11 | `11-dogs-supper.jpg` | Supper at seven: five dogs know the way to the table. |

## Steam change notes

The note is written at the moment of upload. First line is `[b]<version>[/b]` with the exact version, or the CI fails (AUDIT.md 11.i).
Sent before: `[b]0.1.0[/b]`, the creation of the item (private).

### 1.0.0

```
[b]1.0.0[/b]
[list]
[*] First public release: coat variations for forty-one breeds of cat and dog, nineteen dogs of Stray Dogs (rescued), eleven cats of Let's Have a Cat! Continued, seven breeds of Vanilla Animals Expanded and the four base-game pets.
[*] The palette is measured from the coats purpleyam painted for the original mod; the mod ships no artwork, only tints over each animal's own sprite.
[*] Every patch is conditional: where another mod already paints a breed (Animal Variety Coats, Erin's Cat Overhaul, Colorful Coats - Vanilla Animals Expanded! Renew), that mod wins.
[*] The cats of Let's Have a Cat! switch to the plain Cutout shader so a tint shows; the black cat stays out.
[*] Checked by static scripts and an automated in-game suite; nobody has played it by hand yet.
[/list]
[url=https://github.com/vbardales/Rimworld-Colorful-Coats-Cats-And-Dogs-Renew/blob/main/CHANGELOG.md]Full changelog on GitHub[/url]
```

## Thank-you comments (one per page, after the item is public)

Register: `WORKSHOP_COMMENTS.md`, keyed by the recipient's Workshop id. Let's Have a Cat! Continued (3682940618), Harmony (2009463077), Pickle
(3791648678) and RimLogging (3733484696) are already `posted`: only this mod joins their `Covers`, nothing is posted. PickleTools (3806142401) is the
owner's own project: `not_applicable`. Vanilla Animals Expanded (2871933948) is `drafted` by another mod (not posted): this draft is kept in case this
mod is public first, and one comment only goes out. **To draft, post by the owner under her own account, after reading the last comments of each page:**

| Recipient | Id | State |
|---|---|---|
| Colorful Coats - Cats and Dogs! (purpleyam, original) | 2388932599 | drafted, not `posted` |
| Stray Dogs (rescued) (Qux) | 3549460027 | drafted, not `posted` |
| Vanilla Animals Expanded (Oskar Potocki, Sarg Bjornson) | 2871933948 | drafted, not `posted` |
| Erin's Cat Overhaul (Erin) | 2763428090 | drafted, not `posted` |
| Animal Variety Coats (Think3r, Azrael) | 1511926373 | drafted, not `posted` |
| Gloomy Furniture (Continued) (Gaon, after the original author) | 3240958004 | drafted, not `posted` (gallery, image 8) |

**To verify on the pages before posting:** SpiderCamp's Dog Pack has no Workshop page found yet (Stray Dogs (rescued) names it); the Stray Dogs comment
carries the thanks for both. Animal Variety Coats credits Think3r as the author and Azrael as collaborator on the page, the assembly is thirite's and
Xen's: the draft names the author and the collaborator, not the assembly. Erin's page says art and XML by Erin.

**Gallery mods (owner, 2026-11-18: the mods used for the gallery are listed too).** The captures show Nelim and the set through the mods of
`ATTRIBUTION.md` ("Gallery set"). Their pages in the register (`WORKSHOP_COMMENTS.md`):

| Mod | Id | State in the register |
|---|---|---|
| Female Body Variants Continued | 3798082132 | posted 2026-10-11, this mod joins `Covers` |
| Female Apparel Variants Continued | 3799726535 | posted 2026-10-11, joins `Covers` |
| WDI's Realistic Bodies | 3527486510 | posted 2026-10-11, joins `Covers` |
| AB's Visible Pants | 2986402536 | posted 2026-10-11, joins `Covers` |
| Roo's HD Hairstyles (continued) | 3559870636 | posted 2026-11-10, joins `Covers` (Nelim's hair `Roo_HD_Hair_Highpony`, `Roo_Royal_LongHD` in the captures) |
| Hat Hair Control | 3760821540 | posted 2026-11-17, joins `Covers` (hair under the straw hat) |
| [NL] Facial Animation, Experimentals, Vanilla Textures Expanded - Facial Animation, Akeron Extras, EyeGenes3, Performance Patch, Vanilla Experimentals, [VK] add closed eyes, Visual beauty, Init Fix, Load Fix | 1635901197, 2581693737, 2816938779, 2889716301, 3745223213, 3790129900, 3753978140, 3694711465, 3685072616, 3609895011, 3721489042 | all posted (2026-10-11 and 2026-11-16), join `Covers` (Nelim's smile and eyes) |
| Vanilla Expanded Framework | 2023507013 | posted 2026-09-22, joins `Covers` (required by Vanilla Animals Expanded, staged by the map) |
| Let's Have a Cat! Continued | 3682940618 | posted 2026-11-10, joins `Covers` (also a patch target) |
| Gloomy Furniture (Continued) | 3240958004 | not in the register: row added `drafted`, draft below (the two `RGK_DogBowl` of image 8) |

One thank-you comment per page, ever (`WORKSHOP_COMMENTS.md`): all the pages above but Gloomy Furniture already carry one, so nothing is drafted for them
and this mod only joins their `Covers`. If the owner wants a second short message on one of them (the Adaptive Storage Neolithic Renew session drafted
such messages for its camp gallery), say which one: it is the owner's call. To verify on the Gloomy Furniture page before posting: the original author
(the page is a continuation maintained by Gaon, its text names no original author here) so both are credited, as for any "(Continued)" mod.

Draft, Gloomy Furniture (Continued):

```text
Two of your dog bowls sit on the floor of the tea-time picture in my gallery, and six cats turned up for them anyway xD Nothing of yours is inside the mod, they only star in that one shot: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url]. Thank you for keeping the furniture alive :)
```

Draft, purpleyam's original:

```text
I did the maths on your coats. Literally: coat divided by sprite, twenty-six times, and seventeen survived as plain tints :) Now your four poodles trot around on Stray Dogs' standard poodle in your order, and a pug you never painted wears your colours too: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url]. Not one pixel of yours inside, promise. Thank you, and you can send me packing any time lol
```

Draft, Stray Dogs (rescued):

```text
Nineteen of your dogs had worn the same coat since forever, and my colony's pug was starting to look like a clone xD So I handed them tints instead, no texture touched: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url]. Thank you Qux for keeping the pack alive, and SpiderCamp for drawing it. Please feed the pug.
```

Draft, Vanilla Animals Expanded:

```text
Seven of your animals just got a wardrobe: the abyssinian, beagle, corgi, french bulldog, german shepherd, pug and welsh terrier, in [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url]. Your textures did not move an inch, the game just tints them. The other fourteen already wear purpleyam's painted coats, so I let them be. Thank you Oskar and Sarg for the zoo xD
```

Draft, Erin's Cat Overhaul:

```text
Confession: the base-game cat is the one creature my patch and your overhaul would fight over, so I made mine lose on purpose :) When Erin's Cat Overhaul is running, my tints step aside and your cats get the stage. It is part of [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url]. Thank you Erin, they are lovely cats xD
```

Draft, Animal Variety Coats:

```text
You were drawing proper husky, labrador and cat coats while I was still counting pixels lol So in [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew[/url] my tints wait their turn and yours win, no fight. The Yorkshire terrier is the one pet nobody had touched, so I took that one :) Thank you Think3r and Azrael for the whole menagerie!
```

The six drafts differ in opening, ending and joke; each is under 1,000 characters and carries one hidden link. Re-read side by side before posting.

## Use This Instead

One comment on the [Use This Instead](https://steamcommunity.com/sharedfiles/filedetails/?id=3396308787) page (Mlie), posted by the owner after the item is public,
so players of the original are told about the Renew (`docs/USE_THIS_INSTEAD.md`). The Renew is the idea rebuilt, not a port: the original's own painted
coats live on in Colorful Coats - Vanilla Animals Expanded! Renew. The register row is added at `publish` (step 1 of the file). Old data read from
the original page and the ecosystem study (`docs/inventory/ecosystem-steam/ColorfulCoatsCatsAndDogsRenew.md`, PiI 2026-11-13); `oldVersions` to read again
on the page before posting:

```text
Colorful Coats - Cats and Dogs! by purpleyam (2388932599, package purpleyam.colorfulcoats.vaecatsdogs, RimWorld 1.3) can be replaced by [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444]Colorful Coats - Cats and Dogs! Renew (unofficial)[/url] (3806769444, package nelim.colorfulcoats.catsanddogs, RimWorld 1.6), by Nelim. Same idea, rebuilt for the cats and dogs that are alive today (Stray Dogs, Let's Have a Cat!, Vanilla Animals Expanded, base game): tints measured from purpleyam's coats, no texture shipped. Original: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599]Colorful Coats - Cats and Dogs![/url]. Thank you for the mod xD
```

## After the upload

Commit `About/PublishedFileId.txt` at once (already done for `0.1.0`, in `97c19d3`). Steam creates every item
private: the owner flips it to public by hand, subscribes to her own item, and watches its comments.

Version `1.0.0` was uploaded on 2026-11-18 (publish run 44213322211, commit `9083b73d3268bb6871b82f8f8b1467f1cededa06`, tag `v1.0.0`, tags sent: Mod, 1.6).

## Collection "RimWorld through Nelim's eyes"

The collection is https://steamcommunity.com/sharedfiles/filedetails/?id=3815982565 and the owner alone adds to it (AUDIT.md 13.c), when the item is public:

- the item: https://steamcommunity.com/sharedfiles/filedetails/?id=3806769444
- dependencies that are also Nelim's mods: none (no `modDependencies`, no `OptionalCompat.xml`; the sibling `nelim.colorfulcoats.vae` is only in `loadAfter`, and a `loadAfter` is not a dependency)
- DLC the mod requires: none
- descriptors (Workshop tags sent by CI): Mod, 1.6
