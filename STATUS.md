---
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
settings_audit: not_applicable
mod:          Colorful Coats - Cats and Dogs! Renew (unofficial)
packageId:    nelim.colorfulcoats.catsanddogs
repo:         Rimworld-Colorful-Coats-Cats-And-Dogs-Renew
visibility:   public
detached:     yes
workflow_stage: shootGallery[1.1.0]
audit_revision: a00034b4c2d3acdade8505073c708cd3f7c9f4ea (2026-10-15, chain 1 to 7 walked again, 8.a to 8.m below)
audit_date: 2026-10-15
automated_tests: passed; 22 passed, 0 failed, 0 skipped (rerun 2026-10-15, from scripts/)
xml_tests: passed; Check-Coats, Check-PatchFields (41), Check-XmlClasses, Check-DefRefs, Check-TypeRefs (rerun 2026-10-10)
licence:      silent
licence_own:  MIT; LICENSE and Mod/LICENSE; covers this repository's contributions, not purpleyam's name or measured palette
licence_at:   checked 2026-09-12; source not updated to 1.6 (original 1.3, official successor 1.4); no licence or permission found in source files, Steam descriptions and all comments; upstream repository searched but not found
upstream_mod_remotes: N/A (no git repository found for purpleyam's "Colorful Coats - Cats and Dogs!", Workshop 2388932599; searched again 2026-10-02, only this mod's own Renew repositories come up)
dependencies: none
showcase:     complete
tested_on:    2026-10-15 (cats replay rev a00034b: 10/10 and peintres 10/10, docs/runs/2026-10-14-chats-shader.txt; before that 2026-10-10 (Pickle 08-revue, 34/34 passed in the WSL, rev 58bcd23; passes 1-3 and add/removal runs on 2026-09-28 and 2026-10-02; no manual play))
workshop:     3806769444 (0.1.0, item creation only; About/PublishedFileId.txt committed in 97c19d3; private, as Steam creates every item; not tested, not public)
remaining:
  - 2026-10-31 (ffe2abb): feature fixes done: scene 4 Brioche moved to (177,129), scene 5 huskies named and spawned at fixed cells (the "around" names coat-N were not found). Refiled: scenes 4-5 as 20261031-200207-980-b935 (Inbox/gallery-3c), 097b as 20261031-200208-900-9358 (097b died on WSL not answering, 0 scenarios, empty folder deleted). Still waiting RUN_DONE: 993b (scenes 1-3), 680b (scene 6). The "refile 5157 and 097b" and scene 4/5 fix items below are done.
  - open 9.a-9.e (replay 2026-10-30): no capture accepted yet; fix scenes 4 (cell 175,129 not standable) and 5 (spawn coat-1 before coat), ask NPT about Harp IndexOutOfRange (scene 6; asked 2026-10-30 via TM relay, stack sent (exception in ReserveSittableOrSpot exactSittingPos, not the Require; Harp not moved), NPT answered: step bug, fixed in 8598dd6, Harp stays; scene 6 refiled alone 2026-10-30 as 20261030-162600-148-680b, Inbox/gallery-3b, waiting RUN_DONE), refile 5157 and 097b; then 9.c order, 9.d read every image, 9.e table, 9.b contiguous indexes
  - defect: gallery shotlist v2 of 2026-10-25 (commit 90b1970, replaces the e276 plan: e276 was 3/6, scenes 1 and 4 weak, 3, 5, 6 blocked cells). Two tickets waiting RUN_DONE: 20261029-223816-621-993b (09-galerie-sanctuaire, scenes 1-3, Inbox/gallery-2; refile of ceef, which stalled 2026-10-29 22:33 at staging, exit=3, no report, no mod error seen, first run after WSL restart, Windows free RAM 0.7 GB; stalled snapshot in pickle-reports-archive) and 20261025-140808-686-5157 (09b-galerie-soir, scenes 4-6, Inbox/gallery-3): RUN_DONE 2026-10-30 exit 1, 0/3 failed, exitReason failed: scene 4 "the cell (175, 129) is not standable" (Brioche facing South), scene 5 "no animal named coat-1 is on the map: spawn it first" (given coat 0), scene 6 Play_MusicalInstrument on Harp at (183, 0, 116) threw IndexOutOfRangeException in EdificeGrid.get_Item (interaction cell (183, 0, 115), map edge z=0, StagingSteps.PlaysInstrument); the first two are feature fixes (cell choice, spawn order), the third goes to NPT (step bug or Harp position) via the shotlist-requests rule. Untested steps in a gallery: forced haul, walk, follow, lies down, Play_Chess job, Train job, Harp; scene 5 falls back to a Hay haul if Train does not start, scene 4 has no fallback pose. Then: read every capture against its line, candidates in Art/Gallery, subtitles, reindex; 07-galerie.feature and wsl-deps.galerie.map deleted once accepted. Inbox/gallery-1 (e276) deleted after the new captures are read. NPT answer 2026-10-25 (accepted in principle, timing after its ticket 1071 plays haul and walk): all steps exist, none played in a gallery; haul has no "about to set down" instant (stop mid-way with "I advance the paused game by exactly N ticks"); Play_Chess reliability unknown, fallback step "Nelim sits on the building D at (x, z)" exists (scene 4); free cells via docs/SANCTUAIRE-CASES.md or "stands on the nearest free cell around (x, z)" (scenes 3, 5); no step pins firelight, a low sun is lessened by an earlier hour (scenes 5, 6). Revise the features after 1071 is read, not before
  - unverified: relays of 2026-10-11 handled 2026-10-25 (8551bf5): .github regenerated (Check-CiTemplate identical, only templateStamp changed in config); cutout-icon.cjs and local Check-Coats, Check-PatchFields, Run-Functional-Tests, Check-Steps already deleted (no local script left, no LOCAL_SCRIPTS cell to write); save pair moved to PickleTools SaveSteps (feature 31 uses it, @requires added, map line added, dll rebuilt). Removal chain replay ticket 097b (31-retrait-write then retrait-check): not in queue 2026-10-29, TM says pre-WSL-restart failures are false infra failures, refile it (map retrait, evidence Inbox/removal-savesteps to read first); SaveSteps never played before. Not done: "## Steam description" section of PUBLICATION.md (still "## Description", due writeDocs)
  - verified: ChatGPT review of the French texts (2026-10-17, FRENCH_REVIEW.md, PUBLICATION.md, CHANGELOG.md): no correction; Virginie read it and validated in chat the same day. Review line of FRENCH_REVIEW.md stays hers to fill
  - verified: RimWorld 1.7 diagnostic, 01-sans-facultatifs only: ticket 22df (rev 34e2d66) exit 0, exitReason passed, 10/10 passed; earlier 79df stall was not the mod. avec-cibles and avec-peintres not yet played in 1.7; 1.7 NOT in supportedVersions until green on all; tested_1_7 not set - docs/runs/2026-10-18-1.7-sans-facultatifs.txt
  - verified: cats replay (08-revue, ticket c554, rev c915093) 10/10 passed
  - verified: peintres replay (03-peintres, ticket 4a6a, rev c915093) 10/10 passed
  - verified: scenario 2 of Tests/FUNCTIONAL-SCENARIOS.md for all 34 breeds: 08-revue (rev 58bcd23, avec-cibles) 34/34 passed, exitReason passed, every @review capture opened and read, coats visibly differ on every breed; russian blue, american shorthair, white cat, kijitora, japanese bobtail and siamese only subtly (owner may judge) - docs/runs/2026-10-10-revue.txt
  - verified: all three Pickle passes (38 scenarios, rev 3dad095, Mod/ patches unchanged since) passed, exitReason passed, setName read in each summary.json (sans-facultatifs, avec-cibles, avec-peintres); no @wip, no @requires; Player.log grepped before deletion, 0 hits for this mod - docs/runs/2026-09-28-pass{1,2,3}.txt, docs/runs/2026-10-02-evidence-minified.txt
  - verified: evidence model applied 2026-10-19 (Inbox, Prune-Evidence -Apply); Evidence/ holds 2026-10-19-c915093-cats (replay c554, 10/10 green, replaced the 2026-10-14 cats folder, deleted) and 2026-10-19-c915093-peintres (replay 4a6a, 10/10 green, replaced the 2026-10-14 peintres folder, deleted); the 1.7 sans-facultatifs folder deleted, its condition met (green recorded here and in docs/runs/2026-10-18-1.7-sans-facultatifs.txt)
  - verified: 1.6 Pickle evidence of 2026-09-28 and 2026-10-02 deleted 2026-10-19 (superseded, no release condition); history in docs/runs/2026-09-28-pass{1,2,3}.txt, docs/runs/2026-10-02-evidence-minified.txt
  - verified: @review captures opened and read - huskies read as fur (icy blue, grey, cream, brown), poodles show 4 distinct tints, newfoundlands barely change as expected, persians show a faint tint as expected
  - verified: shared scripts/Check-Steps.ps1 -ModRoot (protocols repository, no game; a85e83c, 2026-10-11; 24 patterns, 416 step lines) found every step defined exactly once and every map entry resolving
  - verified: the loadAfter defect of 2026-09-28 (retired sibling id) confirmed fixed in game, pass 3 scenario 1
  - not applicable: French pass and interface check in EN/FR, MainButtons shortcut, options persistence - no owned text, no settings (owner, 2026-09-28; settings_audit above)
