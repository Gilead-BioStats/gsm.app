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
  expect_equal(nrow(test_result), 173)
})

test_that("sample_fnFetchData returns expected data by Site", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strGroupID = "0X1372")
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
  expect_equal(nrow(test_result), 13)
})

test_that("sample_fnFetchData returns expected data by Subject", {
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strSubjectID = "S47823")
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
  expect_equal(nrow(test_result), 169)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-02-29")
  })
  expect_equal(nrow(test_result), 337)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-03-21")
  })
  expect_equal(nrow(test_result), 512)
})

test_that("sample_fnFetchData accepts strGroupLevel arg", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", strGroupLevel = "Country")
  })
  expect_equal(nrow(test_result), 512)
})

test_that("sample_fnFetchData deals with dSnapshotDate for SUBJ", {
  dSnapshotDate <- as.Date("2012-02-29")
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", dSnapshotDate = dSnapshotDate)
  })
  expect_lte(
    max(test_result$firstparticipantdate),
    dSnapshotDate
  )
  expect_lte(
    max(test_result$firstdosedate),
    dSnapshotDate
  )
})

test_that("ConstructDataCounter works", {
  DataCounter <- ConstructDataCounter(sample_fnFetchData)
  expect_equal(DataCounter("AE"), 512)
  expect_equal(DataCounter("AE", strGroupID = "0X902"), 41)
  expect_equal(DataCounter("SUBJ", strGroupID = "0X902"), 9)
})
