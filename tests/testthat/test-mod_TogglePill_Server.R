test_that("mod_TogglePill_Server returns the state of the pill", {
  testServer(
    mod_TogglePill_Server,
    args = list(
      rctv_lglState = shiny::reactiveVal(FALSE)
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactiveVal")
      expect_false(rctv_toReturn())

      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(toggle_pill = click0)

      # The return value initializes to FALSE, and should stay that way until
      # the link is actually clicked.
      expect_false(rctv_toReturn())
      session$setInputs(toggle_pill = 1L)
      expect_true(rctv_toReturn())
      # And then it alternates.
      session$setInputs(toggle_pill = 2L)
      expect_false(rctv_toReturn())

      # The external reactive also impacts the setting when it changes.
      rctv_lglState(TRUE)
      session$flushReact()
      expect_true(rctv_toReturn())

      # Make sure it still works.
      session$setInputs(toggle_pill = 3L)
      expect_false(rctv_toReturn())
      session$setInputs(toggle_pill = 4L)
      expect_true(rctv_toReturn())
    }
  )
})