session:      local_b1565ae3-2100-4849-b88f-60237d43caed
updated:      2026-10-30 replay-audit: sections 1 to 8 hold (8.m: Mod/ diff since a00034b is Preview.png only), first unfulfilled 9.a captures (993b waiting, 5157 failed), stage unchanged; weak proofs (STATUS.md only): 1.a-1.d, 4.g, 5.g, 6.h, 7.b, 7.c, 8.e; Run-UnitTests n/a (no test csproj); earlier 2026-10-19, shootGallery[1.1.0]: 8.n done, playTests green (cats 10/10, peintres 10/10, 1.7 sans-facultatifs 10/10); Mod/ identical to code_review_sha a00034b (git diff empty)
code_review_sha: a00034b4c2d3acdade8505073c708cd3f7c9f4ea
protocols_read_sha: e840eb6613e0993b602ec887bf79161f55883753
---
# Colorful Coats - Cats and Dogs! Renew — status

## Shotlist v2 2026-10-25 (shootGallery[1.1.0], 9.0)

Plan in the headers of `Tests/Pickle/Mod/Pickle/Features/09-galerie-sanctuaire.feature` (scenes 1-3) and `09b-galerie-soir.feature` (scenes 4-6), commit 90b1970. Story: Nelim pet-sits the neighbours' animals for a day, a new group every few hours, the evening gathers them (white cat of 1 asleep in 6); hours 07, 10, 12, 15, 18, 20, clear sky. Outfit continuity: denim CollarShirt (44,86,140), long loose auburn hair, smile all day; straw hat only in open sun (2, 3, 5), navy Duster added at 20:00 (6). Director pass by an Opus sub-agent kept (stopped haul, mixed followers/staged animals, wide scene 3 at zoom 6, Play_Chess job, Train job, harp, short tick counts); not kept: no animal garments (no animal-apparel mod in the map). Self-score **4/5**. Weak points: forced haul, walk, follow, lies down, Play_Chess, Train and Harp never played in a gallery; scenes 3 and 5 spawn "around" (statue-garden and enclosure cells unsurveyed); coats under low sun and firelight may blur; scene 4 has no fallback pose. Verdict column filled after the run. Owner rule 2026-10-25: outfits and expressions are suggestions (default expression: smile; scene 4 smirk + squint falls back to smile); colonists other than NSB's need special authorization; any particular request goes to NPT, owner arbitrates a refusal.

