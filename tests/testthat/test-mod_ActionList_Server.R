test_that("mod_ActionList_Server returns the most recently clicked item", {
  testServer(
    mod_ActionList_Server,
    args = list(
      rctv_chrIDs = reactiveVal(letters)
    ),
    {
      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(a = click0)
      expect_null(session$returned())

      # Module should return the most recently clicked link.
      session$setInputs(a = 1L)
      expect_equal(session$returned(), "a")
      session$setInputs(b = 1L)
      expect_equal(session$returned(), "b")
      session$setInputs(a = 2L)
      expect_equal(session$returned(), "a")

      # Reset to no available IDs.
      rctv_chrIDs(NULL)
      session$flushReact()
      expect_null(session$returned())

      # Reset to a new list of IDs.
      rctv_chrIDs(c("d", "e", "f"))
      session$flushReact()
      expect_null(session$returned())

      # Make sure it still works.
      session$setInputs(f = click0)
      expect_null(session$returned())
      session$setInputs(f = 1L)
      expect_equal(session$returned(), "f")
    }
  )
})
