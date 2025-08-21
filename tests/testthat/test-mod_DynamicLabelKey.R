test_that("mod_DynamicLabelKey_UI creates expected UI", {
  expect_snapshot(mod_DynamicLabelKey_UI("test"))
})

test_that("mod_DynamicLabelKey_Server dynamically generates HTML labels", {
  call <- rlang::current_env()
  rctv_strGroupID <- reactiveVal()
  rctv_strSubjectID <- reactiveVal()

  testServer(
    mod_DynamicLabelKey_Server,
    args = list(
      id = "test",
      l_rctvLabels = list(
        "#1b9e77" = "Study",
        "#d95f02" = rctv_strGroupID,
        "#7570b3" = rctv_strSubjectID
      )
    ),
    {
      # Initial state is correct.
      expect_cleaned_html(output$key$html, call = call)

      # Group appears when set.
      rctv_strGroupID("GROUP_SET")
      session$flushReact()
      expect_cleaned_html(output$key$html, call = call)

      # Participant appears when set.
      rctv_strSubjectID("SUBJECT_SET")
      session$flushReact()
      expect_cleaned_html(output$key$html, call = call)
    }
  )
})
