# Scenario 2 of _tools/FUNCTIONAL-SCENARIOS.md for every breed whose capture has not been read yet: does a
# tint read as fur, and does it still read as that breed. Poodles, newfoundlands, persians (pass 2) and
# huskies (pass 1) were opened on 2026-09-28; these are the others. Map: wsl-deps.avec-cibles.map, filter
# 08-revue. A green run only says the route ran: every capture has to be opened and looked at, and what was
# seen written down (see Tests/Pickle/README.md, "Reading a result").

@review
Feature: every other breed, side by side

  Scenario Outline: twelve <breed> side by side
    Given the save "test-colony" is loaded
    And Colorful Coats spawns 12 wild animals as "<kind>" close together
    When Colorful Coats frames the batch
    Then I take a screenshot "<breed>"
    And no errors were logged

    Examples: Stray Dogs
      | kind                     | breed                  |
      | SCAfghanHound            | afghan hound           |
      | SCBorderCollie           | border collie          |
      | SCBorzoi                 | borzoi                 |
      | SCBullmastiff            | bullmastiff            |
      | SCBullTerrier            | bull terrier           |
      | SCCaucasianshepherd      | caucasian shepherd     |
      | SCChowchow               | chow chow              |
      | SCGoldenRetriever        | golden retriever       |
      | SCGreyhound              | greyhound              |
      | SCMiniatureDachshund     | miniature dachshund    |
      | SCOldEnglishSheepdog     | old english sheepdog   |
      | SCPug                    | pug                    |
      | SCSaintbernard           | saint bernard          |
      | SCSchnauzer              | schnauzer              |
      | SCWelshCorgi             | welsh corgi            |
      | StrayDogs_BerneseMountainDog | bernese mountain dog |
      | StrayDogs_SwedishVallhund | swedish vallhund      |

    Examples: Let's Have a Cat!
      | kind                       | breed                 |
      | akaNEKO_A_Shorthair        | american shorthair    |
      | akaNEKO_J_Bobtail          | japanese bobtail      |
      | akaNEKO_kijitora           | kijitora              |
      | akaNEKO_Maine_Coon         | maine coon            |
      | akaNEKO_N_Forest_Cat       | norwegian forest cat  |
      | akaNEKO_Russian_Blue       | russian blue          |
      | akaNEKO_Scottish_Fold      | scottish fold         |
      | akaNEKO_Scottish_Fold_Long | scottish fold long    |
      | akaNEKO_shironeko          | white cat             |
      | akaNEKO_Siamese            | siamese               |

    Examples: Vanilla Animals Expanded
      | kind               | breed               |
      | AEXP_Beagle        | beagle              |
      | AEXP_CatAbyssinian | abyssinian          |
      | AEXP_Corgi         | corgi               |
      | AEXP_FrenchBulldog | french bulldog      |
      | AEXP_GermanShepherd | german shepherd    |
      | AEXP_Pug           | vae pug             |
      | AEXP_WelshTerrier  | welsh terrier       |
