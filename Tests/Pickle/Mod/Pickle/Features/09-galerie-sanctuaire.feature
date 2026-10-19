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
#   corgis (AEXP_Corgi, coats -1 original, 0 taupe, 1 champagne, 2 slate blue-grey). The image says: the same coats by firelight.
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
@review @timeout:900 @requires:nelim.pickletools.clickdiagnostics @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom
Feature: images for the Workshop page, one day at the sanctuary

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

  Scenario: gallery-1-breakfast
    Given I set the hour to 7
    And Nelim's Sanctuary: the animals are removed from the sanctuary "sofa-corner"
    And Nelim's Sanctuary: I am at the sanctuary "sofa-corner"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (183, 123) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 123) fully grown
    And Nelim's Pickle Tools: I place the decor "Kibble" at (185, 121)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Robe" dyed rgb (24, 92, 104)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (86, 52, 34)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Neige" is spawned at (184, 120)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Peche" is spawned at (187, 120)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Azur" is spawned at (183, 122)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Cendre" is spawned at (186, 122)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Paille" is spawned at (190, 121)
    And Nelim's Pickle Tools: the animal "Neige" is given coat -1
    And Nelim's Pickle Tools: the animal "Peche" is given coat 0
    And Nelim's Pickle Tools: the animal "Azur" is given coat 1
    And Nelim's Pickle Tools: the animal "Cendre" is given coat 2
    And Nelim's Pickle Tools: the animal "Paille" is given coat 3
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (188, 124) facing South
    And Nelim's Pickle Tools: "Nelim" carries 10 of the item "Kibble"
    And Nelim's Pickle Tools: the animal "Neige" stands at (184, 120) facing South
    And Nelim's Pickle Tools: the animal "Peche" stands at (187, 120) facing South
    And Nelim's Pickle Tools: the animal "Azur" stands at (183, 122) facing South
    And Nelim's Pickle Tools: the animal "Cendre" stands at (186, 122) facing East
    And Nelim's Pickle Tools: the animal "Paille" stands at (190, 121) facing West
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (186, 121) at zoom 4.5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 1 - breakfast, five coats of one white cat"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-2-fetch
    Given I set the hour to 10
    And Nelim's Sanctuary: the animals are removed from the sanctuary "right-bank"
    And Nelim's Sanctuary: I am at the sanctuary "right-bank"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (143, 130) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (147, 134) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (149, 131) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CowboyHat" dyed rgb (214, 174, 92)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Miel" is spawned at (146, 129)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Cacao" is spawned at (148, 132)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Jais" is spawned at (150, 129)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Sable" is spawned at (151, 133)
    And Nelim's Pickle Tools: the animal "Miel" is given coat -1
    And Nelim's Pickle Tools: the animal "Cacao" is given coat 0
    And Nelim's Pickle Tools: the animal "Jais" is given coat 2
    And Nelim's Pickle Tools: the animal "Sable" is given coat 1
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (144, 131) facing East
    And Nelim's Pickle Tools: "Nelim" carries 1 of the item "WoodLog"
    And Nelim's Pickle Tools: the animal "Miel" stands at (146, 129) facing South
    And Nelim's Pickle Tools: the animal "Cacao" stands at (148, 132) facing West
    And Nelim's Pickle Tools: the animal "Jais" stands at (150, 129) facing West
    And Nelim's Pickle Tools: the animal "Sable" stands at (151, 133) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (147, 131) at zoom 6
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 2 - fetch by the river, four labradors"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-3-poodle-show
    Given I set the hour to 12
    And Nelim's Sanctuary: the animals are removed from the sanctuary "statue-garden"
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (151, 94) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (156, 93) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (160, 96) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (153, 99) fully grown
    And Nelim's Pickle Tools: I place the decor "SculptureSmall" at (150, 96)
    And Nelim's Pickle Tools: I place the decor "SculptureSmall" at (161, 98)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Cape" dyed rgb (122, 28, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Flophat" dyed rgb (240, 234, 214)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (40, 30, 28)
    And Nelim's Pickle Tools: an adult animal of kind "SCStandardPoodle" named "Lune" is spawned at (153, 96)
    And Nelim's Pickle Tools: an adult animal of kind "SCStandardPoodle" named "Cafe" is spawned at (158, 95)
    And Nelim's Pickle Tools: an adult animal of kind "SCStandardPoodle" named "Onyx" is spawned at (155, 97)
    And Nelim's Pickle Tools: an adult animal of kind "SCStandardPoodle" named "Rose" is spawned at (159, 99)
    And Nelim's Pickle Tools: the animal "Lune" is given coat -1
    And Nelim's Pickle Tools: the animal "Cafe" is given coat 1
    And Nelim's Pickle Tools: the animal "Onyx" is given coat 2
    And Nelim's Pickle Tools: the animal "Rose" is given coat 3
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (156, 102) facing South
    And Nelim's Pickle Tools: "Nelim" carries 4 of the item "Meat_Pig"
    And Nelim's Pickle Tools: the animal "Lune" stands at (153, 96) facing East
    And Nelim's Pickle Tools: the animal "Cafe" stands at (158, 95) facing South
    And Nelim's Pickle Tools: the animal "Onyx" stands at (155, 97) facing South
    And Nelim's Pickle Tools: the animal "Rose" stands at (159, 99) facing West
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (156, 98) at zoom 7
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowRaised"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 3 - four poodles in the statue garden"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-4-chess
    Given I set the hour to 15
    And Nelim's Sanctuary: the animals are removed from the sanctuary "cloister"
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (171, 126)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (170, 128) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (177, 127) fully grown
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (169, 127)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (169, 127) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (178, 126)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (178, 126) is lit
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (196, 150, 40)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (110, 60, 40)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Tweed" is spawned at (173, 126)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Brume" is spawned at (174, 128)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Brioche" is spawned at (175, 127)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Lin" is spawned at (176, 129)
    And Nelim's Pickle Tools: the animal "Tweed" is given coat -1
    And Nelim's Pickle Tools: the animal "Brume" is given coat 0
    And Nelim's Pickle Tools: the animal "Brioche" is given coat 1
    And Nelim's Pickle Tools: the animal "Lin" is given coat 2
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (172, 127) facing East
    And Nelim's Pickle Tools: the animal "Tweed" stands at (173, 126) facing South
    And Nelim's Pickle Tools: the animal "Brume" stands at (174, 128) facing South
    And Nelim's Pickle Tools: the animal "Brioche" stands at (175, 127) facing South
    And Nelim's Pickle Tools: the animal "Lin" stands at (176, 129) facing West
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (174, 127) at zoom 5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmirkSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidSquinting"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 4 - chess, four yorkshire terriers"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-5-dusk-huskies
    Given I set the hour to 18
    And Nelim's Sanctuary: the animals are removed from the sanctuary "enclosure-south"
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: the painted zones are hidden
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (156, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (162, 212) fully grown
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (160, 207)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (160, 207) is lit
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Parka" dyed rgb (150, 36, 36)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Tuque" dyed rgb (28, 28, 32)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (170, 170, 176)
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Givre" is spawned at (157, 211)
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Ardoise" is spawned at (159, 212)
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Moka" is spawned at (161, 210)
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Lait" is spawned at (155, 213)
    And Nelim's Pickle Tools: the animal "Givre" is given coat 0
    And Nelim's Pickle Tools: the animal "Ardoise" is given coat -1
    And Nelim's Pickle Tools: the animal "Moka" is given coat 1
    And Nelim's Pickle Tools: the animal "Lait" is given coat 2
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (159, 209) facing South
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: the animal "Givre" stands at (157, 211) facing North
    And Nelim's Pickle Tools: the animal "Ardoise" stands at (159, 212) facing South
    And Nelim's Pickle Tools: the animal "Moka" stands at (161, 210) facing West
    And Nelim's Pickle Tools: the animal "Lait" stands at (155, 213) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (158, 211) at zoom 8
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidUnimpressed"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 5 - dusk, four huskies at the gate"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-6-fireside
    Given I set the hour to 20
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (177, 114)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (177, 114) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (185, 114)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (185, 114) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (181, 118)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (181, 118) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (183, 117)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (236, 228, 206)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Duster" dyed rgb (58, 58, 98)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (86, 52, 34)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Noisette" is spawned at (180, 113)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Praline" is spawned at (183, 115)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Dune" is spawned at (179, 116)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Brume" is spawned at (184, 116)
    And Nelim's Pickle Tools: the animal "Noisette" is given coat -1
    And Nelim's Pickle Tools: the animal "Praline" is given coat 0
    And Nelim's Pickle Tools: the animal "Dune" is given coat 1
    And Nelim's Pickle Tools: the animal "Brume" is given coat 2
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (184, 117) facing West
    And Nelim's Pickle Tools: "Nelim" carries 1 of the item "Cloth"
    And Nelim's Pickle Tools: the animal "Noisette" stands at (180, 113) facing South
    And Nelim's Pickle Tools: the animal "Praline" stands at (183, 115) facing West
    And Nelim's Pickle Tools: the animal "Dune" stands at (179, 116) facing East
    And Nelim's Pickle Tools: the animal "Brume" stands at (184, 116) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (181, 115) at zoom 5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidUnimpressed"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 6 - fireside, four corgis"
    And Nelim's Pickle Tools: the decor is removed
