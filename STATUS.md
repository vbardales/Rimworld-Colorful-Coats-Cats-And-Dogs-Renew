---
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
mod:          Colorful Coats - Cats and Dogs! Renew (unofficial)
packageId:    nelim.colorfulcoats.catsanddogsrenew
repo:         Rimworld-Colorful-Coats-Cats-And-Dogs-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_own:  MIT; LICENSE and Mod/LICENSE; covers this repository's contributions, not purpleyam's name or measured palette
licence_at:   checked 2026-09-12; source not updated to 1.6 (original 1.3, official successor 1.4); no licence or permission found in source files, Steam descriptions and all comments; upstream repository searched but not found
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
  - unverified: the tints of the 19 Stray Dogs dogs have never been seen on their sprites, which live in an asset bundle unreadable from disk
session:      local_c77edc6e-276f-43fc-8c2d-fea14a5b8b01
updated:      2026-09-13, translation audit recorded; previous verification retained
---

# Colorful Coats - Cats and Dogs! Renew — status

Status card, read by a pass over every mod rather than by asking each thread one at a time. It
lives at the root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four of them cannot be, and wait on the
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

## Verification du 2026-09-12

- Titre : `Colorful Coats - Cats and Dogs! Renew (unofficial)`. Le suffixe
  `(unofficial)` est deja present et coherent avec l'absence d'accord explicite
  indiquee dans l'attribution ; aucun suffixe supplementaire a ajouter.
- Description : lien GitHub present dans le texte de `Mod/About/About.xml`
  et dans son champ `url`, identique au depot configure comme remote `origin`.
- Tests manuels : huit scenarios (0 a 7) dans `_tools/FUNCTIONAL-SCENARIOS.md`,
  avec procedures et resultats attendus. Ils restent a executer en jeu ;
  `tested_on` reste vide.
- Tests automatises : `_tools/Run-Functional-Tests.ps1` execute aujourd'hui :
  **22 reussis, 0 echec, 0 ignore**. Les 41 races sont testees avec le moteur
  de patch du jeu, y compris les animaux deja pourvus de robes et les cibles absentes.
- XML : `Check-XmlClasses.ps1`, `Check-DefRefs.ps1` et `Check-TypeRefs.ps1`
  reussis sur `Mod/`. `_tools/Check-PatchFields.ps1` valide aussi les champs
  des 41 blocs injectes contre l'assemblage 1.6 : aucun champ inconnu.
  Le controle des references de defs general ne valide pas les cibles XPath ;
  cette couverture vient de la suite fonctionnelle.
  `Check-Coats.ps1` reussi egalement : 19 + 11 + 7 + 4 races verifiees.
- Licence de nos contributions : **MIT**, texte dans `LICENSE` et `Mod/LICENSE`.
  Le champ `licence: silent` conserve le statut de la source purpleyam consigne
  dans l'attribution, sans pretendre lui attribuer une licence MIT. Ce statut
  a ete reverifie en ligne ensuite ; voir les preuves et limites ci-dessous.

## Reverification de silent — 2026-09-12

- Fichiers installes de `2388932599` : aucun fichier de licence ; `About.xml`
  existe bien, declare 1.2 et 1.3, sans licence ni URL de depot. Aucun avis de
  permission ou de refus trouve dans les fichiers XML/TXT. L'ancienne formulation
  « no About.xml » etait incorrecte : c'est la mention de licence qui manque.
- [Page originale](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599) :
  aucune licence ni consigne de redistribution trouvee dans la description et
  les commentaires affiches. La description et le commentaire de purpleyam du
  29 octobre 2022 renvoient explicitement vers son successeur officiel.
- [Successeur de purpleyam](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130) :
  aucune licence trouvee dans la description. Derniere mise a jour affichee :
  octobre 2022, version declaree jusqu'a 1.4 ; reponse de l'auteur visible en
  novembre 2023. Des utilisateurs le signalent fonctionnel en 1.6 en 2025.
- Verification directe dans le navigateur : les 20 commentaires du mod original
  et les 31 du successeur ont ete lus, toutes pages comprises. Aucune permission
  de reprise ni interdiction trouvee. Le « you can use both » de fevrier 2021
  concerne la compatibilite avec Animal Variety Coats, pas la redistribution.
