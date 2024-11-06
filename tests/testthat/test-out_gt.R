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