| # | Scene | a place, hour, zoom | b decor | c living | d Nelim | e action (instant, how) | f composition | g subject | j mod | est | verdict |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | breakfast | sofa-corner 07:00, zoom 5, +45 ticks | 2 daylilies, Kibble, couches, lamps | 5 white cats (coats -1..3), original walks to camera | denim shirt, Long auburn, smile, no hat | carries Kibble west (about to set it down; forced haul, 2 follow, 2 staged) | medium, opening, home posed | white cat, 5 coats | LHAC | 4 | |
| 2 | fetch | right-bank 10:00, zoom 5, +45 | 3 daylilies, log, river | 4 labradors, one runs ahead to camera | same + straw hat | log back from the water (dogs on her heels; haul + 3 follow) | medium, river behind | labradors, 4 coats | Core | 4 | |
| 3 | poodle parade | statue-garden 12:00, zoom 6, +90 | statues, flower field, 1 daylily | 4 poodles in a trail on stone | same + straw hat | strolls east to west (trail just formed; walk + 4 follow) | WIDE, profile | poodles, 4 coats | Stray Dogs | 4 | |
| 4 | chess | cloister 15:00, zoom 3.5, +45 | bonsai, 2 lit torches, 2 daylilies, columns | 3 Yorkshires (-1, 0, 2): one lies, one walks in facing camera, one stands | same, no hat, smirk + squint | plays chess (about to win; Play_Chess forced, sits) | TIGHT, table | Yorkshires, 3 distinct coats | Core | 4 | |
| 5 | evening training | enclosure-south 18:00, zoom 4.5, +45 | yellow grass x2, fence, laying boxes | 4 huskies: one lies tired, two follow, trained one faces camera | same + straw hat | trains a husky at the gate (command just given; Train forced; fallback Hay haul) | medium-tight, low sun | huskies, 4 coats | Core | 4 | |
| 6 | fireside | fire-pit 20:00, zoom 5, +60 | harp, 3 lit torches, bonsai | 4 corgis (original faces camera, one walks in, one lies) + white cat asleep | same + navy Duster, no hat | plays the harp (first notes, corgis gather; plays the instrument) | medium, closing | corgis + cat, same coats by fire | VAE, LHAC | 4 | |

k story written once (headers), sizes 1 medium, 2 medium, 3 wide, 4 tight, 5 medium-tight, 6 medium; opening 1, closing 6. Interface windows: none. Subtitles drafted in the feature headers, to copy into `PUBLICATION.md` "Gallery subtitles" at step 10.

## Audit 2026-10-15

Chain walked again vs current protocols (read in full where changed since `990a7ae7`: AGENTS, AUDIT, GALLERY, STYLE_RIMWORLD, USE_THIS_INSTEAD, README, CICD, scripts). Transitions 1 to 7 hold: 22 functional tests, `Check-Coats`, `Check-PatchFields` (41), `Check-XmlClasses`, `Check-DefRefs`, `Check-TypeRefs`, `Check-Steps` (416 lines), `Check-ModBasics` rerun green. ModIcon weight (38.6 KB) no longer finding: AUDIT 2.c now treats 20 to 30 KB as usual, not threshold (only over 100 KB absurd). `FRENCH_REVIEW.md` regenerated at `254e5b4`, review line stays Virginie's.

`playTests` reopened by cats patch (commit `f9d5dc6` onward: plain `Cutout` shader, darker tints; `a00034b`: shader replacement guarded by `not(alternateGraphics)`, third Siamese tint made distinct). Replayed: cats 10/10, peintres 10/10, every cat `@review` capture read (`docs/runs/2026-10-14-chats-shader.txt`). 8.m code review redone on `db54f23..a00034b` (three findings: unguarded shader replace, About.xml claim it contradicted, two near-identical Siamese tints), all fixed; `code_review_sha` set to `a00034b`. Open before `shootGallery`: 8.n (`Check-Status`, `Mark-ProtocolsRead`, stage change, commit, push). Not defect, owner may judge: maine coon, norwegian forest cat, kijitora vary in browns and tans only.

## Audit 2026-10-10

**Full chain re-audit, 2026-10-11:** transitions 1 to 8 walked criterion by criterion. Found: (2.b) ModIcon derivatives older than `Art/ModIcon-source.png` (2026-10-04); regenerated by `Render-Preview.cjs` after adding `modIconSource` to `Art/Preview.config.json`, so `Mod/About/ModIcon.png`, `Preview.png`, `Art/Gallery/0-preview.png` (same sha256), both `.ico` current. (2.c) icon weight and 32 px reading, see `remaining`. (1.d, 3 to 7) hold. Later stages not yet due: `PUBLICATION.md` still "done, not yet tested" (writeDocs), gallery only `0-preview.png` (shootGallery), `echo_review_sha` and `social_preview_sha256` absent (mountPreview), scenarios file named `FUNCTIONAL-SCENARIOS.md` where 7.a says `TEST_SCENARIOS.md`. Commit touches only derived images under `Mod/About`, no code.

