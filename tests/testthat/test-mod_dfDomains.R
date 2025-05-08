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
