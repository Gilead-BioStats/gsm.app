test_that("mod_GroupInput_UI creates the expected UI with multiple levels", {
  dfGroups <- dplyr::tibble(
    GroupID = c(paste0("site", 1:5), paste0("country", 1:5)),
    GroupLevel = c(rep("Site", 5), rep("Country", 5))
  )
  test_result <- mod_GroupInput_UI("testing", dfGroups)
  expect_type(test_result, "list")
  expect_s3_class(test_result[[1]], "shiny.tag")
  expect_s3_class(test_result[[2]], "shiny.tag")
  expect_cleaned_html({
    test_result[[1]]
  })
  expect_cleaned_html({
    test_result[[2]]
  })
})

test_that("mod_GroupInput_Server initializes for single level", {
  lGroups <- list(
    Site = paste0("site", 1:5)
  )
  rctv_strGroupID <- reactiveVal()
  rctv_strGroupLevel <- reactiveVal()
  testServer(
    mod_GroupInput_Server,
    args = list(
      id = "testing",
      lGroups = lGroups,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel
    ),
    {
      expect_equal(rctv_strGroupLevel(), "Site")
    }
  )
})

test_that("mod_GroupInput_Server updates when GroupLevel changes", {
  lGroups <- list(
    Site = paste0("site", 1:5),
    Country = paste0("country", 1:5)
  )
  rctv_strGroupID <- reactiveVal()
  rctv_strGroupLevel <- reactiveVal()
  testServer(
    mod_GroupInput_Server,
    args = list(
      id = "testing",
      lGroups = lGroups,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel
    ),
    {
      # Initialize.
      session$setInputs(
        level = "Country",
        group = "country1"
      )
      expect_equal(rctv_strGroupID(), "country1")

      session$setInputs(
        level = "Site"
      )
      expect_equal(rctv_strGroupLevel(), "Site")

      # I can't see the shinyWidgets::updateVirtualSelect() from here. Will need
      # to test in shinytest2 once I have ~real data.
    }
  )
})