**Code review (8.m), 2026-10-10:** all of `Mod/` (four patches, About.xml; no C#) read by reviewer pass against 22 green functional tests. Two comment inaccuracies found, fixed (greyhound "highest chance", "78 coats" for 78 files); no defect. `code_review_sha` set to fixing commit.

**Update, same day:** Virginie confirmed French review in chat (revision `e5e73bf`, no correction requested; review line of `FRENCH_REVIEW.md` stays hers to fill). `writeTests` exit criteria 7.a to 7.h hold (automated and XML tests rerun green today, translations `not_applicable` justified). Stage now `playTests[1.0.0]`. Next: Pickle tickets for two `unverified` lines, small and targeted.

**Update 2026-10-12:** `08-revue` ticket (34 breeds) passed 34/34 on 2026-10-10, all 34 `@review` captures read: "two `unverified` lines" below no longer stand (scenario 2 verified every breed; scenario 3 already closed by 2bis-a/b/c, removal chain, `32-ajout`). See `docs/runs/2026-10-10-revue.txt`.

**Previous: done (= playTests in new vocabulary). Retained: `localize[1.0.0]`, then `writeTests[1.0.0]` same day once `FRENCH_REVIEW.md` generated (owner request).** HEAD `408a101`, tree dirty: root tidy (`_tools/` -> `scripts/`, scenarios -> `Tests/FUNCTIONAL-SCENARIOS.md`, `.build/` removed, Pickle build intermediates now under `Tests/Pickle/Source/obj|bin`, `.gitignore` `obj/` `bin/`) plus two comment lines in `Mod/Patches/Coats_LetsHaveACat.xml` and `Coats_StrayDogs.xml` and `Mod/ATTRIBUTION.md` (path text only, no patch value). Rerun today from `scripts/`: `Run-Functional-Tests` 22/0/0, `Check-Coats` 41 breeds, `Check-PatchFields` 41 payloads, `Check-XmlClasses`, `Check-DefRefs`, `Check-TypeRefs` all green. `dotnet build` of Pickle steps succeeds with new props.

- **Reason for step back:** AUDIT.md 6.f requires `FRENCH_REVIEW.md` for every mod, even without French; none exists. Not generated by this audit (audit creates nothing to keep a state). Next: run `Make-FrenchReview.ps1 -ModRoot .` (lists English texts, here none), then 6.i.
- **Not verified, not defects:** two `unverified` lines. Protocols read in full later same day (AUDIT, AGENTS, PICKLE, PUBLISHING, TRANSLATIONS, MOD_SETTINGS, STYLE_RIMWORLD, SEARCHING, Ticket Manager WELCOME; WORKSHOP_COMMENTS only by headings, due at `writeDocs`) and marked: `protocols_read_sha` 1405c22.
- **Later, not blocking now:** scenarios file is `Tests/FUNCTIONAL-SCENARIOS.md`, AUDIT.md 7.a names `TEST_SCENARIOS.md`; `Mod/` changed by two comment lines since Pickle passes of 2026-09-28 (patch values byte-identical), so passes still stand but tested tree not byte-identical.

## Audit 2026-10-02 (replaced on 2026-10-10, kept as history)

This section and front matter are current verdict. Section "Ordered workflow audit — 2026-09-13"
below **replaced on 2026-10-02**; kept as history.

**Previous stage: done. Retained stage: done** (`workflow_stage: done`; session title `colorfulcoats.catsanddogs / done`).
Audited HEAD `c52ce5e5714c4e0c2a948df91e648cd5c1de8387`, working tree clean before audit edits
(docs only: `.gitignore`, `CHANGELOG.md`, `TESTING.md`, `Tests/Pickle/README.md`, `docs/`, this file).
Read this time: whole `AUDIT.md`, and documents of `docs/PROTOCOLS-READ.md` at versions it lists.

- **horsMonoRepo ... l10n, preTest:** unchanged, still valid. `Mod/` byte-identical to audited 2026-09-13 patches;
  only `ModIcon.png` (128 x 128) and `Preview.png` (896 x 504, 627 KB, under 1 MB) changed, latter now carrying
  icon cut-out in corner. `Art/Gallery/0-preview.png` identical to `Mod/About/Preview.png` (same SHA256). Both images
  generated by owner's pipeline; audit generated and altered nothing. `localization`, `translation_en`,
  `translation_fr`, `settings_audit` stay `not_applicable` (no owned text, settings, page, shortcut; 2026-09-13
  inventory still holds, patches unchanged).
- **preTest -> done, rerun today, not read from old report:** `scripts/Run-Functional-Tests.ps1` 22 passed, 0 failed, 0 skipped;
  `Check-Coats.ps1`, `Check-PatchFields.ps1` (41 payloads), `Check-XmlClasses.ps1`, `Check-DefRefs.ps1`, `Check-TypeRefs.ps1` all exit 0.
  Pickle suites written, scope justified in `Tests/Pickle/README.md`.
- **done -> tested, criteria added by owner:** (1) no scenario in `@wip`: none (grep over three features). (2) every
  conditional scenario has run: suite carries no `@requires`; three pass maps stage optional mods, each pass played
  in full (10 + 18 + 10 = 38, `exitReason: passed`, `setName` read), no declared incompatibility to look at.
  (3) no manual test left to validate: eight manual scenarios mapped against green runs in `TESTING.md`; six
  automated and green or not a test, **two parts remain** (listed in `remaining`).
- **Git hygiene:** no `.dds` file anywhere in repository or history; `*.dds` added to `.gitignore`. No Pickle evidence
  ever tracked (`Tests/Pickle/Evidence/` and `evidence/` ignored). Evidence minified on disk, see `docs/runs/2026-10-02-evidence-minified.txt`.
  `pickle-reports-archive/`: no archive of this mod's runs, nothing to delete.
- **Upstream:** no git repository for purpleyam's original (searched again, only this mod's own Renew repositories). No PR possible;
  `upstream_mod_remotes: N/A`. Sibling port `Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew` is ours, not upstream.
