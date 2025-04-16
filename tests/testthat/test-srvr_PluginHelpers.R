test_that("srvr_CompileUnsetInputs compiles unset inputs", {
  l_rctvInputs = list(
    rctv_dSnapshotDate = reactiveVal(),
    rctv_strDomainID = reactiveVal(),
    rctv_strMetricID = reactiveVal(),
    rctv_strSiteID = reactiveVal(),
    rctv_strSubjectID = reactiveVal()
  )
  chrInputNamesPretty <- c(
    "snapshot date",
    "domain",
    "metric",
    "site",
    "participant"
  )

  rctv_chrMissing <- srvr_CompileUnsetInputs(
    chrRequiredInputs = "Site",
    l_rctvInputs = l_rctvInputs,
    chrInputNamesPretty = chrInputNamesPretty
  )
  expect_equal(isolate(rctv_chrMissing()), "site")

  l_rctvInputs$rctv_dSnapshotDate("2019-11-01")
  expect_equal(isolate(rctv_chrMissing()), "site")

  l_rctvInputs$rctv_strSiteID("1234")
  expect_length(isolate(rctv_chrMissing()), 0)
})

test_that("srvr_CombineHashes generates a reactive that combines used hashes", {
  l_rctvDomainHashes <- list(
    a = reactiveVal(rlang::hash(1)),
    b = reactiveVal(rlang::hash(2)),
    c = reactiveVal(rlang::hash(3))
  )
  rctv_strCombined_ac <- srvr_CombineHashes(
    l_rctvDomainHashes,
    list(a = list(), c = list())
  )
  val1 <- isolate(rctv_strCombined_ac())
  l_rctvDomainHashes$a(rlang::hash(4))
  val2 <- isolate(rctv_strCombined_ac())
  l_rctvDomainHashes$b(rlang::hash(5))
  val3 <- isolate(rctv_strCombined_ac())
  l_rctvDomainHashes$a(rlang::hash(1))
  val4 <- isolate(rctv_strCombined_ac())

  expect_snapshot(val1)
  expect_snapshot(val2)
  expect_equal(val2, val3)
  expect_equal(val1, val4)
})

test_that("FinalWorkflowOutputNames finds the expected names", {
  lWorflows <- list(
    a = list(
      steps = list(
        list(a = 1, output = "a1"),
        list(b = 3, output = "b3"),
        list(c = 5, output = "c5")
      )
    ),
    b = list(
      steps = list(
        list(a = 1, output = "a2"),
        list(b = 3, output = "b4"),
        list(c = 5, output = "c6")
      )
    )
  )
  expect_equal(
    FinalWorkflowOutputNames(lWorflows),
    c(a = "c5", b = "c6")
  )
})
