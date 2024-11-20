test_that("sample_fnFetchData returns expected data", {
  expect_no_error({
    test_result <- sample_fnFetchData("Subject")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c(
      "SubjectID",
      "enrolled",
      "study_start_date",
      "days_on_study",
      "treatment_start_date",
      "days_on_treatment",
      "age",
      "sex",
      "race",
      "ethnicity"
    )
  )
  expect_equal(nrow(test_result), 243)
})
