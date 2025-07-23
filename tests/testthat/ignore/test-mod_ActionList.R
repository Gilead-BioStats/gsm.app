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

test_that("mod_ActionList_Server returns the most recently clicked item", {
  testServer(
    mod_ActionList_Server,
    args = list(
      chrLinkIDs = letters
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactiveVal")

      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(a = click0)
      expect_null(rctv_toReturn())

      # Module should return the most recently clicked link.
      session$setInputs(a = 1L)
      expect_equal(rctv_toReturn(), "a")
      session$setInputs(b = 1L)
      expect_equal(rctv_toReturn(), "b")
      session$setInputs(a = 2L)
      expect_equal(rctv_toReturn(), "a")
    }
  )
})
