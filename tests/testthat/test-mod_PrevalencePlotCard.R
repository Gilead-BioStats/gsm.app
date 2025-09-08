test_that("mod_PrevalencePlotCard_UI creates expected UI", {
  expect_snapshot(mod_PrevalencePlotCard_UI("test"))
})

test_that("mod_PrevalencePlotCard_Server orchestrates the input", {
  testServer(
    mod_PrevalencePlotCard_Server,
    args = list(
      rctv_dfDomain = reactiveVal(dfParticipantPrevalencePlots),
      rctv_dfDomain_Group = reactiveVal(dfGroupPrevalencePlots),
      rctv_dfDomain_Study = reactiveVal(dfStudyPrevalencePlots),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strGroupID = reactiveVal("A"),
      rctv_strSubjectID = reactiveVal("A1"),
      l_rctvDomainLoaded = list(Study = reactiveVal(FALSE))
    ),
    {
      # Some simple checks that the stuff inside this module is happening. Each
      # piece is tests in its own module.
      expect_type(l_rctvActive, "list")
      expect_named(l_rctvActive, c("Study", "Group", "Participant"))
      expect_s3_class(rctv_strCategory, "reactive")
    }
  )
})
