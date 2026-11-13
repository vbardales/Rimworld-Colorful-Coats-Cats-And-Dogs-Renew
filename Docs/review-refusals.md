# Review refusals

ChatGPT suggestions refused in /review-translation, with the reason.

| Key or text | Proposal | Reason | Date |
|---|---|---|---|
| CHANGELOG.md, [Unreleased] / Added, Run-Functional-Tests.ps1 bullet, "Twenty-two tests, seventeen of which..." | Rewrite as "There are twenty-two tests: seventeen have been seen to fail under a mutation; ..." | Misread: the bullet already ends with full sentences ("Seventeen have been seen to fail under a mutation; the other five assert the game's behaviour and cannot be made to fail from this repository."). The lead is a list-item noun phrase, not a fragment. | 2026-11-12 |
| PUBLICATION.md line 93, "About.xml is read once, when the item is created" | Verify the claim before publication, no text change proposed | Kept: it states the documented publication process of this repository (the page description is set by the CI, update_description, from the Markdown block of PUBLICATION.md), not a claim about the Steam API. ChatGPT proposed no change either. | 2026-11-13 |
