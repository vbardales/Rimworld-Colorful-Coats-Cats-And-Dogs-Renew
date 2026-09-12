---
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
settings_audit: not_applicable
mod:          Colorful Coats - Cats and Dogs! Renew (unofficial)
packageId:    nelim.colorfulcoats.catsanddogsrenew
repo:         Rimworld-Colorful-Coats-Cats-And-Dogs-Renew
visibility:   public
detached:     yes
stage:        done
stage_workflow: done = ready for final in-game validation; not tested
audit_revision: e56942774364cf05cd43134e97b07af06d9bb6c9
audit_date: 2026-09-13
automated_tests: passed; 22 passed, 0 failed, 0 skipped
xml_tests: passed; coats, injected fields, classes, def references, third-party types
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
  - unverified: execute scenarios 0-7, check Player.log, new colony, existing save, save/reload and add/remove; repeat applicable checks in English and French
  - defect: README.md and About.xml claim in-game testing despite the recorded absence of an in-game run; reconcile before publication
  - defect: About.xml description lacks the final Steam-formatted Source code on GitHub link required by PUBLISHING.md; correct before publication
session:      local_c77edc6e-276f-43fc-8c2d-fea14a5b8b01
updated:      2026-09-13, full ordered workflow audit; done retained with fresh technical checks
---

# Colorful Coats - Cats and Dogs! Renew — status

## Ordered workflow audit — 2026-09-13

This section and the front matter are the current verdict. Earlier entries below are
historical evidence, preserved verbatim, including their original language and limitations.
The user's supplied workflow takes precedence over the four parent protocols, all read
for this audit: PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.

**Previous stage: done. Retained stage: done.** Here `done` maps literally to the
user's eighth transition: ready for final functional validation in game, not already
validated in game. No shorthand mapping to `tested` or `published` is intended.

### Scope and revision

- Autonomous repository: `C:/Users/nelim/Documents/rimworld/ColorfulCoatsCatsAndDogsRenew`.
  Distributed folder: its `Mod/` subdirectory, containing nine files. No source,
  test tool, build intermediate or Art source is distributed.
- Audited HEAD: `e56942774364cf05cd43134e97b07af06d9bb6c9`;
  delivered Git tree: `fbd162c22db346a46a6b053ea0aa0ca85c98152d` (`HEAD:Mod`).
  Working tree was clean before the audit. Only STATUS.md was edited by this audit;
  delivered files, existing tests, illustrations and historical results were preserved.
- Live read-only GitHub checks: `gh repo view ... --json name,visibility,url,defaultBranchRef`
  returned PUBLIC, the expected repository and branch main; `git ls-remote origin HEAD`
  returned the audited HEAD. Initial sandbox access failed; the permitted read-only
  retry succeeded. The remote and first pushed commit are established, not inferred
  from this status card. No commit, push or publication was performed.
- Installed game: RimWorld `1.6.4871 rev590`. Assembly-CSharp.dll SHA256:
  `5CF1B5BE399D5B1C9C56CA72C9D35B4ECF307FEACF5859D04AC5A1AA5926356A`.

### Transitions, in order

| Transition | Result | Evidence and scope |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Independent Git root and live public GitHub repository, matching pushed HEAD; coherent folder/repository/packageId/name; initialized English README, attribution, licence and changelog. Root/distributed LICENSE and ATTRIBUTION copies have identical SHA256 hashes. |
| horsMonoRepo -> ModIcon generated | Validated; build not applicable | Four XML patches are the complete implementation; no assembly or build project exists. Delivered ModIcon is a readable PNG, 128 x 128, 36,734 bytes, directly inspected. No unimplemented feature was identified. |
| ModIcon generated -> Preview generated | Validated | Delivered Preview directly inspected: PNG, 896 x 504, 506,910 bytes, below both 900 KiB and 1 MB. |
| Preview generated -> preOptions | Validated | English description and preview; coherent Renew/unofficial naming. Green accent is distinct from golden secondary ink at full size and in the existing 268 px thumbnail. `and` uses reduced primary lettering; `Renew` reduced secondary lettering; unofficial occupies its own tag line. No clipping, overlap or concrete camera defect observed. |
| preOptions -> options | Not applicable, justified; gate passed | Settings inventory below establishes no useful settings contract, empty page or MainButtons shortcut. Applicable technical tests passed. No interactive test is required for this gate under the supplied workflow. |
| options -> l10n | Not applicable, justified; gate passed | All 41 payloads contain numeric chance/RGB values only; no owned visible text or translation targets. English and French resources are unnecessary for this content. |
| l10n -> preTest | Validated | Only native PatchOperationConditional/Add types; optional animal/coat mods are loadAfter entries, not hard dependencies. All 41 targets checked against installed 1.6 content. No local LoadFolders, MayRequire or third-party type exists. |
| preTest -> done | Validated | Existing scenarios 0-7 supply setup, actions and expected outcomes; automated and XML suites rerun successfully against unchanged delivered files. |
| done -> tested | Not verified | No game session or Player.log review performed. The written scenarios, including new/existing saves and applicable EN/FR passes, remain to be executed. |

The public/silent decision is retained from the detailed 2026-09-12 rights investigation
in this file and ATTRIBUTION.md, not newly certified by an online licence investigation
today. Its evidence is dated and could change. MIT explicitly covers this repository's
contributions and does not grant rights over purpleyam's name or measured palette;
no third-party licence was invented. The unofficial notices match that recorded decision.