- **0.1.0:** `About/PublishedFileId.txt` exists (3806769444), committed in `97c19d3`. `CHANGELOG.md` carries `## [0.1.0]`, "creation of a publishIdFile",
  under `[Unreleased]`. Item created from commit before `97c19d3`, still shows old packageId and stale `loadAfter`
  until next upload. Prepublication is act, not state: does not change `stage`.

**Not verified, not defects:** two `unverified` lines. No game or visual check claimed beyond what `docs/runs/` records.
**Strictly necessary for `tested`:** close those two lines, each by played Pickle scenario or owner declaring not applicable with reason.
**Optional:** icon busier than STYLE_RIMWORLD.md's one-mascot model (2026-09-13 note, owner decides); `PUBLICATION.md` does not exist yet,
due at `tested -> prepublished`.


## Documentation corrections — 2026-09-13

Based on revision `590199c1cf497216a5ce5a437062bb411ec96989`, corrected README.md
and Mod/About/About.xml to distinguish successful automated/XML checks from
still-pending final functional validation in game. Replaced bare repository URL
in description with prescribed Steam-formatted Source code on GitHub link
at end, matching existing metadata URL and configured origin.

Both documentary findings in audit below resolved; original entries
remain as history. Parsed edited About.xml, checked final link and target,
ran `git diff --check`. Only README.md, About.xml description, STATUS.md changed.
Patches, images, packageId, load order, supported versions unchanged, so
earlier independent technical validations still apply. Stage remains done;
no game test, Steam page update or publication claimed.

## Ordered workflow audit — 2026-09-13 (replaced on 2026-10-02, kept as history)

This section and front matter are current verdict. Earlier entries below are
historical evidence, preserved verbatim, including original language and limitations.
User's supplied workflow takes precedence over four parent protocols, all read
for this audit: PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md, TRANSLATIONS.md.

**Previous stage: done. Retained stage: done.** Here `done` maps literally to
user's eighth transition: ready for final functional validation in game, not already
validated in game. No shorthand mapping to `tested` or `published` intended.

### Scope and revision

- Autonomous repository: `C:/Users/nelim/Documents/rimworld/ColorfulCoatsCatsAndDogsRenew`.
  Distributed folder: its `Mod/` subdirectory, nine files. No source,
  test tool, build intermediate or Art source distributed.
- Audited HEAD: `e56942774364cf05cd43134e97b07af06d9bb6c9`;
  delivered Git tree: `fbd162c22db346a46a6b053ea0aa0ca85c98152d` (`HEAD:Mod`).
  Working tree clean before audit. Only STATUS.md edited by audit;
  delivered files, existing tests, illustrations, historical results preserved.
- Live read-only GitHub checks: `gh repo view ... --json name,visibility,url,defaultBranchRef`
  returned PUBLIC, expected repository, branch main; `git ls-remote origin HEAD`
  returned audited HEAD. Initial sandbox access failed; permitted read-only
  retry succeeded. Remote and first pushed commit established, not inferred
  from this status card. No commit, push or publication performed.
- Installed game: RimWorld `1.6.4871 rev590`. Assembly-CSharp.dll SHA256:
  `5CF1B5BE399D5B1C9C56CA72C9D35B4ECF307FEACF5859D04AC5A1AA5926356A`.

### Transitions, in order

| Transition | Result | Evidence and scope |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Independent Git root and live public GitHub repository, matching pushed HEAD; coherent folder/repository/packageId/name; initialized English README, attribution, licence, changelog. Root/distributed LICENSE and ATTRIBUTION copies identical SHA256 hashes. |
| horsMonoRepo -> ModIcon generated | Validated; build not applicable | Four XML patches are complete implementation; no assembly or build project. Delivered ModIcon readable PNG, 128 x 128, 36,734 bytes, directly inspected. No unimplemented feature identified. |
| ModIcon generated -> Preview generated | Validated | Delivered Preview directly inspected: PNG, 896 x 504, 506,910 bytes, below both 900 KiB and 1 MB. |
| Preview generated -> preOptions | Validated | English description and preview; coherent Renew/unofficial naming. Green accent distinct from golden secondary ink at full size and existing 268 px thumbnail. `and` uses reduced primary lettering; `Renew` reduced secondary lettering; unofficial own tag line. No clipping, overlap or concrete camera defect observed. |
| preOptions -> options | Not applicable, justified; gate passed | Settings inventory below establishes no useful settings contract, empty page or MainButtons shortcut. Applicable technical tests passed. No interactive test required for this gate under supplied workflow. |
| options -> l10n | Not applicable, justified; gate passed | All 41 payloads contain numeric chance/RGB values only; no owned visible text or translation targets. English and French resources unnecessary. |
| l10n -> preTest | Validated | Only native PatchOperationConditional/Add types; optional animal/coat mods are loadAfter entries, not hard dependencies. All 41 targets checked against installed 1.6 content. No local LoadFolders, MayRequire or third-party type. |
| preTest -> done | Validated | Existing scenarios 0-7 supply setup, actions, expected outcomes; automated and XML suites rerun successfully against unchanged delivered files. |
| done -> tested | Not verified | No game session or Player.log review performed. Written scenarios, including new/existing saves and applicable EN/FR passes, remain to execute. |

