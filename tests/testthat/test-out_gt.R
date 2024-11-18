test_that("out_gtInteractive() generates the expected object", {
  test_result <- out_gtInteractive(gt::gt(data.frame(a = 1:3, b = 4:6), id = "gt-test"))
  expect_s3_class(test_result, c("gt_tbl", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result)
  })
})

test_that("out_gtPlaceholder() generates the expected object", {
  test_result <- out_gtPlaceholder("site", id = "testPlaceholder")
  expect_s3_class(test_result, c("gt_tbl", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result)
  })
  test_result <- out_gtPlaceholder("site", "subject", id = "testPlaceholder")
  expect_s3_class(test_result, c("gt_tbl", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result)
  })
})

test_that("out_gtSmartFmtNumbers() formats numbers as expected", {
  df <- data.frame(a = c(0.1, 0.11, 0.111), b = c(0.001, 0.00011, 1.001))
  test_result <- out_gtSmartFmtNumbers(gt::gt(df, id = "gt-test"))
  expect_s3_class(test_result, c("gt_tbl", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result)
  })
})
