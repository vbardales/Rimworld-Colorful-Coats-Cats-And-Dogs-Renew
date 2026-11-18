---
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
settings_audit: not_applicable
mod:          Colorful Coats - Cats and Dogs! Renew (unofficial)
packageId:    nelim.colorfulcoats.catsanddogs
repo:         Rimworld-Colorful-Coats-Cats-And-Dogs-Renew
remote:       https://github.com/vbardales/Rimworld-Colorful-Coats-Cats-And-Dogs-Renew.git
visibility:   public
detached:     yes
workflow_stage: settings[1.1.0]
audit_revision: a00034b4c2d3acdade8505073c708cd3f7c9f4ea (2026-10-15, chain 1 to 7 walked again, 8.a to 8.m below)
audit_date: 2026-10-15
automated_tests: passed; 22 passed, 0 failed, 0 skipped (rerun 2026-10-15, from scripts/)
xml_tests: passed; Check-Coats, Check-PatchFields (41), Check-XmlClasses, Check-DefRefs, Check-TypeRefs (rerun 2026-10-10)
licence:      silent
licence_own:  MIT; LICENSE and Mod/LICENSE; covers this repository's contributions, not purpleyam's name or measured palette
licence_at:   checked 2026-09-12; source not updated to 1.6 (original 1.3, series sibling VAE 1.4); no licence or permission found in source files, Steam descriptions and all comments; upstream repository searched but not found
upstream_mod_remotes: N/A (no git repository found for purpleyam's "Colorful Coats - Cats and Dogs!", Workshop 2388932599; searched again 2026-10-02, only this mod's own Renew repositories come up)
dependencies: none (checked 2026-11-19 at 11ac030: About.xml has no modDependencies, no incompatibleWith, no loadBefore; loadAfter = Ludeon.RimWorld, Qux.stray.dogs, akairo.LetsHaveaCat, VanillaExpanded.VanillaAnimalsExpanded, nelim.colorfulcoats.vae, Erin.Cats, cucumpear.azrael.varietycoats, order only; every patch guarded by PatchOperationConditional on the target def; no LoadFolders.xml, no DLC branch, no MayRequire; supportedVersions 1.6 and 1.7; Check-OptionalCompat 0 targets, 0 declared, OK; sibling nelim.colorfulcoats.vae does not name this mod, no cycle; 4.f n/a, the mod adds no animal)
workshop_required_items: n/a, no hard Workshop dependency (modDependencies none), checked 2026-11-19
showcase:     complete
tested_on:    2026-10-15 (cats replay rev a00034b: 10/10 and peintres 10/10, docs/runs/2026-10-14-chats-shader.txt; before that 2026-10-10 (Pickle 08-revue, 34/34 passed in the WSL, rev 58bcd23; passes 1-3 and add/removal runs on 2026-09-28 and 2026-10-02; no manual play))
tested_1_7:   yes
workshop:     3806769444 (0.1.0, item creation only; About/PublishedFileId.txt committed in 97c19d3; private, as Steam creates every item; not tested, not public)
remaining:
  - 2026-11-18 cleanUp[1.0.0]: 14.a done, seven noreg tickets green on v1.0.0 (Mod/ = tag 9083b73), line per ticket in docs/runs/2026-11-18-noregression-v1.0.0.txt; published, public, gallery uploaded, thanks and Use This Instead comments posted (history: docs/runs/2026-11-18-status-history.md and -2.md). Owner: "on passe en 1.1.0": next version 1.1.0 carries the 1.7 pass (tickets avec-cibles and avec-peintres in 1.7; 01-sans-facultatifs already green in 1.7, docs/runs/2026-10-18-1.7-sans-facultatifs.txt; 1.7 NOT yet in supportedVersions). 1.7 status: ALL GREEN, tested_1_7 yes: sans-facultatifs (2026-10-18), avec-cibles 4ca6 52/52, avec-peintres 9a70 10/10 (refile of 309f, 2026-11-18, docs/runs/2026-11-18-1.7-avec-peintres.txt, evidence Tests/Pickle/Evidence/v17-peintres). Next: the 1.1.0 publication gesture, one commit (<li>1.7</li> in supportedVersions, CHANGELOG, Preview redo with 1.7 badge, tag 1.7).
  - 2026-11-19 1.1.0 gesture done in 9fa977c: `<li>1.7</li>` in supportedVersions, CHANGELOG `## [Unreleased]` (3.c done), Preview redone with the 1.7 badge (checked: echo, title, badge clear), Art/Gallery/0-preview.png byte copy, GitHub social preview uploaded (sha256 recorded). code_review_sha moved to 6213dba: revue du diff : images et texte seuls (Mod/ since 6476e28 = About.xml supportedVersions, Preview.png, ATTRIBUTION.md copy; AUDIT.md 8.m exceptions). echo_review_sha INFO stale kept: only the renders changed, echo-source.png untouched, for Virginie to see. 3.d done 2026-11-19: stage now declareDependencies[1.1.0]; walk on (section 4 to 14) to publish (version 1.1.0, tag 1.7 minor, update_tags=true).
  - not applicable: French pass and interface check in EN/FR, MainButtons shortcut, options persistence - no owned text, no settings (owner, 2026-09-28; settings_audit above)
session:      local_b1565ae3-2100-4849-b88f-60237d43caed
updated:      2026-11-19 settings[1.1.0]: 4.h passed (dependency record 0f6ed0f); declareDependencies: 3.d passed after the 1.1.0 gesture (9fa977c); audit replay, first open 3.c (CHANGELOG [Unreleased]); remote field added; 2026-11-18 1.7 avec-peintres 9a70 GREEN 10/10; all three 1.7 sets green, tested_1_7 yes; next the 1.1.0 publication gesture
code_review_sha: 6213dbaa4aad79e4ca724bec67fa977d7a5532a5
publication_changelog_review_sha: 0c6021be5d0a30b4cabcfe510af53c83b1b8d716
thanks_drafted_line: 1.0
echo_review_sha: a0366588bcd4f511c48099c1178abe1d5ee36106
social_preview_sha256: 510e78e7ff1c39b069f4f10dbb40b8d82dd6bee010f8de32fdbb3130b044bd8e
protocols_read_sha: 573966f1e6f13193426a0a73ac58be02e39e6ed5
---
# Colorful Coats - Cats and Dogs! Renew — status

## Ecosystem (PiI rerun 2026-11-15, docs/inventory/ecosystem-steam/ColorfulCoatsCatsAndDogsRenew.md, b0a2f19)

Original 2388932599 (purpleyam, dead on 1.3, no Languages folder, no licence line). No duplicate, fork, replacement, patch, retexture or separate translation found (18 queries x 2 pages, 805 items). Series siblings: VAE 2398446130, Megafauna 2560113727, Dodos 2388053651. Neighbour: Animal Variety Coats 1511926373 (alive). Verdict: continue. Translations to integrate at localize: none. `ecosystem-links` block asked from PiI 2026-11-17. VAE commenter point (tigers and badgers moved to Odyssey): checked 2026-11-17, grep of Mod/Patches finds neither kind, this mod does not patch them (VAE patches cover only the seven breeds in the description).

## History

Older audits (2026-10-15, 2026-10-10, 2026-10-02, 2026-09-13), the verifications of 2026-09-12 (silent licence), the Preview overlay and source migration, the translation audit: moved on 2026-11-18 to `Docs/runs/2026-11-18-status-history.md` (old text stays in git).
