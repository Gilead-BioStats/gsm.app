test_that("mod_GroupInput_UI creates the expected UI with multiple levels", {
  dfGroups <- dplyr::tibble(
    GroupLevel = c(rep("Site", 5), rep("Country", 5)),
    GroupID = c(paste0("site", 1:5), paste0("country", 1:5))
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

test_that("mod_GroupInput_UI creates expected UI with a single level", {
  dfGroups <- dplyr::tibble(
    GroupLevel = "Site",
    GroupID = paste0("site", 1:5)
  )
  test_result <- mod_GroupInput_UI("testing", dfGroups)
  expect_type(test_result, "list")
  expect_s3_class(test_result[[1]], "shiny.tag")
  expect_cleaned_html({
    test_result[[1]]
  })
})

test_that("mod_GroupInput_Server works with a single group level", {
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
      session$setInputs(`group-select` = "site3")
      expect_equal(rctv_strGroupID(), "site3")
    }
  )
})


test_that("mod_GroupInput_Server orchestrates multi-level inputs correctly", {
  lGroups <- list(
    Site = paste0("site", 1:5),
    Country = c("USA", "CAN")
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
      # Initialize inputs because normally JS handles this.
      session$setInputs(
        `level-select` = "Site",
        `group-select` = "All"
      )

      # Initialized state
      expect_equal(rctv_strGroupLevel(), "Site")
      expect_equal(rctv_strGroupID(), "All")

      # Choices within same level are fine.
      session$setInputs(`group-select` = "site3")
      expect_equal(rctv_strGroupID(), "site3")

      # Changing Group Level resets Group.
      session$setInputs(`level-select` = "Country")
      expect_equal(rctv_strGroupLevel(), "Country")
      expect_equal(rctv_strGroupID(), "All")

      # External events changing GroupLevel resets Group.
      session$setInputs(`group-select` = "CAN")
      expect_equal(rctv_strGroupID(), "CAN")

      rctv_strGroupLevel("Site")
      session$flushReact()
      expect_equal(rctv_strGroupID(), "All")
    }
  )
})
