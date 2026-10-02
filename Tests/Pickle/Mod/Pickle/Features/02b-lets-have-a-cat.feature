# Pass 2bis-b: Let's Have a Cat! alone beside this mod (wsl-deps.lets-have-a-cat.map).

Feature: Let's Have a Cat! alone

  Scenario: Let's Have a Cat! and this mod are loaded, nothing else, and this mod loads after it
    Then mod "akairo.LetsHaveaCat" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" loads after "akairo.LetsHaveaCat"
    And mod "Qux.stray.dogs" is not loaded
    And mod "VanillaExpanded.VanillaAnimalsExpanded" is not loaded
    And mod "Erin.Cats" is not loaded
    And mod "cucumpear.azrael.varietycoats" is not loaded
    And no def "SCPug" exists
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
      | akaNEKO_shironeko | 5     | 0.8    |
      | akaNEKO_Persian   | 4     | 0.7    |

  Scenario: the black cat has no coats, on purpose
    Then Colorful Coats the pawn kind "akaNEKO_kuroneko" keeps no coat list

  Scenario: forty wild white cats wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild animals as "akaNEKO_shironeko"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged

  Scenario: forty wild kittens wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild juvenile animals as "akaNEKO_shironeko"
    Then Colorful Coats between 55 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 4 different coats
    And no errors were logged

  Scenario: kittens keep their coats on growing up
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player juvenile "Mimi" as "akaNEKO_shironeko"
    And Colorful Coats spawns the player juvenile "Luna" as "akaNEKO_shironeko"
    And Colorful Coats spawns the player juvenile "Neko" as "akaNEKO_shironeko"
    And Colorful Coats spawns the player juvenile "Tama" as "akaNEKO_shironeko"
    When Colorful Coats records the coat of "Mimi"
    And Colorful Coats records the coat of "Luna"
    And Colorful Coats records the coat of "Neko"
    And Colorful Coats records the coat of "Tama"
    And Colorful Coats grows "Mimi" up
    And Colorful Coats grows "Luna" up
    And Colorful Coats grows "Neko" up
    And Colorful Coats grows "Tama" up
    Then Colorful Coats the coat of "Mimi" is the one recorded
    And Colorful Coats the coat of "Luna" is the one recorded
    And Colorful Coats the coat of "Neko" is the one recorded
    And Colorful Coats the coat of "Tama" is the one recorded
    And no errors were logged

  Scenario: a cat keeps its coat through a save and reload
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player animal "Mimi" as "akaNEKO_Persian"
    When Colorful Coats records the coat of "Mimi"
    And I save and reload
    Then Colorful Coats the coat of "Mimi" is the one recorded
    And no errors were logged
