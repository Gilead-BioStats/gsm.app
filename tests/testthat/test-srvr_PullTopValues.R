# dfs dfStudyPrevalencePlots, dfGroupPrevalencePlots, and
# dfParticipantPrevalencePlots  are defined in helper-PrevalencePlots.R
test_that("PullTopValues returns most frequent values from Study only", {
  expect_identical(
    PullTopValues(dfStudyPrevalencePlots, "category"),
    c("s", "i", "m", "f", "w")
  )
})

test_that("PullTopValues returns most frequent values from Study + Group", {
  dfCombined <- purrr::list_rbind(
    list(
      dfStudyPrevalencePlots,
      dfGroupPrevalencePlots
    )
  )
  expect_identical(
    PullTopValues(dfCombined, "category"),
    c("s", "i", "m", "f", "w")
  )
})

test_that("PullTopValues returns most frequent values from Study + Group + Participant", {
  dfCombined <- purrr::list_rbind(
    list(
      dfStudyPrevalencePlots,
      dfGroupPrevalencePlots,
      dfParticipantPrevalencePlots
    )
  )
  expect_identical(
    PullTopValues(dfCombined, "category"),
    c("s", "i", "m", "f", "w")
  )
})

test_that("PullTopValues returns most frequent values from Study + Participant", {
  dfCombined <- purrr::list_rbind(
    list(
      dfStudyPrevalencePlots,
      dfParticipantPrevalencePlots
    )
  )
  expect_identical(
    PullTopValues(dfCombined, "category"),
    c("s", "i", "m", "f", "w")
  )
})

test_that("PullTopValues returns most frequent values from Group + Participant", {
  dfCombined <- purrr::list_rbind(
    list(
      dfGroupPrevalencePlots,
      dfParticipantPrevalencePlots
    )
  )
  expect_identical(
    PullTopValues(dfCombined, "category"),
    c("m", "s", "a", "i", "j")
  )
})

test_that("PullTopValues returns most frequent values from Participant", {
  expect_identical(
    PullTopValues(dfParticipantPrevalencePlots, "category"),
    c("a", "i", "m", "n", "o")
  )
})

test_that("PullTopValues returns empty vector for empty df", {
  expect_identical(
    PullTopValues(dplyr::tibble(), "category"),
    character()
  )
})

test_that("PullTopValues returns empty vector for df without column", {
  expect_identical(
    PullTopValues(dfParticipantPrevalencePlots, "other"),
    character()
  )
})

test_that("PullTopValues returns most frequent values with < 6 options", {
  df <- dplyr::filter(
    dfParticipantPrevalencePlots,
    .data$category %in% c("a", "i", "m")
  )
  expect_identical(
    PullTopValues(df, "category"),
    c("a", "i", "m")
  )
})

test_that("srvr_PullTopValues returns a reactive version of values from Participant", {
  rctv_dfDomain <- reactiveVal(dfParticipantPrevalencePlots)
  rctv_strCategory <- reactiveVal("category")
  result <- srvr_PullTopValues(rctv_dfDomain, rctv_strCategory)
  expect_s3_class(result, "reactive")
  expect_identical(
    isolate(result()),
    c("a", "i", "m", "n", "o")
  )
  rctv_dfDomain(dfStudyPrevalencePlots)
  expect_identical(
    isolate(result()),
    c("s", "i", "m", "f", "w")
  )
})
