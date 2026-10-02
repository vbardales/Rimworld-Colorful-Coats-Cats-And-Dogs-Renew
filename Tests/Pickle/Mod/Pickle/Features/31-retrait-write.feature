# Scenario 3 of _tools/FUNCTIONAL-SCENARIOS.md: add the mod to a colony, remove it, the save stays intact.
# First launch of the chain; the second launch is Removal/Mod/Pickle/Features/retrait-check.feature, played
# with this mod taken out of the list. Map: wsl-deps.retrait.map. Never part of passes 1 to 3.

Feature: A colony with the mod's coats, saved for a launch without it

  Scenario: the coats show, the save holds nothing of the mod, and the file is handed over
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 20 wild animals as "SCStandardPoodle"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 3 different coats
    Given Colorful Coats spawns the player animal "Bella" as "SCStandardPoodle"
    When Colorful Coats saves the game as "colorfulcoats-with-mod"
    Then Colorful Coats save "colorfulcoats-with-mod" holds nothing of this mod outside its mod list
    When Colorful Coats hands the saved game "colorfulcoats-with-mod" to the mod "nelim.colorfulcoats.catsanddogs.pickleremoval"
    Then no errors were logged
