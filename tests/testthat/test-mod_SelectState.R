# SubsetChoices ----
test_that("SubsetChoices works with a valid dependency", {
  l_choices <- list(
    A = c("a1", "a2", "a3"),
    B = c("b1", "b2")
  )
  expect_equal(
    SubsetChoices("A", l_choices),
    c("All", "a1", "a2", "a3")
  )
})

test_that("SubsetChoices works with a NULL dependency", {
  l_choices <- list(
    A = c("a1", "a2", "a3"),
    B = c("b1", "b2")
  )
  all_choices <- c("All", "a1", "a2", "a3", "b1", "b2")
  expect_equal(
    SubsetChoices(NULL, l_choices),
    all_choices
  )
})

test_that("SubsetChoices errors with an invalid dependency", {
  l_choices <- list(
    A = c("a1", "a2", "a3"),
    B = c("b1", "b2")
  )
  expect_error(
    SubsetChoices("C", l_choices),
    class = "gsm.app-error-invalid_input"
  )
})

# ValidateSelected ----
test_that("ValidateSelected works with a valid selection", {
  choices <- c("All", "a", "b", "c")
  expect_equal(
    ValidateSelected("b", choices),
    "b"
  )
})

test_that("ValidateSelected returns default with an invalid selection", {
  choices <- c("All", "a", "b", "c")
  expect_equal(
    ValidateSelected("d", choices),
    "All"
  )
  expect_equal(
    ValidateSelected(NULL, choices),
    "All"
  )
})

test_that("ValidateSelected respects a custom default", {
  choices <- c("All", "a", "b", "c")
  expect_equal(
    ValidateSelected("d", choices, strDefault = "a"),
    "a"
  )
})

# mod_SelectState_Server ----
test_that("mod_SelectState_Server calculates state correctly", {
  l_choices <- list(
    A = c("a1", "a2", "a3"),
    B = c("b1", "b2")
  )
  rctv_strDependent <- reactiveVal("A")
  rctv_strCurrentSelection <- reactiveVal("a2")

  testServer(
    mod_SelectState_Server,
    args = list(
      rctv_strDependent = rctv_strDependent,
      l_chrChoices = l_choices,
      lglUpdateLabel = TRUE,
      rctv_strCurrentSelection = rctv_strCurrentSelection
    ),
    {
      # Check initial state
      expect_equal(
        session$returned$rctv_chrChoices(),
        c("All", "a1", "a2", "a3")
      )
      expect_equal(session$returned$rctv_strSelected(), "a2")
      expect_true(inherits(session$returned$rctv_strLabel(), "shiny.tag"))

      # Change dependency -> selection becomes invalid and should reset
      rctv_strDependent("B")
      session$flushReact()
      expect_equal(session$returned$rctv_chrChoices(), c("All", "b1", "b2"))
      expect_equal(session$returned$rctv_strSelected(), "All")

      # Change selection
      rctv_strCurrentSelection("b1")
      session$flushReact()
      expect_equal(session$returned$rctv_strSelected(), "b1")
    }
  )
})
