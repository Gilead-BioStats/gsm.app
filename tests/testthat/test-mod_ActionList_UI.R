test_that("mod_ActionList_UI creates the expected UI", {
  expect_cleaned_html({
    mod_ActionList_UI(
      id = "listID",
      chrLinkIDs = state.abb[1:3],
      chrLabels = state.name[1:3],
      chrValues = 1:3
    )
  })
})
