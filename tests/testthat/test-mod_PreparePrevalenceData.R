test_that("PreparePrevalenceData deals with empty df", {
  expect_null(PreparePrevalenceData(data.frame()))
  expect_null(PreparePrevalenceData(NULL))
})

test_that("PreparePrevalenceData adds VizLevel column", {
  df <- dplyr::tibble(a = 1:5)
  df_Prepared <- PreparePrevalenceData(df, strLevel = "Study")
  expect_in("VizLevel", colnames(df_Prepared))
  expect_identical(df_Prepared$VizLevel, rep("Study", 5))
})

test_that("PreparePrevalenceData filters by GroupLevel when present", {
  df <- dplyr::tibble(GroupLevel = c("A", "B"))
  dfA <- dplyr::tibble(GroupLevel = "A")
  dfB <- dplyr::tibble(GroupLevel = "B")
  expect_identical(
    PreparePrevalenceData(df, strGroupLevel = "A", strLevel = "Study"),
    dplyr::tibble(VizLevel = "Study")
  )
})

test_that("mod_PreparePrevalenceData_Server returns expected values", {
  testServer(
    mod_PreparePrevalenceData_Server,
    args = list(
      strLevel = "Study",
      l_rctvActive = list(Study = reactiveVal()),
      rctv_dfData = reactiveVal(dfStudyPrevalencePlots),
      rctv_strGroupLevel = reactiveVal("Site")
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactiveVal")
      expect_null(rctv_toReturn())

      l_rctvActive$Study("Study")
      session$flushReact()
      expect_s3_class(rctv_toReturn(), "tbl")
      expect_setequal(
        colnames(rctv_toReturn()),
        c("VizLevel", "category")
      )

      l_rctvActive$Study("")
      session$flushReact()
      expect_null(rctv_toReturn())
    }
  )
})
