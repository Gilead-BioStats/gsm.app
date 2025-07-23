test_that("mod_Plugin_UI creates the expected UI", {
  test_result <- mod_Plugin_UI(
    lPlugin = list(
      meta = list(ID = "TEST", Name = "Plugin Test"),
      shiny = list(UI = function(id) "TestUI")
    ),
    id = "testID"
  )
  expect_s3_class(test_result, c("shiny.tag"))
  expect_cleaned_html({
    test_result
  })
})

test_that("FindUsedArgs matches args properly", {
  lAvailableArgs <- c(
    unlist(list(
      Study = list(
        AE = "AE_Study",
        ENROLL = "ENROLL_Study",
        SUBJ = "SUBJ_Study"
      ),
      Group = list(
        AE = "AE_Group",
        ENROLL = "ENROLL_Group",
        SUBJ = "SUBJ_Group"
      ),
      Selection = list(
        AE = "AE_Selection",
        ENROLL = "ENROLL_Selection",
        SUBJ = "SUBJ_Selection"
      )
    )),
    list(
      rctv_dSnapshotDate = "rctv_dSnapshotDate",
      rctv_strDomainID = "rctv_strDomainID",
      rctv_strMetricID = "rctv_strMetricID",
      rctv_strGroupID = "rctv_strGroupID",
      rctv_strGroupLevel = "rctv_strGroupLevel",
      rctv_strSubjectID = "rctv_strSubjectID"
    )
  )
  # Throw in this verification for an ~easy check if something weird changes in
  # R itself.
  expect_setequal(
    names(lAvailableArgs),
    c(
      "Study.AE", "Study.ENROLL", "Study.SUBJ", "Group.AE", "Group.ENROLL",
      "Group.SUBJ", "Selection.AE", "Selection.ENROLL", "Selection.SUBJ",
      "rctv_dSnapshotDate", "rctv_strDomainID", "rctv_strMetricID",
      "rctv_strGroupID", "rctv_strGroupLevel", "rctv_strSubjectID"
    )
  )

  expect_snapshot_value({
    FindUsedArgs(
      lAvailableArgs,
      c(
        "rctv_dfAE",
        "rctv_dfAE_study",
        "strGroupID",
        "strGroupLevel"
      )
    )
  })
})