Public/silent decision retained from detailed 2026-09-12 rights investigation
in this file and ATTRIBUTION.md, not newly certified by online licence investigation
today. Evidence dated, could change. MIT explicitly covers this repository's
contributions, does not grant rights over purpleyam's name or measured palette;
no third-party licence invented. Unofficial notices match recorded decision.

### Settings and localization inventory

Reviewed every distributed XML and full file inventory, not only searches for C#.
Only injected fields: `alternateGraphicChance`, `alternateGraphics`, `li`, `color`:
4 Core + 11 Let's Have a Cat + 19 Stray Dogs + 7 VAE operations, zero unexpected leaves.
Classes are native patch operations, no inherited settings provider or UI Def.
No MainButtonDef, settings class, empty settings page, configurable UI, user-input
validation, settings serialization, translation key, label, description or grammar payload.

Probabilities and palettes are fixed content choices per breed. Documented
purpose: fill missing coats automatically while deferring to existing coat lists;
no user configuration task or XML-editing setup promised. Exposing each colour/chance
would invent settings feature for this audit. Therefore settings_audit is not_applicable.
Application through XML patch loading; scope is active mod list, no owned
settings state to save, migrate or reset. RIMMSQOL and other customization integrations
not tested, not claimed; shortcut and settings persistence tests have no target.

Animal text remains owned by Core/optional animal mods, unmodified. About
metadata and repository documentation follow English publishing policy, outside
in-game translation gate. Keyed parameters and DefInjected paths have no targets, so no
empty language folders or redundant English translations required. General EN/FR game
regressions remain part of final game pass; upstream translation completeness not
certified. Previous localization result independently re-established after settings.

### Executed checks and observed results

All commands below used Windows PowerShell with `-NoProfile -ExecutionPolicy Bypass -File`.

| Script and arguments | Observed result |
| --- | --- |
| `scripts/Run-Functional-Tests.ps1` | Exit 0; 22 passed, 0 failed, 0 skipped. Real game patch engine on 41 breeds; all 41 existing-coat guards and absent targets; native field readers; all 17 source-derived tints; packaging and load order. |
| `scripts/Check-Coats.ps1` | Exit 0; 19 + 11 + 7 + 4 breeds checked successfully. |
| `scripts/Check-PatchFields.ps1` | Exit 0; all 41 payloads extracted, including nested fields; no unknown 1.6 field. |
| `../scripts/Check-XmlClasses.ps1 -ModPath Mod -TypeLists ../rw16_types.txt` | Exit 0; both referenced types resolve. Native types also exercised by functional suite. |
| `../scripts/Check-DefRefs.ps1 -ModPath Mod` | Exit 0; XML well formed; no unresolved or mistyped Def reference/parent. No owned Defs; checker does not establish XPath target coverage. |
| `../scripts/Check-TypeRefs.ps1 -ModPath Mod` | Exit 0; five XML files, zero unguarded third-party types. |

Additional direct XML checks verified all payload leaf values and installed packageIds:
Qux.stray.dogs (3549460027), akairo.LetsHaveaCat (3682940618), and
VanillaExpanded.VanillaAnimalsExpanded (2871933948), each declaring 1.6. Inspected their
LoadFolders: root plus 1.6 where applicable. Separate current-version target inventory
confirmed all 37 optional animals in those active Defs folders and all four Core animals,
none with existing coat list. First Core collection hit abstract nodes without
defName; corrected `/Defs/PawnKindDef[defName]` collection rerun successfully.
Audit-helper issue, not mod failure. Conditional upstream prosthetics and
VAE non-Odyssey folders do not supply animal targets checked here.

Limits: functional suite reconstructs patch objects and gathers source Defs; not
full mod loader, XML inheritance resolver, Unity renderer or game UI. Colour
parser check mirrors native rule under .NET Framework. Generic existing-coat fixtures
and sibling VAE coat-list comparison passed; actual combined in-game sessions with
Erin's Cats, Animal Variety Coats and sibling Renew mod not run. No mutation
campaign rerun today; earlier mutation results remain historical.

### Findings outside the next functional transition

- Confirmed publishing-description discrepancy: About.xml contains bare GitHub URL
  instead of final `[url=...]Source code on GitHub[/url]` required by PUBLISHING.md.
  URL correct and live. Fix presentation before publication; not additional gate
  in user's explicit preOptions criteria.
- Confirmed evidence discrepancy: README.md and About.xml say "under human direction
  and in-game testing", while TESTING.md and historical results say game tests not
  executed. Reconcile wording before publication; not proof of successful game test
  or gameplay defect.
- Optional visual recommendation: icon surrounds clear orange mascot with many
  cat/dog faces, busier than STYLE_RIMWORLD.md's single-mascot/one-or-two-object model.
  Simplifying surround would better match style. Workflow's explicit PNG
  dimensions/format gate met; no image generation or change made for this audit.
- Historical French audit notes preserved as requested. Current audit and
  initialized public-facing documents in English.

### Strictly necessary next transition

To reach tested, execute scenarios 0-7 in RimWorld 1.6, record actual results and inspected
logs, cover new colony and existing save, add/remove and save/reload, inspect
nineteen Stray Dogs coats and other targeted animals, run applicable EN/FR regressions.
Test named optional coat integrations in game; resolve actual failures, rerun only
affected regressions. No settings page, MainButtons shortcut or translation resources need
creating. Missing game results remain unverified, not confirmed defects.

Status card, read by pass over every mod rather than asking each thread one at a time. Lives
at root, never inside `Mod/`, so Steam never receives it.

