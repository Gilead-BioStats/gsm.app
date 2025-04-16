# Everything else is seen as "covered" via other tests.

test_that("srvr_DomainHash generates hashes", {
  rctvDomain <- shiny::reactiveVal()
  strDomainID <- "mtcars"
  rctv_strSiteID <- shiny::reactiveVal("a")
  rctv_strSubjectID <- shiny::reactiveVal("a")

  # Can't bind cache without full reactive domain.
  local_mocked_bindings(
    bindCache = function(x, ...) x
  )

  test_result <- srvr_DomainHash(
    rctvDomain,
    strDomainID,
    rctv_strSiteID,
    rctv_strSubjectID
  )
  val1 <- isolate(test_result())
  expect_snapshot({val1})
  rctvDomain(mtcars)
  val2 <- isolate(test_result())
  expect_snapshot({val2})
  rctvDomain(dplyr::filter(mtcars, cyl == 6))
  val3 <- isolate(test_result())
  expect_snapshot({val3})

  rctvDomain(mtcars)
  val4 <- isolate(test_result())

  expect_equal(val2, val4)
})
