test_that("mod_DynamicLabelKey_UI creates expected UI", {
  expect_snapshot(mod_DynamicLabelKey_UI("test"))
})

test_that("mod_DynamicLabelKey_Server dynamically updates its reactives", {
  call <- rlang::current_env()
  rctv_strGroupLevel <- reactiveVal("Site")
  rctv_strGroupID <- reactiveVal("All")
  rctv_strSubjectID <- reactiveVal("specified")

  testServer(
    mod_DynamicLabelKey_Server,
    args = list(
      id = "test",
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strSubjectID = rctv_strSubjectID
    ),
    {
      # Since there's a participant, it should initialize at false. But we need
      # to flush for it to see that.
      session$flushReact()
      expect_false(rctv_lglStudySelected())
      session$setInputs(Study = "Study")
      expect_true(rctv_lglStudySelected())

      expect_false(rctv_lglGroupSelected())
      rctv_strGroupID("specified")
      expect_false(rctv_lglGroupSelected())
      session$setInputs(Group = "Group")
      expect_true(rctv_lglGroupSelected())
      expect_equal(rctv_strGroupLabel(), "Site specified")

      expect_true(rctv_lglParticipantSelected())
      expect_equal(rctv_strParticipantLabel(), "Participant specified")
      rctv_strSubjectID("All")
      expect_false(rctv_lglParticipantSelected())
      expect_equal(rctv_strParticipantLabel(), character())
    }
  )
})