Fields above read off disk on 2026-09-12. Four cannot be, wait on
session holding this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from session group where one exists; confirm it.
- **`tested_on`** — date of last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in About's
  `modDependencies`, `to check` when non-vanilla `loadAfter` suggests undeclared dependency,
  `none` when mod needs nothing. Undeclared dependency not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  class it injects belongs to mod not declared and not loaded.
- **`remaining`** — what is left, three kinds: `feature` for something missing from first
  release, `defect` for known fault left unfixed, `unverified` for what could not be checked.
  Line already there true of nearly whole repository; replace once it stops being.

`licence` vocabulary: `open` explicit licence, `silent` no licence and dead source,
`alive` no licence but living source, `forbidden` written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Verification du 2026-09-12

- Titre : `Colorful Coats - Cats and Dogs! Renew (unofficial)`. Suffixe
  `(unofficial)` deja present, coherent avec absence d'accord explicite
  indiquee dans attribution ; aucun suffixe supplementaire a ajouter.
- Description : lien GitHub present dans texte de `Mod/About/About.xml`
  et dans son champ `url`, identique au depot configure comme remote `origin`.
- Tests manuels : huit scenarios (0 a 7) dans `Tests/FUNCTIONAL-SCENARIOS.md`,
  avec procedures et resultats attendus. Restent a executer en jeu ;
  `tested_on` reste vide.
- Tests automatises : `scripts/Run-Functional-Tests.ps1` execute aujourd'hui :
  **22 reussis, 0 echec, 0 ignore**. 41 races testees avec moteur
  de patch du jeu, y compris animaux deja pourvus de robes et cibles absentes.
- XML : `Check-XmlClasses.ps1`, `Check-DefRefs.ps1`, `Check-TypeRefs.ps1` reussis
  sur `Mod/`. `scripts/Check-PatchFields.ps1` valide aussi champs
  des 41 blocs injectes contre assemblage 1.6 : aucun champ inconnu.
  Controle des references de defs general ne valide pas cibles XPath ;
  couverture vient de suite fonctionnelle.
  `Check-Coats.ps1` reussi aussi : 19 + 11 + 7 + 4 races verifiees.
- Licence de nos contributions : **MIT**, texte dans `LICENSE` et `Mod/LICENSE`.
  Champ `licence: silent` conserve statut de source purpleyam consigne
  dans attribution, sans pretendre lui attribuer licence MIT. Statut
  reverifie en ligne ensuite ; voir preuves et limites ci-dessous.

## Reverification de silent — 2026-09-12

- Fichiers installes de `2388932599` : aucun fichier de licence ; `About.xml`
  existe, declare 1.2 et 1.3, sans licence ni URL de depot. Aucun avis de
  permission ou refus trouve dans fichiers XML/TXT. Ancienne formulation
  « no About.xml » incorrecte : mention de licence manque.
- [Page originale](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599) :
  aucune licence ni consigne de redistribution trouvee dans description et
  commentaires affiches. Description et commentaire de purpleyam du
  29 octobre 2022 renvoient explicitement vers successeur officiel.
- [Successeur de purpleyam](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130) :
  aucune licence trouvee dans description. Derniere mise a jour affichee :
  octobre 2022, version declaree jusqu'a 1.4 ; reponse de l'auteur visible en
  novembre 2023. Utilisateurs le signalent fonctionnel en 1.6 en 2025.
- Verification directe dans navigateur : 20 commentaires du mod original
  et 31 du successeur lus, toutes pages comprises. Aucune permission
  de reprise ni interdiction trouvee. « you can use both » de fevrier 2021
  concerne compatibilite avec Animal Variety Coats, pas redistribution.
