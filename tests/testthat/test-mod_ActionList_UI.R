test_that("mod_ActionList_UI creates the expected UI", {
  test_result <- mod_ActionList_UI(
    "listID",
    chrLinkIDs = state.abb[1:3],
    chrLabels = state.name[1:3],
    chrValues = 1:3
  )
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})
