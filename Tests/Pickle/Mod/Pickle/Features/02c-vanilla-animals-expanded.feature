# Pass 2bis-c: Vanilla Animals Expanded alone beside this mod, with the framework it needs
# (wsl-deps.vae.map). The sibling coat port is not staged: pass 3 covers it.

Feature: Vanilla Animals Expanded alone

  Scenario: Vanilla Animals Expanded and this mod are loaded, and this mod loads after it
    Then mod "VanillaExpanded.VanillaAnimalsExpanded" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" loads after "VanillaExpanded.VanillaAnimalsExpanded"
    And mod "Qux.stray.dogs" is not loaded
    And mod "akairo.LetsHaveaCat" is not loaded
    And mod "Erin.Cats" is not loaded
    And mod "cucumpear.azrael.varietycoats" is not loaded
    And mod "nelim.colorfulcoats.vae" is not loaded
    And no def "SCPug" exists
    And no def "akaNEKO_Persian" exists

  Scenario: no animal received two coat lists, and the operations aimed at absent mods left no trace
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.colorfulcoats.catsanddogs"

  Scenario Outline: <kind> kept the coats this mod gave it
    Then Colorful Coats the pawn kind "<kind>" keeps <count> coats at a chance of "<chance>"
    And Colorful Coats every coat of "<kind>" is a colour and not a texture

    Examples:
      | kind        | count | chance |
      | AEXP_Beagle | 3     | 0.6    |
      | AEXP_Corgi  | 3     | 0.6    |

  Scenario: forty wild beagles wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild animals as "AEXP_Beagle"
    Then Colorful Coats between 40 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 3 different coats
    And no errors were logged

  Scenario: forty wild beagle puppies wear several different coats
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 40 wild juvenile animals as "AEXP_Beagle"
    Then Colorful Coats between 40 and 100 percent of the batch wear an alternate coat
    And Colorful Coats the batch wears at least 3 different coats
    And no errors were logged

  Scenario: beagle puppies keep their coats on growing up
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player juvenile "Snoopy" as "AEXP_Beagle"
    And Colorful Coats spawns the player juvenile "Milo" as "AEXP_Beagle"
    And Colorful Coats spawns the player juvenile "Otis" as "AEXP_Beagle"
    And Colorful Coats spawns the player juvenile "Daisy" as "AEXP_Beagle"
    When Colorful Coats records the coat of "Snoopy"
    And Colorful Coats records the coat of "Milo"
    And Colorful Coats records the coat of "Otis"
    And Colorful Coats records the coat of "Daisy"
    And Colorful Coats grows "Snoopy" up
    And Colorful Coats grows "Milo" up
    And Colorful Coats grows "Otis" up
    And Colorful Coats grows "Daisy" up
    Then Colorful Coats the coat of "Snoopy" is the one recorded
    And Colorful Coats the coat of "Milo" is the one recorded
    And Colorful Coats the coat of "Otis" is the one recorded
    And Colorful Coats the coat of "Daisy" is the one recorded
    And no errors were logged

  Scenario: a dog keeps its coat through a save and reload
    Given the save "test-colony" is loaded
    And Colorful Coats spawns the player animal "Snoopy" as "AEXP_Beagle"
    When Colorful Coats records the coat of "Snoopy"
    And I save and reload
    Then Colorful Coats the coat of "Snoopy" is the one recorded
    And no errors were logged
