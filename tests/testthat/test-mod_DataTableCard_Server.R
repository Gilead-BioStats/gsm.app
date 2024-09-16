test_that("mod_DataTableCard_Server sets things up from arguments", {
  # Define mock data for the reactive inputs
  mock_data <- list(
    tableOne = data.frame(col1 = 1:5, col2 = letters[1:5]),
    tableTwo = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )

  testServer(
    mod_DataTableCard_Server,
    args = list(
      rctv_lData = reactive({
        mock_data
      }),
      rctv_strName = reactive({
        "tableOne"
      })
    ),
    {
      # Check that the table output is rendered correctly
      table_data <- rctv_selectedTable()
      expect_equal(nrow(table_data), 5)
      expect_equal(table_data$col1, 1:5)

      # Check that the title is rendered correctly
      output_title <- output$title
      expect_type(output_title, "character")
      expect_equal(output_title, "Table One")
    }
  )

  testServer(
    mod_DataTableCard_Server,
    args = list(
      rctv_lData = reactive({
        mock_data
      }),
      rctv_strName = reactive({
        "tableTwo"
      })
    ),
    {
      # Check that the table output is rendered correctly
      table_data <- rctv_selectedTable()
      expect_equal(nrow(table_data), 3)
      expect_equal(table_data$col1, 6:8)

      # Check that the title is rendered correctly
      output_title <- output$title
      expect_type(output_title, "character")
      expect_equal(output_title, "Table Two")
    }
  )
})

test_that("mod_DataTableCard_Server uses selection for return value", {
  # Define mock data for the reactive inputs
  mock_data <- list(
    table1 = data.frame(col1 = 1:5, col2 = letters[1:5]),
    table2 = data.frame(col1 = 6:8, col2 = LETTERS[6:8])
  )

  testServer(
    mod_DataTableCard_Server,
    args = list(
      rctv_lData = reactive({
        mock_data
      }),
      rctv_strName = reactive({
        "table1"
      })
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
