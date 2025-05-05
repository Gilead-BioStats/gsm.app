test_that("mod_DomainData_UI creates the expected UI", {
  test_result <- mod_DomainData_UI("myDomain", "Adverse Events", "AE")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_DomainData_Server sets placeholder when no data is available", {
  call <- rlang::current_env()
  testServer(
    mod_DomainData_Server,
    args = list(
      id = "myPD",
      rctv_dfDomain = reactive({NULL}),
      rctv_strGroupLevel = reactiveVal("Site")
    ),
    {
      test_html <- output$`gt-table`$html
      gt_id <- stringr::str_extract(test_html, 'div id="(\\w+)"', 1)
      test_html <- stringr::str_replace_all(test_html, gt_id, "gtRandID")
      expect_cleaned_html(
        test_html,
        call = call
      )
    }
  )
})

test_that("mod_DomainData_Server renders tables correctly", {
  mock_data <- list(
    AE = reactive(data.frame(col1 = 1:5, col2 = letters[1:5])),
    DATACHG = reactive(data.frame(col1 = 6:8, col2 = LETTERS[6:8]))
  )
  call <- rlang::current_env()

  testServer(
    mod_DomainData_Server,
    args = list(
      id = "AE",
      rctv_dfDomain = mock_data$AE,
      rctv_strDomainHash = reactiveVal("hash")
    ),
    {
      table_data <- rctv_tblData()
      expect_equal(nrow(table_data), 5)
      expect_equal(table_data$col1, 1:5)
    }
  )

  testServer(
    mod_DomainData_Server,
    args = list(
      id = "DATACHG",
      rctv_dfDomain = mock_data$DATACHG,
      rctv_strDomainHash = reactiveVal("hash")
    ),
    {
      table_data <- rctv_tblData()
      expect_equal(nrow(table_data), 3)
      expect_equal(table_data$col1, 6:8)
    }
  )
})
