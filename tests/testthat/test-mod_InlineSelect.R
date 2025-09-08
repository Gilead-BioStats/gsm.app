test_that("mod_InlineSelect_UI produces the expected UI", {
  test_result <- mod_InlineSelect_UI("test")
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
  test_result <- mod_InlineSelect_UI(
    "test",
    strLabel = "Label",
    chrChoices = letters
  )
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_InlineSelect_Server returns the selected value", {
  testServer(
    mod_InlineSelect_Server,
    {
      rctv_toReturn <- session$getReturned()
      session$setInputs(select = "a")
      expect_identical(rctv_toReturn(), "a")
      session$setInputs(select = "b")
      expect_identical(rctv_toReturn(), "b")
    }
  )
})
