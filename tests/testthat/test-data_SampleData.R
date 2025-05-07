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
      "mincreated_dts"
    )
  )
  expect_equal(nrow(test_result), 227)
})

test_that("sample_fnFetchData returns expected data by Site", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strGroupID = "0X103")
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
      "mincreated_dts"
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
      "mincreated_dts"
    )
  )
  expect_equal(nrow(test_result), 1)
})

test_that("sample_fnFetchData throws an error in one situation", {
  expect_error(
    sample_fnFetchData("LB", "0X013"),
    class = "gsm.app-error-sample_data-demo"
  )
})

test_that("sample_fnFetchData can filter by date", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2018-01-01")
  })
  expect_equal(nrow(test_result), 1062)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2019-01-01")
  })
  expect_equal(nrow(test_result), 1150)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2020-01-01")
  })
  expect_equal(nrow(test_result), 1168)
})

test_that("sample_fnFetchData accepts strGroupLevel arg", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", strGroupLevel = "whatever")
  })
  expect_equal(nrow(test_result), 1168)
})
