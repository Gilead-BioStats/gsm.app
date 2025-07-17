test_that("mod_CascadingSelect_UI creates expected UI", {
  expect_snapshot(mod_CascadingSelect_UI("test", strLabel = "Test Label"))
})

test_that("mod_CascadingSelect_Server orchestrates state changes correctly", {
  l_choices <- list(
    A = c("a1", "a2", "a3"),
    B = c("b1", "b2")
  )
  rctv_strDependent <- reactiveVal("A")
  rctv_strSelection <- reactiveVal("a2")

  testServer(
    mod_CascadingSelect_Server,
    args = list(
      rctv_strDependent = rctv_strDependent,
      l_chrChoices = l_choices,
      rctv_strSelection = rctv_strSelection,
      lglUpdateLabel = TRUE
    ),
    {
      # Initial state is correct
      expect_equal(rctv_strSelection(), "a2")
      session$setInputs(select = "a2")

      # Changing dependency triggers new state & clears input$select.
      rctv_strDependent("B")
      session$flushReact()
      expect_equal(rctv_strSelection(), "All")

      session$setInputs(select = "b1")
      expect_equal(rctv_strSelection(), "b1")

      # Changing dependency triggers new state & clears input$select.
      rctv_strDependent("A")
      session$flushReact()
      expect_equal(rctv_strSelection(), "All") # Should reset again.

      session$setInputs(select = "a3")
      expect_equal(rctv_strSelection(), "a3")
    }
  )
})
