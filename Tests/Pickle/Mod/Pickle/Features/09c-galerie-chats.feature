# Workshop gallery, shots 7 and 8 of the shotlist of 2026-11-07 (THE STORY, the outfit rule and the series are in the header of
# 09-galerie-sanctuaire.feature; shots 4 to 6 are in 09b-galerie-soir.feature, 9 to 11 in 09d-galerie-chiens.feature). Plan of the
# two cat shots below, then the scenarios. Every cell was read in SANCTUAIRE-CASES.md of NSB (2026-11-07), the coats were read
# in Mod/Patches (palette names), the steps exist (ColonistRace, CoatSteps, StageDecor).
#
# SHOTLIST (index, name, place, hour, framing, gesture, decor, living things, outfit, what the image says)
#
#   7. workshop-7-cats-terrace. terrace (the veranda), 13h, clear, zoom 4 on (197, 121) (8 cells tall, about 14 wide, a cat about
#           20 px at 268 px wide), +45 ticks. Siesta on the veranda. Nelim, no hat (roofed), denim Apparel_CollarShirt dyed
#           rgb (44, 86, 140), Roo_HD_Hair_Highpony, hair colour rgb (56, 36, 18), smile (MouthSmile, LidCheerful), starts at
#           (193, 122) facing East and hauls 10 Cloth from the stack beside her to (199, 120): a folded blanket carried towards the
#           sleepers; mid-stride in the middle of the veranda after 45 ticks. Instant: she has just picked the blanket up, the cats are
#           waking. Six cats, one coat each (palette names read in the patches): Cat 2 champagne walks (193, 121) to (197, 121);
#           akaNEKO_Persian 3 chocolate lies (194, 124); akaNEKO_Siamese 0 blue walks (200, 121) to (198, 121) to greet her;
#           akaNEKO_Scottish_Fold 2 ashblue lies (197, 123); akaNEKO_Maine_Coon 0 ink lies (195, 122) beside the Campfire
#           of the veranda; akaNEKO_Russian_Blue 1 coffee stands (194, 118) facing South: the animal that faces the camera.
#           Decor, grouped around the sleepers and the lane: the existing Campfire, Stool, Harpsichord, Shelf with its cloth and
#           steel piles and the two TorchLamps, plus Plant_Daylily fully grown at (195, 124) and (198, 124),
#           PlantPot_Bonsai at (193, 119), TorchLamp at (196, 124) lit, Brazier at (199, 119) lit: no bare floor, two light sources
#           in frame. Says: Nelim brings a blanket across the veranda, three cats are asleep by the fire, three wake to greet her:
#           the cats nap here, in six coats. Estimate 5. Subtitle: "One o'clock siesta: six cats take the terrace."
#
#   8. workshop-8-cats-tea. dining-nook (white rug, table, chairs), 17h, clear, zoom 4 on (176, 108) (8 cells tall, about 14 wide,
#           x 169 to 183), +45 ticks. Tea time. Nelim, no hat, denim Apparel_CollarShirt dyed rgb (44, 86, 140),
#           Roo_HD_Hair_Highpony, hair colour rgb (56, 36, 18), smile (MouthSmile, LidCheerful), sits on the DiningChair at
#           (176, 110) on the north side of the table, so she faces the camera (sits on the building: no job to time), the table before
#           her. Six other cats, one coat each: akaNEKO_Scottish_Fold_Long 2
#           blue lies (178, 109); akaNEKO_N_Forest_Cat 0 chocolate lies (173, 108); akaNEKO_J_Bobtail 1 grey walks (181, 111) to
#           (177, 111); akaNEKO_A_Shorthair 1 ink walks (172, 111) to (174, 111); AEXP_CatAbyssinian 2 champagne lies (180, 108);
#           akaNEKO_kijitora 1 ashblue stands (179, 111) facing South: the animal that faces the camera. Instant: the last two cats
#           are crossing the rug towards her. Decor: the existing Table2x2c, white rug, four DiningChairs, TorchLamps
#           (four around the nook), pots and bonsai, plus Plant_Daylily fully grown at (180, 109)
#           and (181, 111) and TorchLamp at (178, 107) lit: the nook is full, light in frame. Says: Nelim sits down at the dining table and
#           six more cats of the house gather round her, six more coats. Estimate 5. Subtitle: "Five o'clock at the table: six more cats
#           join Nelim."
#
# RISK: the seat facing (the chair may turn her away: then the scene is recomposed with the chair on the south side), cats stopping
# at their targets (+30 ticks), the veranda roof (light), dark coats on the dark rug in 8.
@review @timeout:900 @requires:nelim.pickletools.clickdiagnostics @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom
Feature: images for the Workshop page, one day at the sanctuary, afternoon cats

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

  Scenario: gallery-7-cats-terrace
    Given I set the hour to 13
    And Nelim's Sanctuary: the animals are removed from the sanctuary "terrace"
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (195, 124) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (198, 124) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (193, 119)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 124) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (199, 119)
    And Nelim's Pickle Tools: the decor "Brazier" at (199, 119) is lit
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (56, 36, 18)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miette" is spawned at (193, 121)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Persian" named "Velours" is spawned at (194, 124)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Siamese" named "Satin" is spawned at (200, 121)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Scottish_Fold" named "Flocon" is spawned at (197, 123)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Maine_Coon" named "Suie" is spawned at (195, 122)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Russian_Blue" named "Brume" is spawned at (194, 118)
    And Nelim's Pickle Tools: the animal "Miette" is given coat 2
    And Nelim's Pickle Tools: the animal "Velours" is given coat 3
    And Nelim's Pickle Tools: the animal "Satin" is given coat 0
    And Nelim's Pickle Tools: the animal "Flocon" is given coat 2
    And Nelim's Pickle Tools: the animal "Suie" is given coat 0
    And Nelim's Pickle Tools: the animal "Brume" is given coat 1
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" stands at (193, 122) facing East
    And Nelim's Pickle Tools: the animal "Brume" stands at (194, 118) facing South
    And Nelim's Pickle Tools: "Velours" lies down
    And Nelim's Pickle Tools: "Flocon" lies down
    And Nelim's Pickle Tools: "Suie" lies down
    And Nelim's Pickle Tools: "Nelim" is forced to haul 10 of the item "Cloth" to (199, 120)
    And Nelim's Pickle Tools: "Miette" is forced to walk to (197, 121)
    And Nelim's Pickle Tools: "Satin" is forced to walk to (198, 121)
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (197, 121) at zoom 4
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 7 - siesta on the terrace, six cats"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: gallery-8-cats-tea
    Given I set the hour to 17
    And Nelim's Sanctuary: the animals are removed from the sanctuary "dining-nook"
    And Nelim's Sanctuary: I am at the sanctuary "dining-nook"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (180, 109) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (181, 111) fully grown
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (178, 107)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (178, 107) is lit
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (44, 86, 140)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (56, 36, 18)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_Scottish_Fold_Long" named "Flocon" is spawned at (178, 109)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_N_Forest_Cat" named "Suie" is spawned at (173, 108)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_J_Bobtail" named "Tigre" is spawned at (181, 111)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_A_Shorthair" named "Vanille" is spawned at (172, 111)
    And Nelim's Pickle Tools: an adult animal of kind "AEXP_CatAbyssinian" named "Safran" is spawned at (180, 108)
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_kijitora" named "Perle" is spawned at (179, 111)
    And Nelim's Pickle Tools: the animal "Flocon" is given coat 2
    And Nelim's Pickle Tools: the animal "Suie" is given coat 0
    And Nelim's Pickle Tools: the animal "Tigre" is given coat 1
    And Nelim's Pickle Tools: the animal "Vanille" is given coat 1
    And Nelim's Pickle Tools: the animal "Safran" is given coat 2
    And Nelim's Pickle Tools: the animal "Perle" is given coat 1
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: "Nelim" sits on the building "DiningChair" at (176, 110)
    And Nelim's Pickle Tools: the animal "Perle" stands at (179, 111) facing South
    And Nelim's Pickle Tools: "Flocon" lies down
    And Nelim's Pickle Tools: "Suie" lies down
    And Nelim's Pickle Tools: "Safran" lies down
    And Nelim's Pickle Tools: "Tigre" is forced to walk to (177, 111)
    And Nelim's Pickle Tools: "Vanille" is forced to walk to (174, 111)
    And Nelim's Pickle Tools: I let 45 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (176, 108) at zoom 4
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 8 - tea time, six more cats"
    And Nelim's Pickle Tools: the decor is removed
