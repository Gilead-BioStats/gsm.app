test_that("CombineDomainData deals with empty dfs", {
  expect_equal(
    NROW(CombineDomainData(NULL, NULL, NULL)),
    0L
  )
})

test_that("CombineDomainData combines", {
  dfDummy <- dplyr::tibble(a = 1:3)
  expect_equal(
    NROW(CombineDomainData(dfDummy, dfDummy, dfDummy)),
    9
  )
})

test_that("CombineDomainData factor-izes VizLevel", {
  combined <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Study", "Group", "Participant"))

  combined <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    NULL
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Study", "Group"))

  combined <- CombineDomainData(
    dfStudyPrevalencePlots,
    NULL,
    dfParticipantPrevalencePlots
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Study", "Participant"))

  combined <- CombineDomainData(
    NULL,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Group", "Participant"))

  combined <- CombineDomainData(
    dfStudyPrevalencePlots,
    NULL,
    NULL
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Study"))

  combined <- CombineDomainData(
    NULL,
    dfGroupPrevalencePlots,
    NULL
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Group"))

  combined <- CombineDomainData(
    NULL,
    NULL,
    dfParticipantPrevalencePlots
  )
  expect_s3_class(combined$VizLevel, "factor")
  expect_equal(levels(combined$VizLevel), c("Participant"))
})

test_that("mod_CombineDomainData_Server returns the combined data", {
  testServer(
    mod_CombineDomainData_Server,
    args = list(
      l_rctvActive = list(
        Study = reactiveVal(),
        Group = reactiveVal(),
        Participant = reactiveVal()
      ),
      rctv_dfDomain_Study = reactiveVal(dfStudyPrevalencePlots),
      rctv_dfDomain_Group = reactiveVal(dfGroupPrevalencePlots),
      rctv_dfDomain = reactiveVal(dfParticipantPrevalencePlots),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strGroupID = reactiveVal("A"),
      rctv_strSubjectID = reactiveVal("A1")
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactive")
      expect_s3_class(rctv_toReturn(), "data.frame")
      expect_equal(NROW(rctv_toReturn()), 0L)

      l_rctvActive$Study("Study")
      session$flushReact()
      expect_s3_class(rctv_toReturn(), "tbl")
      expect_setequal(
        colnames(rctv_toReturn()),
        c("VizLevel", "category")
      )
      expect_s3_class(rctv_toReturn()$VizLevel, "factor")
      expect_equal(levels(rctv_toReturn()$VizLevel), c("Study"))

      l_rctvActive$Group("Group")
      session$flushReact()
      expect_s3_class(rctv_toReturn(), "tbl")
      expect_setequal(
        colnames(rctv_toReturn()),
        c("VizLevel", "category")
      )
      expect_s3_class(rctv_toReturn()$VizLevel, "factor")
      expect_equal(levels(rctv_toReturn()$VizLevel), c("Study", "Group"))

      l_rctvActive$Participant("Participant")
      session$flushReact()
      expect_s3_class(rctv_toReturn(), "tbl")
      expect_setequal(
        colnames(rctv_toReturn()),
        c("VizLevel", "category")
      )
      expect_s3_class(rctv_toReturn()$VizLevel, "factor")
      expect_equal(
        levels(rctv_toReturn()$VizLevel),
        c("Study", "Group", "Participant")
      )
    }
  )
})
