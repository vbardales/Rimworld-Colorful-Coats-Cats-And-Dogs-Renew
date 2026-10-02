# Images for the Workshop page. Rule of the owner, 2026-10-02: a gallery shot is a staged photograph, never
# the defaults; a story for the series, one common set, a subject whose every detail matches what is shown.
#
# THE STORY. "Miel's morning in the glade." Miel keeps the flower glade of the studio colony, and every
# morning the animals of the neighbouring farms come to her, each breed in the coats that nobody had painted
# for it until now. One photograph per breed: Miel stands behind the row, in a garment chosen to make the
# coats read (the animals are pale or brown, so her colours are deep and cool, one per image), a lamp on
# each side, and the glade for background, the same from one image to the next. Set up, photographed, taken
# down, next image. No tooltip, no development tools, no HUD.
#
# COMPOSITION. A row: one animal of every coat the mod gives the breed, the original coat first, facing the
# camera (a step builds it; it fails under 3 coats and when an animal is outside the view). Miel one cell
# behind the middle of the row. Order proposed after 0-preview.png: 1 poodles (four of purpleyam's own
# coats), 2 white cats (five coats), 3 huskies (the base game's dog that nobody varies).
#
# Map: wsl-deps.galerie.map, English only. Skipped in every other pass (it needs the studio fixture). Each
# image is opened and looked at before it is called ready; a green run says nothing about the picture.
# Finished images go to Art/Gallery/ as 1-, 2-, 3-.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused

  Scenario: Miel and the standard poodles, one of each coat
    Given Colorful Coats lines up one "SCStandardPoodle" of each coat near the cell 154 98
    And Colorful Coats places the colonist "Miel" at the cell 154 96 facing the camera
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Duster" dyed rgb (38, 62, 96)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (149, 97)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (159, 97)
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the poodles"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  Scenario: Miel and the white cats, one of each coat
    Given Colorful Coats lines up one "akaNEKO_shironeko" of each coat near the cell 154 98
    And Colorful Coats places the colonist "Miel" at the cell 154 96 facing the camera
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Duster" dyed rgb (58, 82, 64)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (149, 97)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (159, 97)
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the white cats"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had

  Scenario: Miel and the huskies, one of each coat
    Given Colorful Coats lines up one "Husky" of each coat near the cell 154 98
    And Colorful Coats places the colonist "Miel" at the cell 154 96 facing the camera
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Duster" dyed rgb (96, 44, 52)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (149, 97)
    And Nelim's Pickle Tools: I place the decor "StandingLamp" at (159, 97)
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the huskies"
    When Nelim's Pickle Tools: screenshot mode is disabled
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: "Miel" gets back the clothes it had