### Settings and localization inventory

Reviewed every distributed XML and the full file inventory, not only searches for C#.
The only injected fields are `alternateGraphicChance`, `alternateGraphics`, `li`, `color`:
4 Core + 11 Let's Have a Cat + 19 Stray Dogs + 7 VAE operations, zero unexpected leaves.
Their classes are native patch operations, with no inherited settings provider or UI Def.
There is no MainButtonDef, settings class, empty settings page, configurable UI, user-input
validation, settings serialization, translation key, label, description or grammar payload.

The probabilities and palettes are fixed content choices per breed. The mod's documented
purpose is to fill missing coats automatically while deferring to existing coat lists;
no user configuration task or XML-editing setup is promised. Exposing each colour/chance
would invent a settings feature for this audit. Therefore settings_audit is not_applicable.
Application is through XML patch loading; scope is the active mod list, with no owned
settings state to save, migrate or reset. RIMMSQOL and other customization integrations
were not tested and are not claimed; shortcut and settings persistence tests have no target.

Animal text remains owned by Core/the optional animal mods and is unmodified. About
metadata and repository documentation follow the English publishing policy, outside the
in-game translation gate. Keyed parameters and DefInjected paths have no targets, so no
empty language folders or redundant English translations are required. General EN/FR game
regressions remain part of the final game pass; upstream translation completeness is not
certified. The previous localization result is independently re-established after settings.

### Executed checks and observed results

All commands below used Windows PowerShell with `-NoProfile -ExecutionPolicy Bypass -File`.

| Script and arguments | Observed result |
| --- | --- |
| `_tools/Run-Functional-Tests.ps1` | Exit 0; 22 passed, 0 failed, 0 skipped. Real game patch engine on 41 breeds; all 41 existing-coat guards and absent targets; native field readers; all 17 source-derived tints; packaging and load order. |
| `_tools/Check-Coats.ps1` | Exit 0; 19 + 11 + 7 + 4 breeds checked successfully. |
| `_tools/Check-PatchFields.ps1` | Exit 0; all 41 payloads extracted, including nested fields; no unknown 1.6 field. |
| `../scripts/Check-XmlClasses.ps1 -ModPath Mod -TypeLists ../rw16_types.txt` | Exit 0; both referenced types resolve. Native types are also exercised by the functional suite. |
| `../scripts/Check-DefRefs.ps1 -ModPath Mod` | Exit 0; XML well formed; no unresolved or mistyped Def reference/parent. There are no owned Defs; this checker does not establish XPath target coverage. |
| `../scripts/Check-TypeRefs.ps1 -ModPath Mod` | Exit 0; five XML files, zero unguarded third-party types. |

Additional direct XML checks verified all payload leaf values and installed packageIds:
Qux.stray.dogs (3549460027), akairo.LetsHaveaCat (3682940618), and
VanillaExpanded.VanillaAnimalsExpanded (2871933948), each declaring 1.6. Inspected their
LoadFolders: root plus 1.6 where applicable. A separate current-version target inventory
confirmed all 37 optional animals in those active Defs folders and all four Core animals,
none with an existing coat list. Its first Core collection hit abstract nodes without a
defName; the corrected `/Defs/PawnKindDef[defName]` collection was rerun successfully.
This was an audit-helper issue, not a mod failure. Conditional upstream prosthetics and
VAE non-Odyssey folders do not supply the animal targets checked here.

Limits: the functional suite reconstructs patch objects and gathers source Defs; it is
not the full mod loader, XML inheritance resolver, Unity renderer or game UI. Its colour
parser check mirrors the native rule under .NET Framework. Generic existing-coat fixtures
and the sibling VAE coat-list comparison passed; actual combined in-game sessions with
Erin's Cats, Animal Variety Coats and the sibling Renew mod were not run. No mutation
campaign was rerun today; the earlier mutation results remain historical.

### Findings outside the next functional transition

- Confirmed publishing-description discrepancy: About.xml contains a bare GitHub URL
  instead of the final `[url=...]Source code on GitHub[/url]` required by PUBLISHING.md.
  The URL itself is correct and live. Fix its presentation before publication; this is
  not an additional gate in the user's explicit preOptions criteria.
- Confirmed evidence discrepancy: README.md and About.xml say "under human direction
  and in-game testing", while TESTING.md and the historical results say game tests have
  not been executed. Reconcile this wording before publication; it is not proof of a
  successful game test or of a gameplay defect.
- Optional visual recommendation: the icon surrounds its clear orange mascot with many
  cat/dog faces, busier than STYLE_RIMWORLD.md's single-mascot/one-or-two-object model.
  Simplifying the surround would better match that style. The workflow's explicit PNG
  dimensions/format gate is met; no image generation or change was made for this audit.
- Historical French audit notes were preserved as requested. The current audit and the
  initialized public-facing documents are in English.

### Strictly necessary next transition

To reach tested, execute scenarios 0-7 in RimWorld 1.6, record actual results and inspected
logs, cover a new colony and an existing save, add/remove and save/reload, inspect the
nineteen Stray Dogs coats and other targeted animals, and run applicable EN/FR regressions.
Test the named optional coat integrations in game; resolve actual failures and rerun only
affected regressions. No settings page, MainButtons shortcut or translation resources need
to be created. Missing game results remain unverified, not confirmed defects.

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
