# Everything else is seen as "covered" via other tests.

test_that("srvr_DomainHash generates hashes", {
  rctv_dfDomain <- shiny::reactiveVal()
  strDomainID <- "mtcars"
  rctv_strGroupID <- shiny::reactiveVal("a")
  rctv_strGroupLevel <- shiny::reactiveVal("Site")
  rctv_strSubjectID <- shiny::reactiveVal("a")

  # Can't bind cache without full reactive domain.
  local_mocked_bindings(
    bindCache = function(x, ...) x
  )

  test_result <- srvr_DomainHash(
    rctv_dfDomain,
    strDomainID,
    rctv_strGroupID,
    rctv_strGroupLevel,
    rctv_strSubjectID
  )
  val1 <- isolate(test_result())
  expect_snapshot({
    val1
  })
  rctv_dfDomain(mtcars)
  val2 <- isolate(test_result())
  expect_snapshot({
    val2
  })
  rctv_dfDomain(dplyr::filter(mtcars, cyl == 6))
  val3 <- isolate(test_result())
  expect_snapshot({
    val3
  })

  rctv_dfDomain(mtcars)
  val4 <- isolate(test_result())

  expect_equal(val2, val4)
})

test_that("Server-level data errors informatively", {
  local_mocked_bindings(
    bindCache = function(x, ...) {
      x
    },
    withProgress = function(message, x) {
      x
    },
    srvr_ShowConditionMessage = function(cnd, ...) {
      class(cnd)
    }
  )
  fnFetchData <- function(...) {
    rlang::abort(class = "test-error")
  }
  test_result <- srvr_dfDomain(
    "AE",
    fnFetchData,
    l_rctvDomainLoaded = list(Study = reactiveVal(FALSE)),
    rctv_dSnapshotDate = function() "2025-01-01",
    rctv_strGroupID = NULL,
    rctv_strGroupLevel = NULL,
    rctv_strSubjectID = NULL
  )
  expect_setequal(
    isolate(test_result$Study()),
    c("test-error", "rlang_error", "error", "condition")
  )
})
