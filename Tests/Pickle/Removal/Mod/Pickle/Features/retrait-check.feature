# Scenario 3 of _tools/FUNCTIONAL-SCENARIOS.md, "remove it and they go back to their original coats, with the
# save intact". Played by the second launch of the chain started by 31-retrait-write, with this mod taken out
# of the mod list (-ThenWithout). It uses only Pickle's own steps: the mod's own are gone with the mod.

Feature: A game saved with Colorful Coats, loaded without it

  Scenario: the colony loads and runs without the mod
    Given mod "nelim.colorfulcoats.catsanddogs" is not loaded
    And mod "Qux.stray.dogs" is loaded
    And the save "colorfulcoats-with-mod" is loaded
    And game speed is fast
    When I wait 250 ticks
    Then no errors were logged
    And the engine is alive
    When I save and reload as "colorfulcoats-without-mod"
    Then no errors were logged
    And the engine is alive
