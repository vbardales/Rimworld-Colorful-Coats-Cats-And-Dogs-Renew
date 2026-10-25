# Workshop gallery, shotlist v2 of 2026-10-25 (shootGallery[1.1.0]). Replaces the shotlist of 2026-10-20 after ticket e276
# (3/6 green, captures 1, 2, 4 read) and the rules of GALLERY.md of 2026-10-23/25. It replaces 07-galerie.feature (old fixture, a row
# of animals facing the camera: a catalogue plate), which is deleted once the new images are accepted. Scenes 1 to 3 are in this
# file, scenes 4 to 6 in 09b-galerie-soir.feature (a ticket of more than about 5 scenarios is killed, exit 137: two tickets of three).
# Director pass of an Opus sub-agent kept: see "Director's remarks" at the end of this header.
#
# THE STORY. "Nelim pet-sits the neighbours' animals for a day." Nelim, alone in her sanctuary, looks after the animals of the
# neighbouring farms: every few hours a new group arrives, in the coats this mod gives them, and she does one thing with them.
# The evening gathers them (the white cat of the breakfast sleeps by the fire at the end). The series shows the mod's four
# sources: Let's Have a Cat! (white cat, five coats), the base-game pets (Labrador, Yorkshire terrier, Husky), Stray Dogs (standard
# poodle, four coats), Vanilla Animals Expanded (corgi, three coats).
# Rhythm of time: one hour per scene, 07, 10, 12, 15, 18, 20, clear sky all day (I set the hour to N first; animals are placed,
# then the gesture is STARTED by a job (haul, walk, follow, lie down, play) and 30 to 60 ticks pass, then the game is paused:
# the image is the game paused mid-play, nobody stands still waiting for the photo).
# OUTFIT, CONTINUITY (one story day): Nelim wears the same outfit in every scene: denim-blue Apparel_CollarShirt dyed rgb
# (44, 86, 140), her fixture trousers, long loose auburn hair (122, 58, 34), a smile (MouthSmile + LidCheerful; scene 4 a smirk,
# she is about to win). Only two changes, both justified by the story: a straw Apparel_CowboyHat dyed (214, 174, 92) goes on for
# the three scenes in open sun (2, 3, 5) and is off indoors or under a roof (1, 4, 6); at 20:00 (scene 6) she adds a navy
# Apparel_Duster dyed (58, 58, 98) "because the evening is cold". Hat on long loose hair, never a ponytail (Show Hair Under Stuff
# 3255379190 in the map).
# Series (criterion k): shot sizes 1 medium (zoom 5, opening, poses the home), 2 medium (zoom 5), 3 wide (zoom 6), 4 tight
# (zoom 3.5), 5 medium-tight (zoom 4.5), 6 medium (zoom 5, closing). One animal faces the camera in scenes 1, 2, 4, 6.
# Gestures: 1 and 2 she carries (morning chores), 3 she walks empty-handed, 4 she plays, 5 she trains, 6 she plays music.
#
# MAP: wsl-deps.sanctuary.map of this mod (nothing challenged; Show Hair Under Stuff in it). Steps all existing (ColonistRace):
# "stands at", "is forced to haul N of the item X to (x, z)", "is forced to walk to (x, z)", "follows Y within N cells", "lies down",
# "is forced into the job J on the building D at (x, z)", "is forced into the job J on Y", "plays the instrument D", "wears dyed",
# "carries". Sanctuary: "the D near (x, z) is hidden". CoatSteps: "N adult animals of kind K are spawned around (x, z)" (animals
# named coat-1.. in order), "the animal Y is given coat N" (-1 is the original). Cells below come from SANCTUAIRE-CASES.md (free
# cells of sofa-corner, cloister, fire-pit) or were placed without failing in e276; elsewhere animals are spawned "around".
#
# SHOTLIST (index, file, place, hour, framing, gesture and instant, living things, decor, estimate, subtitle)
#
# 1 workshop-1-breakfast. sofa-corner, 07:00, zoom 5 on (186, 121), +45 ticks. Opening image, poses the home. Gesture: Nelim walks
#   west along the parquet strip carrying 10 Kibble (forced haul from (190, 120) towards (183, 120), stopped after 45 ticks, still
#   2 to 3 cells short: mid-stride). Instant: she is about to set the bowl down, the cats have just caught up. Cats of Let's Have a
#   Cat! (akaNEKO_shironeko, coats -1 original, 0 peach, 1 steel blue, 2 grey, 3 fawn): grey and steel blue follow her within 2
#   cells, peach (190, 121) and fawn (191, 119) stand staggered behind her facing west on the parquet, the original white one walks
#   south towards the camera from (184, 121) to (184, 119): the series' front view. Nelim: no hat, smile. Decor: Plant_Daylily fully
#   grown at (183, 123) and (190, 123) (placed in e276), existing couches, bookcase and torch lamps. Estimate 4.
#   Subtitle: "Breakfast for five: one white cat, five coats."
#
# 2 workshop-2-fetch. right-bank, 10:00, zoom 5 on (147, 131), +45 ticks. Gesture: Nelim, hat on, brings a log back from the water
#   (forced haul of one WoodLog from (144, 131) to (148, 132)), mid-stride. Instant: she has just fetched the log, the dogs are on
#   her heels. Labradors (Core, coats -1, 0 chocolate, 1 yellow, 2 black): three follow within 3 cells, the fourth runs ahead south
#   (forced walk from (150, 129) to (150, 127)) facing the camera. Decor: Plant_Daylily fully grown at (143, 130), (147, 134),
#   (149, 131) (placed in e276), the river behind. Estimate 4. Subtitle: "Fetch by the river: four labradors, one log."
#
# 3 workshop-3-poodle-parade. statue-garden, 12:00, zoom 6 on (155, 98), +90 ticks. WIDE shot of the series. Gesture: Nelim,
#   hat on, strolls past the statues empty-handed, east to west in profile (forced walk from (160, 98) to (152, 98)); the four
#   poodles of Stray Dogs (SCStandardPoodle, coats -1, 1 chocolate, 2 ink, 3 champagne) follow within 3 cells in a loose trail among
#   the statues, on the stone. Instant: the trail has just formed behind her. Decor: the existing big statues and the yellow flower
#   field, one Plant_Daylily at (151, 94) (placed in e276); nothing else is placed (other cells unknown, (156, 93) holds a
#   ShipChunk). Animals are spawned "around" so a bad cell fails loudly. Estimate 4. Subtitle: "Four poodles tour the statue garden."
#
# Scenes 4, 5, 6: see 09b-galerie-soir.feature.
#
# DIRECTOR'S REMARKS (Opus sub-agent, 2026-10-25), kept: Kibble haul stopped short of its cell; pale coats on the parquet; a mix of
# followers and staged animals so they do not pile up behind her; the front-facing animal always moving; the white cat of scene 1
# asleep in scene 6; scene 3 wide at zoom 6 and in profile east to west; chess by the real JobDef Play_Chess (sits); gate scene by a
# Train job and the evening by a harp; short tick counts; the story reworded as a pet-sitting day. Not kept: zoom 11 for the huskies
# became 4.5; no animal garments (no animal-apparel mod in the map, none warranted).
# Images go to Art/Gallery/<n>-candidate-<name>.png, under 2 MB each; 0-preview.png stays the byte copy of Preview.png.
@review @timeout:900 @requires:nelim.pickletools.clickdiagnostics @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom
Feature: images for the Workshop page, one day at the sanctuary, morning

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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Neige" is spawned at (184, 121)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Peche" is spawned at (190, 121)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Azur" is spawned at (189, 122)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Cendre" is spawned at (188, 119)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Paille" is spawned at (191, 119)
    And Nelim's Pickle Tools: the animal "Neige" is given coat -1
    And Nelim's Pickle Tools: the animal "Peche" is given coat 0
    And Nelim's Pickle Tools: the animal "Azur" is given coat 1
    And Nelim's Pickle Tools: the animal "Cendre" is given coat 2
    And Nelim's Pickle Tools: the animal "Paille" is given coat 3
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (190, 120) facing West
    And Nelim's Pickle Tools: the animal "Peche" stands at (190, 121) facing West
    And Nelim's Pickle Tools: the animal "Paille" stands at (191, 119) facing West
    And Nelim's Pickle Tools: the animal "Neige" stands at (184, 121) facing South
    And Nelim's Pickle Tools: "Nelim" is forced to haul 10 of the item "Kibble" to (183, 120)
    And Nelim's Pickle Tools: "Azur" follows "Nelim" within 2 cells
    And Nelim's Pickle Tools: "Cendre" follows "Nelim" within 2 cells
    And Nelim's Pickle Tools: "Neige" is forced to walk to (184, 119)
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (186, 121) at zoom 5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
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
    And Nelim's Pickle Tools: the animal "Jais" stands at (150, 129) facing South
    And Nelim's Pickle Tools: "Nelim" is forced to haul 1 of the item "WoodLog" to (148, 132)
    And Nelim's Pickle Tools: "Miel" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "Cacao" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "Sable" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "Jais" is forced to walk to (150, 127)
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (147, 131) at zoom 5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 2 - fetch by the river, four labradors"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-3-poodle-parade
    Given I set the hour to 12
    And Nelim's Sanctuary: the animals are removed from the sanctuary "statue-garden"
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (151, 94) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CowboyHat" dyed rgb (214, 174, 92)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: 4 adult animals of kind "SCStandardPoodle" are spawned around (156, 98)
    And Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: the animal "coat-4" is given coat 3
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (160, 98) facing West
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (152, 98)
    And Nelim's Pickle Tools: "coat-1" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "coat-2" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "coat-3" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "coat-4" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: I let 90 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (155, 98) at zoom 6
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 3 - four poodles tour the statue garden"
    And Nelim's Pickle Tools: the decor is removed
