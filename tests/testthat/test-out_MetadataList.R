test_that("out_MetadataList generates the expected html", {
  test_result <- out_MetadataList(
    1:3,
    c("labelA", "labelB", "labelC")
  )
  expect_s3_class(test_result, "shiny.tag.list")
  expect_s3_class(test_result[[1]], "html_dependency")
  expect_s3_class(test_result[[2]], "shiny.tag")
  expect_s3_class(test_result[[3]], "shiny.tag")
  expect_s3_class(test_result[[4]], "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})

test_that("out_MetadataList uses names", {
  test_result <- out_MetadataList(c(labelA = 1, labelB = 2, labelC = 3))
  expect_s3_class(test_result, "shiny.tag.list")
  expect_s3_class(test_result[[1]], "html_dependency")
  expect_s3_class(test_result[[2]], "shiny.tag")
  expect_s3_class(test_result[[3]], "shiny.tag")
  expect_s3_class(test_result[[4]], "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})