- [Historique du successeur](https://steamcommunity.com/sharedfiles/filedetails/changelog/2398446130) :
  cinq entrees lues ; aucune mise a jour apres octobre 2022.
- [Profil public](https://steamcommunity.com/profiles/76561198342847927) consulte
  avec succes : aucune consigne generale de reutilisation ni annonce d'abandon.
  Six publications publiques ne comprennent pas d'autre successeur annonce.
- Recherche de depot amont effectuee : liens pages Steam, profil public,
  champ URL du About.xml, recherches web par auteur, titre et packageId,
  puis recherche directe GitHub sur "Colorful Coats". Quatre resultats
  GitHub sont depots Renew de vbardales, pas depots de purpleyam.
  Aucun depot amont trouve ; aucun README amont ne peut donc etre annonce
  comme lu. Ne prouve pas qu'un depot non indexe ou prive n'existe pas.
- Decision : `silent` confirme selon critere precise par l'utilisateur :
  **source abandonnee = pas mise a jour en 1.6**. Original declare au plus
  1.3 et successeur officiel au plus 1.4. Aucune licence ni autorisation
  trouvee dans sources consultees. Suffixe (unofficial) conserve.
  Ancien raisonnement fonde sur temps ecoule et reponses de l'auteur
  retire : ces elements ne determinent pas cette classification.

## Procedure de verification

1. Verifier si source mise a jour en 1.6 : sinon, abandonnee
   au sens de cette classification, sans condition d'anciennete ou d'activite.
2. Lire fichiers de licence, About.xml, README et autres documents textuels
   de la source ; lire aussi description Steam et commentaires de l'auteur.
3. Chercher activement depot amont, meme si About.xml n'en lie aucun : liens
   Steam/profil et recherche par titre, auteur, packageId ou identifiant Workshop.
4. Si depot trouve, verifier rattachement a l'auteur et lire son
   README, licences et autres documents textuels pour permissions
   et restrictions. Ne pas confondre nos depots Renew avec source amont.
5. Consigner liens, permissions et portee, ou absence de resultat.
   Pas de 1.6 et aucune licence/permission trouvee : silent. Source en 1.6 sans
   licence/permission : alive. Licence ou permission explicite doit etre
   examinee avant classer ; interdiction ne devient pas silent.

## Preview overlay recomposed — 2026-09-12

> Historical. On 2026-10-02 files named below (`Art/preview.html`, `render-preview.cjs`, `preview-palette.json`,
> `preview-qa.json`, `preview-copy.json`, `Preview-layout.html`, `Preview-unofficial-source.png`, `Art/Preview.png`,
> QA images) replaced by `Art/Preview.config.json` and shared renderer; see "Preview source migration" at end of file.
> To re-render, run `node ../scripts/Render-Preview.cjs` from this folder, not `node Art/render-preview.cjs` quoted below.

- Source illustration: `Art/Preview.png`, copied unchanged from existing
  text-free `Art/Preview-source.png`. No illustration generated or replaced.
  Earlier generated lettering variant remains in `Art/Preview-unofficial-source.png`
  for reference, not used as composition background.
- Delivered image: `Mod/About/Preview.png`. Composition: `Art/preview.html`;
  palette (single colour source): `Art/preview-palette.json`;
  reproducible renderer and measurements: `Art/render-preview.cjs` and
  `Art/preview-qa.json`. Run `node Art/render-preview.cjs`; set
  `PREVIEW_NODE_MODULES` if bundled Playwright/sharp modules live elsewhere.
- Veil: dark, slightly desaturated wood tone from broad plank floor.
  Vivid accent: green foliage of two potted plants in source, brightened and saturated for
  divider and badge. Secondary ink: dominant warm ochre family of
  floorboards, lightened while retaining golden colour for tag and Renew suffix. Foliage green separates accent from this dominant warm ochre family; significant repeated scene detail, not isolated pixel.
- Actual platform fonts verified through Chrome: Segoe UI Semibold for
  46 px title, Segoe UI regular for tag and summary, Segoe UI Bold for version.
  Renderer waits for `document.fonts.ready` and image decoding before capture.
- Existing name and summary preserved. Strong words use 46 px; and and Renew use direct 0.65em spans (29.9 px), all weight 600. Connector keeps primary ink, Renew uses secondary ink. Unofficial status tag remains on own line.
  Badge version read from highest stable supportedVersions in delivered
  About.xml (currently 1.6), with prescribed triangle and rotated numerals.
- Rendered at 896 x 504, then visually checked at 268 px wide
  (`Art/preview-268.png`): title and version identifiable, divider visible,
  no text clipping or overlapping text blocks; reduced title words readable, green accent distinct from golden secondary ink. Summary remains intended for
  full-size preview, as guide specifies.
- Minimum WCAG contrast over every pixel of each text block's background
  rectangle, captured with lettering hidden: title 4.92:1, connector 12.31:1, Renew 7.60:1, summary 6.82:1,
  tag 8.06:1. Badge digits against opaque accent: 9.35:1.
  Background-only proof: `Art/preview-background-qa.png`.
- Final file: 506910 bytes, below 900 KB. No Steam publication performed.

## Translation audit — 2026-09-13

Applied translation gate from parent workspace's `PUBLISHING.md` and
`TRANSLATIONS.md` to revision `7cd437a7b854eb7e0e69a9bceb7a4b9a5bd00668`.
Published content unchanged during audit.

- Inventory: all files under `Mod/`, including `About/About.xml` and all four
  conditional patch files. `rg --files -g '*.cs' -g '*.dll' -g 'LoadFolders.xml'
  -g '*.xml'` found only About XML and those patches: no C# source, assembly,
  alternate load folders, owned Defs or language resources.
- Parsed each patch with PowerShell's `[xml]` and enumerated `//value//*` and
  `//value//*[not(*)]`. 41 payloads (Core: 4, Let's Have a Cat: 11,
  Stray Dogs: 19, Vanilla Animals Expanded: 7) contain only
  `alternateGraphicChance`, `alternateGraphics`, `li` and `color`.
  Every leaf numeric probability or RGB tuple; zero unexpected fields or
  values. All four XML files parsed successfully.
- No patch adds or changes labels, descriptions, UI, grammar or generated text.
  XPath defNames and patch control values internal identifiers, not displayed
  strings. Coat names appear only in XML comments. Animal names and descriptions
  remain owned by Core or corresponding optional animal mod, untouched here;
  no translation keys reused or introduced by this mod.
- About metadata, preview/icon lettering, licences and attribution are
  publication material outside in-game translation gate. Remain English
  under publishing policy. Development tools and Art sources not shipped.
- Result: `localization`, `translation_en` and `translation_fr` all
  `not_applicable`, because complete inventory found no owned player-facing
  text to translate. No empty language folders or duplicate upstream translations
  needed. DefInjected path validation and language-specific UI checks have no
  targets in this build; upstream language coverage not certified by audit.
- No in-game test performed. Existing gameplay checks in `remaining` and
  historical `stage` preserved. Reopen affected translation fields as
  `unchecked` after changes to patches, Defs, UI code or language resources.


## Preview source migration — 2026-10-02

Copy, typography, layout, palette consolidated in `Art/Preview.config.json`. Canonical inputs: `Art/Preview-source.png`, `Art/echo.png`, `Art/ModIcon-source.png`; shared renderer writes temporary diagnostics under ignored `Art/.render/`. Existing distributed Preview, gallery, ICO outputs preserved because present and coherent; no render run for this migration. Superseded JSON files and generated QA intermediates removed. Nothing published.
