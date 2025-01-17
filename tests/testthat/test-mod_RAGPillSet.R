test_that("mod_RAGPillSet_UI creates the expected UI", {
  test_result <- mod_RAGPillSet_UI("pill_set_id", 12, 7)
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_RAGPillSet_Server responds to external state", {
  testServer(
    mod_RAGPillSet_Server,
    args = list(
      id = "test_id",
      rctv_strGroupSubset = shiny::reactiveVal("red")
    ),
    {
      rctv_toReturn <- session$getReturned()
      session$flushReact()
      expect_equal(rctv_toReturn(), "red")

      rctv_strGroupSubset("amber")
      session$flushReact()
      expect_equal(rctv_toReturn(), "amber")

      rctv_strGroupSubset("red/amber")
      session$flushReact()
      expect_equal(rctv_toReturn(), "red/amber")

      rctv_strGroupSubset("")
      session$flushReact()
      expect_equal(rctv_toReturn(), "all")

      rctv_strGroupSubset("all")
      session$flushReact()
      expect_equal(rctv_toReturn(), "all")
    }
  )
})
