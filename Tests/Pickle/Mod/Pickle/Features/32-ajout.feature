# Scenario 3 of _tools/FUNCTIONAL-SCENARIOS.md, the other direction: add the mod to a colony that already has
# dogs, and they take their coats at once. The fixture colorfulcoats-without-mod.rws was saved by a game that
# did NOT have this mod (the second launch of the removal chain, 31-retrait-write then retrait-check), with
# twenty wild standard poodles on the map. Map: wsl-deps.stray-dogs.map (the mod, loaded). Never part of
# passes 1 to 3.

Feature: A colony saved without the mod, loaded with it

  Scenario: the dogs already in the colony take their coats
    Given mod "nelim.colorfulcoats.catsanddogs" is loaded
    And the save "colorfulcoats-without-mod" is loaded
    And Colorful Coats takes every animal of kind "SCStandardPoodle" on the map as the batch
    Then Colorful Coats the batch holds at least 20 animals
    And Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged
