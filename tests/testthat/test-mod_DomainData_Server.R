test_that("mod_DomainData_Server sets placeholder when no data is available", {
  call <- rlang::current_env()
  testServer(
    mod_DomainData_Server,
    args = list(
      id = "myPD",
      rctv_dfDomain = shiny::reactive({NULL})
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
      rctv_dfDomain = mock_data$AE
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
      rctv_dfDomain = mock_data$DATACHG
    ),
    {
      table_data <- rctv_tblData()
      expect_equal(nrow(table_data), 3)
      expect_equal(table_data$col1, 6:8)
    }
  )
})
