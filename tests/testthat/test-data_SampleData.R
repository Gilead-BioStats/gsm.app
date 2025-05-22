test_that("sample_fnFetchData returns expected data", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c(
      "SubjectID",
      "GroupID",
      "country",
      "subject_nsv",
      "enrollyn",
      "timeonstudy",
      "firstparticipantdate",
      "firstdosedate",
      "timeontreatment",
      "agerep",
      "sex",
      "race",
      "mincreated_dts",
      "GroupLevel"
    )
  )
  expect_equal(nrow(test_result), 192)
})

test_that("sample_fnFetchData returns expected data by Site", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strGroupID = "0X1858")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c(
      "SubjectID",
      "GroupID",
      "country",
      "subject_nsv",
      "enrollyn",
      "timeonstudy",
      "firstparticipantdate",
      "firstdosedate",
      "timeontreatment",
      "agerep",
      "sex",
      "race",
      "mincreated_dts",
      "GroupLevel"
    )
  )
  expect_equal(nrow(test_result), 11)
})

test_that("sample_fnFetchData returns expected data by Subject", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strSubjectID = "S50530")
  })
  expect_s3_class(test_result, c("tbl_df", "tbl", "data.frame"))

  expect_named(
    test_result,
    c(
      "SubjectID",
      "GroupID",
      "country",
      "subject_nsv",
      "enrollyn",
      "timeonstudy",
      "firstparticipantdate",
      "firstdosedate",
      "timeontreatment",
      "agerep",
      "sex",
      "race",
      "mincreated_dts",
      "GroupLevel"
    )
  )
  expect_equal(nrow(test_result), 1)
})

test_that("sample_fnFetchData throws an error in one situation", {
  expect_error(
    sample_fnFetchData("LB", "0X3349"),
    class = "gsm.app-error-sample_data-demo"
  )
})

test_that("sample_fnFetchData can filter by date", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-01-31")
  })
  expect_equal(nrow(test_result), 123)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-02-29")
  })
  expect_equal(nrow(test_result), 364)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-03-21")
  })
  expect_equal(nrow(test_result), 572)
})

test_that("sample_fnFetchData accepts strGroupLevel arg", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", strGroupLevel = "whatever")
  })
  expect_equal(nrow(test_result), 572)
})
