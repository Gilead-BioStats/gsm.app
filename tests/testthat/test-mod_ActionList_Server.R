test_that("mod_ActionList_Server returns the most recently clicked item", {
  testServer(
    mod_ActionList_Server,
    args = list(
      rctv_chrIDs = reactiveVal(letters)
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactiveVal")

      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(a = click0)
      expect_null(rctv_toReturn())

      # Module should return the most recently clicked link.
      session$setInputs(a = 1L)
      expect_equal(rctv_toReturn(), "a")
      session$setInputs(b = 1L)
      expect_equal(rctv_toReturn(), "b")
      session$setInputs(a = 2L)
      expect_equal(rctv_toReturn(), "a")

      # Reset to no available IDs.
      rctv_chrIDs(NULL)
      session$flushReact()
      expect_null(rctv_toReturn())

      # Reset to a new list of IDs.
      rctv_chrIDs(c("d", "e", "f"))
      session$flushReact()
      expect_null(rctv_toReturn())

      # Make sure it still works.
      session$setInputs(f = click0)
      expect_null(rctv_toReturn())
      session$setInputs(f = 1L)
      expect_equal(rctv_toReturn(), "f")
    }
  )
})
