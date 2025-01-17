test_that("mod_gtBidirectional_UI() generates the expected UI", {
  test_result <- mod_gtBidirectional_UI("myUI")
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_gtBidirectional_Server starts as expected and updates", {
  call <- rlang::current_env()

  dfData <- data.frame(a = 1:3, b = 4:6)
  rctv_gtObj <- reactive({
    gt::gt(dfData) %>% out_gtInteractive()
  })
  rct_strA <- reactiveVal(NULL)

  testServer(
    mod_gtBidirectional_Server,
    args = list(
      id = "testinggtBidrect",
      rctv_dfData = reactive(dfData),
      rctv_gtObject = rctv_gtObj,
      rctv_strInput = rct_strA,
      strLabel = "a",
      strEmpty = "None"
    ),
    {
      test_result <- output$`table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      gt_id <- stringr::str_extract(test_html, 'div id="(\\w+)"', 1)
      test_html <- stringr::str_replace_all(test_html, gt_id, "gtRandID")
      expect_cleaned_html(
        test_html,
        call = call
      )

      rct_strA(2L)
      test_result <- output$`table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      gt_id <- stringr::str_extract(test_html, 'div id="(\\w+)"', 1)
      test_html <- stringr::str_replace_all(test_html, gt_id, "gtRandID")
      expect_cleaned_html(
        test_html,
        call = call
      )
    }
  )
})

test_that("mod_gtBidirectional_Server returns selected thing", {
  dfData <- data.frame(a = 4:6, b = 7:9)
  rctv_gtObj <- reactive({
    gt::gt(dfData) %>% out_gtInteractive()
  })
  rct_strA <- reactiveVal(NULL)

  testServer(
    mod_gtBidirectional_Server,
    args = list(
      id = "testinggtBidrect",
      rctv_dfData = reactive(dfData),
      rctv_gtObject = rctv_gtObj,
      rctv_strInput = rct_strA,
      strLabel = "a",
      strEmpty = "None"
    ),
    {
      expect_null(input$`table`)
      expect_null(session$returned())
      # Without this I don't think the gt data registers properly.
      session$flushReact()
      session$setInputs(`table` = 3L)
      expect_equal(session$returned(), 6L)
      session$setInputs(`table` = 0L)
      expect_equal(session$returned(), "None")
      session$setInputs(`table` = NULL)
      expect_null(session$returned())
    }
  )
})
