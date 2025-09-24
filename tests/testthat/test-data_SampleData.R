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
  expect_equal(nrow(test_result), 179)
})

test_that("sample_fnFetchData returns expected data by Site", {
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strGroupID = targetGroupID)
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
  expect_equal(nrow(test_result), 2)
})

test_that("sample_fnFetchData returns expected data by Subject", {
  targetSubjectID <- sort(unique(sample_dfAnalyticsInput$SubjectID))[[2]]
  expect_no_error({
    test_result <- sample_fnFetchData("SUBJ", strSubjectID = targetSubjectID)
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
    sample_fnFetchData("LB", "0X9917"),
    class = "gsm.app-error-sample_data-demo"
  )
})

test_that("sample_fnFetchData can filter by date", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-01-31")
  })
  expect_equal(nrow(test_result), 113)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-02-29")
  })
  expect_equal(nrow(test_result), 227)
  expect_no_error({
    test_result <- sample_fnFetchData("AE", dSnapshotDate = "2012-03-21")
  })
  expect_equal(nrow(test_result), 514)
})

test_that("sample_fnFetchData accepts strGroupLevel arg", {
  expect_no_error({
    test_result <- sample_fnFetchData("AE", strGroupLevel = "Country")
  })
  expect_equal(nrow(test_result), 514)
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
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]
  DataCounter <- ConstructDataCounter(sample_fnFetchData)
  expect_equal(DataCounter("AE"), 514)
  expect_equal(DataCounter("AE", strGroupID = targetGroupID), 7)
  expect_equal(DataCounter("SUBJ", strGroupID = targetGroupID), 2)
})

test_that("sample_fnCountData returns expected counts", {
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]
  targetSubjectID <- sort(unique(sample_dfAnalyticsInput$SubjectID))[[2]]
  expect_equal(sample_fnCountData("SUBJ"), nrow(sample_fnFetchData("SUBJ")))
  expect_equal(sample_fnCountData("AE"), nrow(sample_fnFetchData("AE")))
  expect_equal(
    sample_fnCountData("SUBJ", strGroupID = targetGroupID),
    nrow(sample_fnFetchData("SUBJ", strGroupID = targetGroupID))
  )
  expect_equal(
    sample_fnCountData("SUBJ", strSubjectID = targetSubjectID),
    nrow(sample_fnFetchData("SUBJ", strSubjectID = targetSubjectID))
  )
  expect_equal(
    sample_fnCountData("AE", dSnapshotDate = "2012-01-31"),
    nrow(sample_fnFetchData("AE", dSnapshotDate = "2012-01-31"))
  )
  expect_equal(
    sample_fnCountData("AE", strGroupLevel = "Country"),
    nrow(sample_fnFetchData("AE", strGroupLevel = "Country"))
  )
})
