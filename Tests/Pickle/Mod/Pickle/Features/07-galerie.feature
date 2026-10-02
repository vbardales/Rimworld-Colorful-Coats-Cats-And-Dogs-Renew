# Images for the Workshop page, on the owner's showcase colony (rules of 2026-09-25 / 2026-10-01 in
# PUBLISHING.md). Map: wsl-deps.galerie.map, English only. Skipped in every other pass: it asks for the studio
# fixture. Never part of passes 1 to 3.
#
#   - Each shot is a row: one animal of every coat the mod gives a breed, in a line, facing the camera, the
#     original coat first. Composition by the scenario, never by the dice; the step fails under 3 coats.
#   - The scene is the studio's flower glade near cell 154,98. No tooltip: the pointer goes to bare grass.
#   - Developer mode is turned off for the capture; the HUD is hidden by the game's screenshot mode.
#   - Order proposed for the page after 0-preview.png: 1 poodles (the breed whose four coats are purpleyam's
#     own), 2 white cats (the widest range, 5 coats), 3 huskies (a base-game dog nobody else varies).
#   - Each image is opened and looked at before it is called ready; a green run does not say the image shows
#     anything. Finished images are copied to Art/Gallery/ as 1-, 2-, 3-.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused

  Scenario: standard poodles, one of each coat
    Given Colorful Coats lines up one "SCStandardPoodle" of each coat near the cell 154 98
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the poodles"

  Scenario: white cats, one of each coat
    Given Colorful Coats lines up one "akaNEKO_shironeko" of each coat near the cell 154 98
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the white cats"

  Scenario: huskies, one of each coat
    Given Colorful Coats lines up one "Husky" of each coat near the cell 154 98
    When Colorful Coats frames the row at zoom 10
    And Nelim's Pickle Tools: I move the mouse to (960, 1000)
    And Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: screenshot mode is enabled around the open windows
    Then I take a screenshot "Workshop page, the huskies"
