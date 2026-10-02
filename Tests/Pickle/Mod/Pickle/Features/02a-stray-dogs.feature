# Pass 2bis-a: Stray Dogs alone beside this mod (wsl-deps.stray-dogs.map). Pass 2 loads the three target mods
# together, so a red there cannot say which of them it belongs to; here it can only be Stray Dogs or this mod.
# Scenario 3 of _tools/FUNCTIONAL-SCENARIOS.md (one coat for life) is played here on a dog.

Feature: Stray Dogs alone

  Scenario: Stray Dogs and this mod are loaded, nothing else, and this mod loads after it
    Then mod "Qux.stray.dogs" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" loads after "Qux.stray.dogs"
    And mod "akairo.LetsHaveaCat" is not loaded
    And mod "VanillaExpanded.VanillaAnimalsExpanded" is not loaded
    And mod "Erin.Cats" is not loaded
    And mod "cucumpear.azrael.varietycoats" is not loaded
    And no def "akaNEKO_Persian" exists
    And no def "AEXP_Beagle" exists

  Scenario: no animal received two coat lists, and the operations aimed at absent mods left no trace
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.colorfulcoats.catsanddogs"

  Scenario Outline: <kind> kept the coats this mod gave it
    Then Colorful Coats the pawn kind "<kind>" keeps <count> coats at a chance of "<chance>"
    And Colorful Coats every coat of "<kind>" is a colour and not a texture

    Examples:
      | kind              | count | chance |
      | SCPug             | 2     | 0.5    |
      | SCGoldenRetriever | 3     | 0.6    |
      | SCStandardPoodle  | 4     | 0.8    |
      | SCNewFoundland    | 2     | 0.4    |

  Scenario: animals that already had coats were left alone
    Then Colorful Coats the pawn kind "SCCollie" keeps 3 coats at a chance of "0.6"
    And Colorful Coats the pawn kind "SCDoberman" keeps 1 coats at a chance of "0.5"
    And Colorful Coats the pawn kind "SCCollie" keeps coats and none of them is one of this mod's tints

  Scenario: forty wild standard poodles wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild animals as "SCStandardPoodle"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged

  # Scenario 3: does a juvenile get a coat at all, and does it keep it on growing up.
  Scenario: forty wild standard poodle puppies wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild juvenile animals as "SCStandardPoodle"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged

  Scenario: poodle puppies keep their coats on growing up
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player juvenile "Pixie" as "SCStandardPoodle"
    And Colorful Coats spawns the player juvenile "Louis" as "SCStandardPoodle"
    And Colorful Coats spawns the player juvenile "Coco" as "SCStandardPoodle"
    And Colorful Coats spawns the player juvenile "Rex" as "SCStandardPoodle"
    When Colorful Coats records the coat of "Pixie"
    And Colorful Coats records the coat of "Louis"
    And Colorful Coats records the coat of "Coco"
    And Colorful Coats records the coat of "Rex"
    And Colorful Coats grows "Pixie" up
    And Colorful Coats grows "Louis" up
    And Colorful Coats grows "Coco" up
    And Colorful Coats grows "Rex" up
    Then Colorful Coats the coat of "Pixie" is the one recorded
    And Colorful Coats the coat of "Louis" is the one recorded
    And Colorful Coats the coat of "Coco" is the one recorded
    And Colorful Coats the coat of "Rex" is the one recorded
    And no errors were logged

  Scenario: a dog keeps its coat through a save and reload
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player animal "Bella" as "SCGoldenRetriever"
    When Colorful Coats records the coat of "Bella"
    And I save and reload
    Then Colorful Coats the coat of "Bella" is the one recorded
    And no errors were logged
