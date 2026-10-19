# Workshop gallery, shotlist of 2026-10-20 (shootGallery[1.1.0]). It replaces 07-galerie.feature (old fixture, a row of animals
# facing the camera: a catalogue plate), which is deleted once the new images are accepted. NO SCENARIO IS WRITTEN YET:
# the owner reads this plan first; a scenario that is not in it is not written (AUDIT 9.0, GALLERY.md "Shotlist").
#
# THE STORY. "One day at the sanctuary." Nelim, alone in her sanctuary, is visited all day by animals of the neighbouring farms.
# Each visit is one scene: the animals arrive in the coats this mod gives them, and she does one small thing with them. The
# series shows the mod's four sources: the base-game pets (Labrador, Yorkshire terrier, Husky), Let's Have a Cat! (white cat,
# five coats), Stray Dogs (standard poodle, four coats), Vanilla Animals Expanded (corgi, three coats).
# Rhythm of time: one hour per scene, 07, 10, 12, 15, 18, 20, clear sky all day (no weather step; I set the hour to N first, then
# 60 to 120 ticks for set-up, the game paused before the capture, animals and pawn placed AFTER the wait so nothing drifts).
# Nelim is the protagonist. Her outfit changes in every scene (colours named below), hats only on long loose hair with Show Hair
# Under Stuff (3255379190) in the map; her own face (smirk smile, two brows) is the default, set last before the capture.
#
# MAP (wsl-deps.sanctuary.map of this mod, to write): the Sanctuary map as base, nothing challenged (copy of
# FoxLampRenew/Tests/Pickle/wsl-deps.sanctuary.map, with its seeds under Tests/Pickle/config/sanctuary/), plus
# nelim.sanctuarybacklot path (steps "Nelim's Sanctuary:"), Qux.stray.dogs 3549460027, akairo.LetsHaveaCat 3682940618,
# OskarPotocki.VanillaFactionsExpanded.Core 2023507013, VanillaExpanded.VanillaAnimalsExpanded 2871933948, then this mod last.
# Steps, all existing: Given the save "Nelims-tribe" is loaded; I set the hour to N (Pickle); an adult animal of kind "K" named "Y"
# is spawned at (x, z) (ScreenshotStudio); the animal "Y" is given coat N (CoatSteps); the animal "Y" stands at (x, z) facing
# south (ColonistRace); "Nelim" wears "<def>" dyed rgb (...), hairstyle is, hair colour is rgb, carries the item (ColonistRace);
# I place the decor "<def>" at (x, z) [fully grown], is lit, the decor is removed (StageDecor); the other colonists are out of
# frame; studio presentation mode; the painted zones are hidden; Nelim's Sanctuary: Nelim has her own face.
# Placement: "N adult animals of kind K are spawned around (x, z)" (CoatSteps: a clear 3 by 3 around each, within 16 cells)
# then "stands at" to pose, so no hand-picked cell can be occupied. Coat indices: -1 is the original, 0.. follow the patch order.
#
# SHOTLIST (index, file, place, hour, subject, composition, living things, decor, risk and plan, estimate, subtitle)
#
# 1 workshop-1-breakfast. sofa-corner (zoom 4.5, camera on (186, 122)), 07:00, clear, +60 ticks. Subject: the white cat of
#   Let's Have a Cat! (akaNEKO_shironeko) in its five coats (coats -1, 0, 1, 2, 3, i.e. original, peach, steel blue, grey, fawn;
#   the ink coat 4 is kept for a close shot if needed). The image says: five coats of one cat share one breakfast.
#   Composition: loose group at three depths, never a row. Two cats in the foreground on the parquet (z 120-121) facing south,
#   two on the couches (z 122), one by the armchair; Nelim off-centre right at (188, 124) facing south, between the bookcase
#   and the armchair; lit by the two torch lamps of the corner. Nelim: teal Apparel_Robe dyed rgb (24, 92, 104), hairstyle
#   Long, hair colour (86, 52, 34), carries Kibble, smirk smile. Decor: Plant_Daylily fully grown at (183, 123) and (190, 123),
#   Kibble on the floor at (185, 121); all removed after. Mods: LHAC. Risk: a tint on the white cat reads weakly on the rose
#   carpet. Plan: read the capture; swap the weakest coat for the ink one, or move the two foreground cats to the dark
#   parquet (x 180-184, z 122). Estimate 4. Subtitle: "Breakfast for five: one white cat, five coats."
#
# 2 workshop-2-fetch. right-bank (zoom 9, camera on (146, 131)), 10:00, clear, +120 ticks. Subject: Labradors (Core pets; coats
#   -1 original, 0 chocolate, 1 yellow, 2 black). The image says: a river bank, three coats of labrador and one stick.
#   Composition: Nelim in the left third at (144, 131) facing east, a log in her hand; one dog in the foreground facing the
#   camera, two near the water, one in the shallows at the edge; the river (deep water, reeds) as background; late-morning
#   light. Nelim: straw Apparel_CowboyHat dyed rgb (214, 174, 92) over long loose hair, hair colour auburn (122, 58, 34),
#   Apparel_CollarShirt dyed rgb (44, 86, 140), MouthSmile and LidCheerful. Decor: Plant_Daylily fully grown x3 on the bank;
#   the log is carried (WoodLog), nothing else. Risk: the bank cells are unknown, a dog may spawn in deep water or leave the
#   frame. Plan: spawn "around" so the step fails loudly on a bad cell, then pose with "stands at"; frame the rectangle of
#   the group and Nelim; fall back to left-bank. Estimate 4. Subtitle: "Fetch by the river: four labradors, one log."
#
# 3 workshop-3-poodle-show. statue-garden (zoom 7, camera on (155, 97)), 12:00, clear, +120 ticks. Subject: Stray Dogs standard
#   poodles (SCStandardPoodle, coats -1 original, 0 apricot, 1 chocolate, 2 ink, 3 champagne; we take the original, chocolate,
#   ink and champagne). The image says: four poodle coats against grey stone and yellow flowers.
#   Composition: each poodle beside a different statue at a different depth (foreground ink poodle, centre-left, facing the
#   camera; chocolate by the big statue; champagne and original at the far bench); Nelim stands in the yellow flower field in
#   the background, off-centre left, offering a treat. Nelim: cream Apparel_Flophat dyed rgb (240, 234, 214) on long loose hair,
#   hair colour black-brown (40, 30, 28), burgundy Apparel_Cape dyed rgb (122, 28, 48), raised brows and MouthSmile.
#   Decor: Plant_Daylily fully grown x4 at the foot of the statues, SculptureSmall x2 at the poodles' side; removed after.
#   Mods: Stray Dogs. Risk: the poodle sprite is small and statues are crowded. Plan: zoom 7 and the framing rectangle of poodles
#   plus Nelim; spawn around the statue cells so the step fails loudly on an occupied cell; read the capture. Estimate 4.
#   Subtitle: "Four poodles tour the statue garden."
#
# 4 workshop-4-chess. cloister (zoom 6, camera on (176, 130)), 15:00, clear, +120 ticks. Subject: Yorkshire terriers (Core pets,
#   coats -1 original, 0 steel blue, 1 taupe, 2 oatmeal). The image says: three tiny coats under the chess table.
#   Composition: low wooden gallery, columns as frame; Nelim at the chess table (172, 126) at the left, hand on the board;
#   two Yorkshires at her feet facing the camera, one on the kneeling pillow (173, 126), one in the foreground right near a
#   column; warm light through the colonnade. Nelim: mustard Apparel_Jacket dyed rgb (196, 150, 40), hairstyle Ponytails (her
#   canon high ponytail, no hat), hair colour chestnut (110, 60, 40), LidSquinting for a thinking look. Decor: PlantPot_Bonsai
#   at the table, Plant_Daylily fully grown x2 against the columns, TorchLamp x2 lit; removed after. Mods: none beyond Core.
#   Risk: Yorkshires are tiny (small sprite). Plan: zoom 5 tight on the table, three dogs close to the camera; if still too
#   small, add the second Yorkshire coat only. Estimate 4. Subtitle: "A game of chess, watched from below."
#
# 5 workshop-5-dusk-huskies. enclosure-south (zoom 11, camera on (149, 214)), 18:00, clear, +120 ticks. Subject: Huskies (Core
#   pets, coats -1 original, 0 ice blue, 1 coffee, 2 oatmeal). The image says: low sun, four husky coats at the gate.
#   Composition: Nelim at the gate (159, 207) off-centre right, facing north, hay in her arms; the four huskies in a loose
#   cluster around her feet, one facing the camera centred in the foreground, one looking up at her; fence and bamboo behind;
#   long low sunlight. Nelim: red Apparel_Parka dyed rgb (150, 36, 36), black Apparel_Tuque dyed rgb (28, 28, 32) on long loose
#   hair, hair colour silver-grey (170, 170, 176), LidUnimpressed (tired, content). Decor: Hay carried, Plant_YellowTallGrass at the
#   fence foot, TorchLamp lit at the gate post; removed after. Mods: none beyond Core. Risk: the green zone of the pen shows,
#   and the sun is low (long shadows over the coats). Plan: "the painted zones are hidden", hour 18 and not later, read the
#   capture for shadows. Estimate 4. Subtitle: "Evening feed, and four huskies at the gate."
#
# 6 workshop-6-fireside. fire-pit (zoom 5, camera on (181, 115)), 20:00, clear, +120 ticks. Subject: Vanilla Animals Expanded
#   corgis (AEXP_Corgi, coats -1 original, 0 red, 1 sable, 2 blue-grey merle). The image says: the same coats by firelight.
#   Composition: the hearth in the centre, the corgis around it in a loose arc at different distances (never aligned), the
#   original facing the camera in the foreground, the merle half in shadow; Nelim at the far side of the fire, profile, a
#   blanket over her arm. Nelim: navy Apparel_Duster dyed rgb (58, 58, 98) over a cream Apparel_BasicShirt dyed rgb
#   (236, 228, 206), hair Long loose (86, 52, 34), LidUnimpressed with MouthSmile (sleepy). Decor: TorchLamp x3 lit around,
#   PlantPot_Bonsai at the fire, Cloth carried; removed after. Mods: VAE. Risk: firelight tints the coats orange and hides the
#   difference. Plan: cooler torches, hour 20 so some sky light stays, read the capture; fall back to hearth-hall at 19:00.
#   Estimate 4. Subtitle: "By the fire, the corgis keep their own colours."
#
# Interface windows: none planned (an info card of a breed would be taken on window-backdrop-for-height and cropped, no subtitle).
# Images go to Art/Gallery/<n>-candidate-<name>.png, under 2 MB each; 0-preview.png stays the byte copy of Preview.png.
Feature: images for the Workshop page, one day at the sanctuary