- [Historique du successeur](https://steamcommunity.com/sharedfiles/filedetails/changelog/2398446130) :
  les cinq entrees ont ete lues ; aucune mise a jour apres octobre 2022.
- [Profil public](https://steamcommunity.com/profiles/76561198342847927) consulte
  avec succes : aucune consigne generale de reutilisation ni annonce d'abandon.
  Ses six publications publiques ne comprennent pas d'autre successeur annonce.
- Recherche de depot amont effectuee : liens des pages Steam, profil public,
  champ URL du About.xml, recherches web par auteur, titre et packageId,
  puis recherche directe GitHub sur "Colorful Coats". Les quatre resultats
  GitHub sont les depots Renew de vbardales, pas des depots de purpleyam.
  Aucun depot amont trouve ; aucun README amont ne peut donc etre annonce
  comme lu. Cela ne prouve pas qu'un depot non indexe ou prive n'existe pas.
- Decision : `silent` confirme selon le critere precise par l'utilisateur :
  **source abandonnee = pas mise a jour en 1.6**. L'original declare au plus
  1.3 et le successeur officiel au plus 1.4. Aucune licence ni autorisation
  trouvee dans les sources consultees. Le suffixe (unofficial) est conserve.
  L'ancien raisonnement fonde sur le temps ecoule et les reponses de l'auteur
  est retire : ces elements ne determinent pas cette classification.

## Procedure de verification

1. Verifier si la source est mise a jour en 1.6 : sinon, elle est abandonnee
   au sens de cette classification, sans condition d'anciennete ou d'activite.
2. Lire les fichiers de licence, About.xml, README et autres documents textuels
   de la source ; lire aussi la description Steam et les commentaires de l'auteur.
3. Chercher activement un depot amont, meme si About.xml n'en lie aucun : liens
   Steam/profil et recherche par titre, auteur, packageId ou identifiant Workshop.
4. Si un depot est trouve, verifier son rattachement a l'auteur et lire son
   README, ses licences et ses autres documents textuels pour les permissions
   et restrictions. Ne pas confondre nos depots Renew avec une source amont.
5. Consigner les liens, les permissions et leur portee, ou l'absence de resultat.
   Pas de 1.6 et aucune licence/permission trouvee : silent. Source en 1.6 sans
   licence/permission : alive. Une licence ou permission explicite doit etre
   examinee avant de classer ; une interdiction ne devient pas silent.

## Preview overlay recomposed — 2026-09-12

- Source illustration: `Art/Preview.png`, copied unchanged from the existing
  text-free `Art/Preview-source.png`. No illustration was generated or replaced.
  The earlier generated lettering variant remains in `Art/Preview-unofficial-source.png`
  for reference and is not used as the composition background.
- Delivered image: `Mod/About/Preview.png`. Composition: `Art/preview.html`;
  palette (single colour source): `Art/preview-palette.json`;
  reproducible renderer and measurements: `Art/render-preview.cjs` and
  `Art/preview-qa.json`. Run `node Art/render-preview.cjs`; set
  `PREVIEW_NODE_MODULES` if the bundled Playwright/sharp modules live elsewhere.
- Veil: dark, slightly desaturated wood tone from the broad plank floor.
  Vivid accent: the green foliage of the two potted plants in the source, brightened and saturated for the
  divider and badge. Secondary ink: the dominant warm ochre family of the
  floorboards, lightened while retaining its golden colour for the tag and Renew suffix. The foliage green separates the accent from this dominant warm ochre family; it is a significant repeated scene detail, not an isolated pixel.
- Actual platform fonts verified through Chrome: Segoe UI Semibold for the
  46 px title, Segoe UI regular for tag and summary, Segoe UI Bold for version.
  The renderer waits for `document.fonts.ready` and image decoding before capture.
- Existing name and summary preserved. Strong words use 46 px; and and Renew use direct 0.65em spans (29.9 px), all at weight 600. The connector keeps primary ink, while Renew uses secondary ink. The unofficial status tag remains on its own line.
  Badge version is read from the highest stable supportedVersions in delivered
  About.xml (currently 1.6), with the prescribed triangle and rotated numerals.
- Rendered at 896 x 504, then visually checked at 268 px wide
  (`Art/preview-268.png`): title and version identifiable, divider visible,
  no text clipping or overlapping text blocks; reduced title words readable and green accent distinct from golden secondary ink. Summary remains intended for
  the full-size preview, as specified by the guide.
- Minimum WCAG contrast over every pixel of each text block's background
  rectangle, captured with lettering hidden: title 4.92:1, connector 12.31:1, Renew 7.60:1, summary 6.82:1,
  tag 8.06:1. Badge digits against its opaque accent: 9.35:1.
  Background-only proof: `Art/preview-background-qa.png`.
- Final file: 506910 bytes, below 900 KB. No Steam publication performed.

## Translation audit — 2026-09-13

Applied the translation gate from the parent workspace's `PUBLISHING.md` and
`TRANSLATIONS.md` to revision `7cd437a7b854eb7e0e69a9bceb7a4b9a5bd00668`.
The published content was unchanged during this audit.

- Inventory: all files under `Mod/`, including `About/About.xml` and all four
  conditional patch files. `rg --files -g '*.cs' -g '*.dll' -g 'LoadFolders.xml'
  -g '*.xml'` found only the About XML and those patches: no C# source, assembly,
  alternate load folders, owned Defs or language resources.
- Parsed each patch with PowerShell's `[xml]` and enumerated `//value//*` and
  `//value//*[not(*)]`. The 41 payloads (Core: 4, Let's Have a Cat: 11,
  Stray Dogs: 19, Vanilla Animals Expanded: 7) contain only
  `alternateGraphicChance`, `alternateGraphics`, `li` and `color`.
  Every leaf is a numeric probability or RGB tuple; zero unexpected fields or
  values. All four XML files parsed successfully.
- No patch adds or changes labels, descriptions, UI, grammar or generated text.
  XPath defNames and patch control values are internal identifiers, not displayed
  strings. Coat names appear only in XML comments. Animal names and descriptions
  remain owned by Core or the corresponding optional animal mod, untouched here;
  no translation keys are reused or introduced by this mod.
- About metadata, the preview/icon lettering, licences and attribution are
  publication material outside the in-game translation gate. They remain in English
  under the publishing policy. Development tools and Art sources are not shipped.
- Result: `localization`, `translation_en` and `translation_fr` are all
  `not_applicable`, because the complete inventory found no owned player-facing
  text to translate. No empty language folders or duplicate upstream translations
  are needed. DefInjected path validation and language-specific UI checks have no
  targets in this build; upstream language coverage is not certified by this audit.
- No in-game test was performed. Existing gameplay checks in `remaining` and the
  historical `stage` are preserved. Reopen the affected translation fields as
  `unchecked` after changes to patches, Defs, UI code or language resources.
