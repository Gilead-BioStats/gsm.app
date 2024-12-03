test_that("sample_fnFetchData returns expected data", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c("studyid", "invid", "country", "SubjectID", "subject_nsv",
      "enrollyn", "timeonstudy", "firstparticipantdate", "firstdosedate",
      "timeontreatment", "agerep", "sex", "race", "ethnic", "GroupID"
    )
  )
  expect_equal(nrow(test_result), 243)
})

test_that("sample_fnFetchData returns expected data by Site", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strSiteID = "0X103")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c("studyid", "invid", "country", "SubjectID", "subject_nsv",
      "enrollyn", "timeonstudy", "firstparticipantdate", "firstdosedate",
      "timeontreatment", "agerep", "sex", "race", "ethnic", "GroupID"
    )
  )
  expect_equal(nrow(test_result), 5)
})

test_that("sample_fnFetchData returns expected data by Subject", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strSubjectID = "0008")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c("studyid", "invid", "country", "SubjectID", "subject_nsv",
      "enrollyn", "timeonstudy", "firstparticipantdate", "firstdosedate",
      "timeontreatment", "agerep", "sex", "race", "ethnic", "GroupID"
    )
  )
  expect_equal(nrow(test_result), 1)
})
