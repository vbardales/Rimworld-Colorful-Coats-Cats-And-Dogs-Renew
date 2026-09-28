# Pass 2: the three mods this one paints for, together - Stray Dogs, Let's Have a Cat!, Vanilla
# Animals Expanded - and the framework the last one needs. None excludes another. English only,
# for the reason given in 01.

Feature: The animals of the three target mods

  Scenario: the three targets and this mod are loaded, and this mod loads after all of them
    Then mod "Qux.stray.dogs" is loaded
    And mod "akairo.LetsHaveaCat" is loaded
    And mod "VanillaExpanded.VanillaAnimalsExpanded" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" loads after "Qux.stray.dogs"
    And mod "nelim.colorfulcoats.catsanddogs" loads after "akairo.LetsHaveaCat"
    And mod "nelim.colorfulcoats.catsanddogs" loads after "VanillaExpanded.VanillaAnimalsExpanded"

  # The one real risk of this mod: two coat lists on one animal. The loader keeps one of them at
  # random and logs "defines the same field twice: alternateGraphics". Every conditional exists to
  # prevent it, and this is where a broken one would be caught by the game itself.
  Scenario: no animal received two coat lists
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.colorfulcoats.catsanddogs"

  Scenario Outline: <kind> of <source> kept the coats this mod gave it
    Then Colorful Coats the pawn kind "<kind>" keeps <count> coats at a chance of "<chance>"
    And Colorful Coats every coat of "<kind>" is a colour and not a texture

    Examples:
      | source                   | kind              | count | chance |
      | Stray Dogs               | SCPug             | 2     | 0.5    |
      | Stray Dogs               | SCGoldenRetriever | 3     | 0.6    |
      | Stray Dogs               | SCStandardPoodle  | 4     | 0.8    |
      | Stray Dogs               | SCNewFoundland    | 2     | 0.4    |
      | Let's Have a Cat!        | akaNEKO_shironeko | 5     | 0.8    |
      | Let's Have a Cat!        | akaNEKO_Persian   | 4     | 0.7    |
      | Vanilla Animals Expanded | AEXP_Beagle       | 3     | 0.6    |
      | Vanilla Animals Expanded | AEXP_Corgi        | 3     | 0.6    |

  # Standing aside where a coat already exists. The collie and the doberman came with their own
  # from Stray Dogs, and must still have them, untouched.
  Scenario: animals that already had coats were left alone
    Then Colorful Coats the pawn kind "SCCollie" keeps 3 coats at a chance of "0.6"
    And Colorful Coats the pawn kind "SCDoberman" keeps 1 coats at a chance of "0.5"
    And Colorful Coats the pawn kind "SCCollie" keeps coats and none of them is one of this mod's tints

  # The black cat's sprite averages 29 out of 255: a tint multiplies, so every one would land within
  # two shades of the original. It is left out on purpose and must stay out.
  Scenario: the black cat has no coats, on purpose
    Then Colorful Coats the pawn kind "akaNEKO_kuroneko" keeps no coat list

  # Their own four poodle coats, in their own order: the one breed where the palette lands home.
  Scenario: the standard poodle wears purpleyam's four poodle coats
    Then Colorful Coats the pawn kind "SCStandardPoodle" has a coat coloured 246 244 215
    And Colorful Coats the pawn kind "SCStandardPoodle" has a coat coloured 138 113 98
    And Colorful Coats the pawn kind "SCStandardPoodle" has a coat coloured 102 94 90
    And Colorful Coats the pawn kind "SCStandardPoodle" has a coat coloured 242 205 190

  Scenario: forty wild standard poodles wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild animals as "SCStandardPoodle"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged

  Scenario: a dog and a cat keep their coats through a save and reload
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player animal "Bella" as "SCGoldenRetriever"
    And Colorful Coats spawns the player animal "Mimi" as "akaNEKO_Persian"
    When Colorful Coats records the coat of "Bella"
    And Colorful Coats records the coat of "Mimi"
    And I save and reload
    Then Colorful Coats the coat of "Bella" is the one recorded
    And Colorful Coats the coat of "Mimi" is the one recorded
    And no errors were logged

  # Scenario 2 of _tools/FUNCTIONAL-SCENARIOS.md, the one that matters. The dogs of Stray Dogs keep
  # their textures in a Unity asset bundle, so their base colours could not be measured offline:
  # what these tints land on has never been seen. A person opens these and judges.
  @review
  Scenario: standard poodles side by side, the breed with four coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 12 wild animals as "SCStandardPoodle" close together
    When Colorful Coats frames the batch
    Then I take a screenshot "poodles - the four coats"
    And no errors were logged

  @review
  Scenario: newfoundlands side by side, the darkest dog and the one a tint can barely change
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 12 wild animals as "SCNewFoundland" close together
    When Colorful Coats frames the batch
    Then I take a screenshot "newfoundlands - the darkest dog"
    And no errors were logged

  @review
  Scenario: persian cats side by side, one of the two lightest cat sprites
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 12 wild animals as "akaNEKO_Persian" close together
    When Colorful Coats frames the batch
    Then I take a screenshot "persians - the lightest cats"
    And no errors were logged
