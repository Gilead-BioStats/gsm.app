test_that("mod_ChartTitleSelect_UI creates expected UI", {
  expect_snapshot(mod_ChartTitleSelect_UI("test"))
})

test_that("mod_ChartTitleSelect_Server returns its input value", {
  rctv_strGroupID <- reactiveVal()
  rctv_strSubjectID <- reactiveVal()
  rctv_chrChoices <- reactiveVal(c("Value 1" = "val1", "Value 2" = "val2"))

  testServer(
    mod_ChartTitleSelect_Server,
    args = list(
      id = "test",
      l_rctvLabels = list(
        "#1b9e77" = "Study",
        "#d95f02" = rctv_strGroupID,
        "#7570b3" = rctv_strSubjectID
      ),
      rctv_chrChoices = rctv_chrChoices
    ),
    {
      expected_value <- "val1"
      session$setInputs(select = expected_value)
      expect_equal(session$getReturned()(), expected_value)
    }
  )
})
