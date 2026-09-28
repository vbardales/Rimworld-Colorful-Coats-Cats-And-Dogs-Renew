# Pass 1: the mod with nothing optional beside it, so only the four base-game pets can carry coats.
# One launch, English: the mod owns no player-facing text, so a French launch would only re-check
# the game's own strings (see Tests/Pickle/README.md, "Languages").
#
# Only what a running game can show is kept in Gherkin. The offline suite already runs the game's
# own patch engine on the real defs (_tools/Run-Functional-Tests.ps1); what it cannot do is load a
# whole mod list through the real loader and then ask what the game kept, or draw an animal.

Feature: The four base-game pets, and nothing else

  Scenario: the mod is loaded and none of the optional mods it paints for is
    Then mod "nelim.colorfulcoats.catsanddogs" is loaded
    And mod "Qux.stray.dogs" is not loaded
    And mod "akairo.LetsHaveaCat" is not loaded
    And mod "VanillaExpanded.VanillaAnimalsExpanded" is not loaded
    And mod "Erin.Cats" is not loaded
    And mod "cucumpear.azrael.varietycoats" is not loaded
    And no def "SCPug" exists
    And no def "akaNEKO_Persian" exists
    And no def "AEXP_Beagle" exists

  # 37 of the 41 operations are aimed at mods that are not here. They must have written nothing and
  # said nothing: this is what <success>Always</success> on every add buys, and the log is where a
  # missing flag would show as "Patch operation ... failed".
  Scenario: the operations aimed at absent mods left no trace
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.colorfulcoats.catsanddogs"

  # The values the game kept after loading the whole list. The offline suite runs the patch on an
  # isolated document; this asks the loaded def, after inheritance and every other mod's patches.
  Scenario Outline: the base-game <kind> kept its coats
    Then Colorful Coats the pawn kind "<kind>" keeps <count> coats at a chance of "<chance>"
    And Colorful Coats every coat of "<kind>" is a colour and not a texture

    Examples:
      | kind              | count | chance |
      | Husky             | 3     | 0.6    |
      | LabradorRetriever | 3     | 0.7    |
      | YorkshireTerrier  | 3     | 0.6    |
      | Cat               | 4     | 0.7    |

  # Written 0-255 in the XML. The offline suite cannot call ParseHelper.ParseColor under Windows
  # PowerShell 5.1, so it mirrors the rule that a component above 1 means 0-255. Here the game has
  # really parsed them: if the mirror were wrong these would read as near-black or near-white.
  Scenario: the colours were read on the 0-255 scale
    Then Colorful Coats the pawn kind "Husky" has a coat coloured 188 228 255
    And Colorful Coats the pawn kind "LabradorRetriever" has a coat coloured 138 113 98
    And Colorful Coats the pawn kind "Cat" has a coat coloured 111 124 166
    And Colorful Coats the pawn kind "Cat" has a coat coloured 242 205 190

  # The one thing offline cannot do: draw. A coat is the index into the list, rolled from the
  # animal's id, so forty huskies are a sample and the bounds are wide on purpose (chance 0.6).
  Scenario: forty wild huskies wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild animals as "Husky"
    Then Colorful Coats between 30 and 90 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 3 different coats
    And no errors were logged

  # A coat is stored nowhere: TryGetAlternate rolls from the animal's id every time it is asked.
  # So a coat must survive a save and reload, and equally must not need one to appear.
  Scenario: a husky and a cat keep their coats through a save and reload
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player animal "Rex" as "Husky"
    And Colorful Coats spawns the player animal "Mimi" as "Cat"
    When Colorful Coats records the coat of "Rex"
    And Colorful Coats records the coat of "Mimi"
    And I save and reload
    Then Colorful Coats the coat of "Rex" is the one recorded
    And Colorful Coats the coat of "Mimi" is the one recorded
    And no errors were logged

  # Scenario 2 of _tools/FUNCTIONAL-SCENARIOS.md: does a tint read as fur or as dirt. Nothing in a
  # green run says so; a person has to open the picture and look.
  @review
  Scenario: twelve huskies side by side, for a person to judge the tints
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 12 wild animals as "Husky" close together
    When Colorful Coats frames the batch
    Then I take a screenshot "huskies - the tints, base game only"
    And no errors were logged
