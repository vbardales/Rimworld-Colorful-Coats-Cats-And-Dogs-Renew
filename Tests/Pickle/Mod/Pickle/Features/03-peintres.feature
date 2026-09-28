# Pass 3: the mods that already paint coats for animals in this list, which this mod must stand
# aside for - Animal Variety Coats, Erin's Cat Overhaul, and the sibling port Colorful Coats -
# Vanilla Animals Expanded! Renew. Painted coats beat tinted ones, and two coat lists on one animal
# is the fault the whole design exists to prevent. Not a declared incompatibility: this mod names
# all three in loadAfter, and this pass checks that the promise holds.

Feature: Standing aside for the mods that paint

  Scenario: the painters are loaded, before this mod
    Then mod "cucumpear.azrael.varietycoats" is loaded
    And mod "Erin.Cats" is loaded
    And mod "nelim.colorfulcoats.vaerenew" is loaded
    And mod "nelim.colorfulcoats.catsanddogs" loads after "cucumpear.azrael.varietycoats"
    And mod "nelim.colorfulcoats.catsanddogs" loads after "Erin.Cats"
    And mod "nelim.colorfulcoats.catsanddogs" loads after "nelim.colorfulcoats.vaerenew"

  # Erin's Cat Overhaul loads after Animal Variety Coats and appends its list without checking, so a
  # red here may be theirs and not ours. Read the log line before concluding: if it names an animal
  # this mod also patches, it is ours.
  Scenario: no animal received two coat lists
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.colorfulcoats.catsanddogs"

  # The animals a painter owns keep coats, and none of them is one of ours. The colour-only coat is
  # the signature: painted coats always carry a texture path.
  Scenario Outline: <kind> stayed with <owner>
    Then Colorful Coats the pawn kind "<kind>" keeps coats and none of them is one of this mod's tints

    Examples:
      | owner                    | kind              |
      | Erin's Cat Overhaul      | Cat               |
      | Animal Variety Coats     | Husky             |
      | Animal Variety Coats     | LabradorRetriever |
      | the sibling Vanilla port | AEXP_Chihuahua    |
      | the sibling Vanilla port | AEXP_CatSiamese   |
      | the sibling Vanilla port | AEXP_Poodle       |

  # The sibling port and this mod are disjoint on purpose: seven Vanilla Animals Expanded breeds it
  # never painted are ours, and none of its fourteen are. The two must never name one breed.
  Scenario: the seven breeds the sibling never painted are ours
    Then Colorful Coats the pawn kind "AEXP_Beagle" keeps 3 coats at a chance of "0.6"
    And Colorful Coats every coat of "AEXP_Beagle" is a colour and not a texture
    And Colorful Coats the pawn kind "AEXP_CatAbyssinian" keeps 3 coats at a chance of "0.6"

  Scenario: an animal a painter owns and one of ours can share a map
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 20 wild animals as "AEXP_Chihuahua"
    And Colorful Coats spawns 20 wild animals as "AEXP_Beagle"
    Then Colorful Coats the batch wears at least 2 different coats
    And no errors were logged
