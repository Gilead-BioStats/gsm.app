test_that("mod_ParticipantDomain_Server sets title and placeholder when no data is available", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(NULL),
      rctv_strName = reactive(NULL)
    ),
    {
      output_title <- output$title
      expect_equal(output_title, "Participant Domain")
      expect_cleaned_html(
        output$details$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantDomain_Server sets title and placeholder when data is available but no table name is selected", {
  mock_data <- list(
    tableOne = data.frame(col1 = 1:5, col2 = letters[1:5]),
    tableTwo = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(mock_data),
      rctv_strName = reactive(NULL)
    ),
    {
      output_title <- output$title
      expect_equal(output_title, "Participant Domain")
      expect_cleaned_html(
        output$details$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantDomain_Server renders selected table names correctly", {
  mock_data <- list(
    tableOne = data.frame(col1 = 1:5, col2 = letters[1:5]),
    tableTwo = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )
  call <- rlang::current_env()

  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(mock_data),
      rctv_strName = reactive("tableOne")
    ),
    {
      table_data <- rctv_selectedTable()
      expect_equal(nrow(table_data), 5)
      expect_equal(table_data$col1, 1:5)

      output_title <- output$title
      expect_equal(output_title, "Table One")
    }
  )

  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(mock_data),
      rctv_strName = reactive("tableTwo")
    ),
    {
      table_data <- rctv_selectedTable()
      expect_equal(nrow(table_data), 3)
      expect_equal(table_data$col1, 6:8)

      output_title <- output$title
      expect_equal(output_title, "Table Two")
    }
  )
})

test_that("mod_ParticipantDomain_Server handles non-existent table name gracefully", {
  mock_data <- list(
    tableOne = data.frame(col1 = 1:5, col2 = letters[1:5]),
    tableTwo = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(mock_data),
      rctv_strName = reactive("nonexistent_table")
    ),
    {
      expect_null(rctv_selectedTable())
      expect_equal(output$title, "Participant Domain")
    }
  )
})

test_that("mod_ParticipantDomain_Server uses selection for return value", {
  mock_data <- list(
    tableOne = data.frame(col1 = 1:5, col2 = letters[1:5]),
    tableTwo = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )
  testServer(
    mod_ParticipantDomain_Server,
    args = list(
      rctv_lData = reactive(mock_data),
      rctv_strName = reactive("tableOne")
    ),
    {
      expect_equal(rctv_intSelectedRows(), NULL)

      session$setInputs(table_rows_selected = c(2, 4))
      expect_equal(rctv_intSelectedRows(), c(2, 4))

      session$setInputs(table_rows_selected = c(1, 3))
      expect_equal(rctv_intSelectedRows(), c(1, 3))
    }
  )
})
