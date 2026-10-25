# Workshop gallery, scenes 4 to 6 of the shotlist v2 of 2026-10-25 (the plan, the story and the outfit rule are in the header of
# 09-galerie-sanctuaire.feature; the second ticket of the series, three scenes each).
#
# 4 workshop-4-chess. cloister, 15:00, zoom 3.5 on (173, 127), +45 ticks. TIGHT shot. Gesture: Nelim plays chess (JobDef Play_Chess,
#   JobDriver_SitFacingBuilding, forced on the ChessTable at (172, 126): she sits at the board), no hat, a smirk and a squint (she is
#   about to win). Instant: the Yorkshires have just come to watch. Yorkshire terriers (Core, three coats picked to differ:
#   -1 original dark, 0 steel blue, 2 oatmeal): one lies down by the KneelPillow at (174, 127), one walks in from (176, 128) towards
#   the table facing the camera, one stands at (175, 129) facing south. Decor: PlantPot_Bonsai (171, 126), two lit TorchLamp
#   (169, 127) and (178, 126), Plant_Daylily at (170, 128) and (177, 127) (all placed in e276), the columns. No fallback pose:
#   if the job fails the scene is replaced. Estimate 4. Subtitle: "A game of chess, watched from below."
#
# 5 workshop-5-evening-training. enclosure-south, 18:00, zoom 4.5 on (158, 211), +45 ticks. Gesture: Nelim, hat on, trains a husky
#   at the gate (JobDef Train forced on the husky "coat-2", she stands beside it, turned to it); instant: she has just given the
#   command, the husky answers. Huskies (Core, coats 0 ice blue, -1 original, 1 coffee, 2 oatmeal): one lies down tired, two follow
#   her within 3 cells, the trained one is the one facing the camera. Decor: Plant_YellowTallGrass at (156, 209) and (162, 212)
#   (placed in e276), the fence and the laying boxes of the pen; painted zones hidden; no torch (the gate cell holds a Fence).
#   Low sun at 18:00. If Train does not start (no training left to give), refile with a Hay haul to (158, 211). Estimate 4.
#   Subtitle: "Evening training, and four huskies at the gate."
#
# 6 workshop-6-fireside. fire-pit, 20:00, zoom 5 on (181, 115), +60 ticks. CLOSING image. Gesture: Nelim, now in the navy Duster over
#   the denim shirt, no hat, plays the harp by the fire (plays the instrument "Harp"; the harp of the ritual hall is hidden first so
#   the step finds ours). Instant: the first notes, the corgis gather. Corgis of Vanilla Animals Expanded (AEXP_Corgi, coats -1,
#   0 taupe, 1 champagne, 2 slate): the original faces the camera at (182, 113), one walks towards the fire from (177, 116), one stands
#   at (183, 114) facing west, one lies down asleep at (179, 113); the white cat of scene 1 (coat -1) sleeps at (179, 117): the
#   evening gathers the day. Decor: Harp at (183, 116), PlantPot_Bonsai (185, 117), lit TorchLamp at (177, 114), (184, 114),
#   (181, 118) (the old (185, 114) holds a Fence). Estimate 4. Subtitle: "By the fire, the corgis keep their own colours."
#
# Interface windows: none planned (an info card of a breed would be taken on window-backdrop-for-height and cropped, no subtitle).
@review @timeout:900 @requires:nelim.pickletools.clickdiagnostics @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom
Feature: images for the Workshop page, one day at the sanctuary, evening

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Tweed" is spawned at (174, 127)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Brume" is spawned at (176, 128)
    And Nelim's Pickle Tools: an adult animal of kind "YorkshireTerrier" named "Brioche" is spawned at (175, 129)
    And Nelim's Pickle Tools: the animal "Tweed" is given coat -1
    And Nelim's Pickle Tools: the animal "Brume" is given coat 0
    And Nelim's Pickle Tools: the animal "Brioche" is given coat 2
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: the animal "Brioche" stands at (175, 129) facing South
    And Nelim's Pickle Tools: the animal "Brume" stands at (176, 128) facing West
    And Nelim's Pickle Tools: "Nelim" is forced into the job "Play_Chess" on the building "ChessTable" at (172, 126)
    And Nelim's Pickle Tools: "Tweed" lies down
    And Nelim's Pickle Tools: "Brume" is forced to walk to (174, 128)
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (173, 127) at zoom 3.5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmirkSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidSquinting"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 4 - chess, three yorkshire terriers"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-5-evening-training
    Given I set the hour to 18
    And Nelim's Sanctuary: the animals are removed from the sanctuary "enclosure-south"
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: the painted zones are hidden
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (156, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (162, 212) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CowboyHat" dyed rgb (214, 174, 92)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: 4 adult animals of kind "Husky" are spawned around (158, 211)
    And Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-4" is given coat 2
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: the animal "coat-2" stands at (158, 211) facing South
    And Nelim's Pickle Tools: "coat-4" lies down
    And Nelim's Pickle Tools: "coat-1" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "coat-3" follows "Nelim" within 3 cells
    And Nelim's Pickle Tools: "Nelim" is forced into the job "Train" on "coat-2"
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (158, 211) at zoom 4.5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 5 - evening training, four huskies"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-6-fireside
    Given I set the hour to 20
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: the "Harp" near (207, 117) is hidden
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (177, 114)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (177, 114) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 114)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (184, 114) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (181, 118)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (181, 118) is lit
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (185, 117)
    And Nelim's Pickle Tools: I place the decor "Harp" at (183, 116)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Duster" dyed rgb (58, 58, 98)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (122, 58, 34)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Noisette" is spawned at (182, 113)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Praline" is spawned at (177, 116)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Dune" is spawned at (183, 114)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_Corgi" named "Brume" is spawned at (179, 113)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_shironeko" named "Neige" is spawned at (179, 117)
    And Nelim's Pickle Tools: the animal "Noisette" is given coat -1
    And Nelim's Pickle Tools: the animal "Praline" is given coat 0
    And Nelim's Pickle Tools: the animal "Dune" is given coat 1
    And Nelim's Pickle Tools: the animal "Brume" is given coat 2
    And Nelim's Pickle Tools: the animal "Neige" is given coat -1
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: the animal "Noisette" stands at (182, 113) facing South
    And Nelim's Pickle Tools: the animal "Dune" stands at (183, 114) facing West
    And Nelim's Pickle Tools: "Brume" lies down
    And Nelim's Pickle Tools: "Neige" lies down
    And Nelim's Pickle Tools: "Praline" is forced to walk to (179, 115)
    And Nelim's Pickle Tools: "Nelim" plays the instrument "Harp"
    And Nelim's Pickle Tools: I let 60 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (181, 115) at zoom 5
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 6 - fireside, the corgis and the white cat"
    And Nelim's Pickle Tools: the decor is removed
