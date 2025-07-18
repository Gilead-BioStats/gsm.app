#' Confirm that an object is valid lPlugins
#'
#' @inheritParams shared-params
#' @returns `lPlugins` with normalized names.
#' @keywords internal
validate_lPlugins <- function(lPlugins, envCall = rlang::caller_env()) {
  # TODO: This does not validate everything (or even very much) about plugins.
  # Most validation is currently in `plugin_Read()`.
  if (length(lPlugins)) {
    names(lPlugins)[!rlang::have_name(lPlugins)] <- stringr::str_pad(
      which(!rlang::have_name(lPlugins)),
      width = 3,
      pad = "0"
    )
  }
  return(lPlugins)
}

#' Confirm that an object is valid chrDomains
#'
#' @inheritParams shared-params
#' @returns `chrDomains` with names in all caps.
#' @keywords internal
validate_chrDomains <- function(
  chrDomains,
  lPlugins = NULL,
  envCall = rlang::caller_env()
) {
  # Fill in any missing names.
  names(chrDomains) <- toupper(
    dplyr::coalesce(
      dplyr::na_if(rlang::names2(chrDomains), ""),
      chrDomains
    )
  )

  if (length(lPlugins)) {
    # TODO: This does not catch things 100%. See #436 for things related to
    # this.
    chrPluginDomains <- purrr::map(lPlugins, function(lPlugin) {
      if (length(lPlugin$workflows)) { # nocov start
        rlang::check_installed("gsm.mapping", "to process data for plugins.")
        return(gsm.mapping::CombineSpecs(lPlugin$workflows))
      } # nocov end
      return(lPlugin$spec)
    }) %>%
      purrr::list_c() %>%
      names() %>%
      toupper() %>%
      unique()
    pluginDomainIsKnown <- chrPluginDomains %in% c(
      names(chrDomains),
      toupper(chrDomains)
    )
    missing_domains <- chrPluginDomains[!pluginDomainIsKnown]
    if (length(missing_domains)) {
      gsmappAbort(
        c(
          "All {.arg lPlugins} domains must be included in {.arg chrDomains}.",
          x = "Missing domains: {.field {missing_domains}}."
        ),
        strClass = "invalid_input",
        envCall = envCall
      )
    }
  }

  return(chrDomains)
}

## df-specific Validation Functions ----

#' Confirm that an object is a dfResults
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfResults <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c(
      "GroupID", "Numerator", "Denominator", "Metric", "Score", "Flag",
      "MetricID", "SnapshotDate"
    )
  )
}

#' Confirm that an object is a dfGroups
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfGroups <- function(x, dfResults) {
  x <- CheckDF(
    x,
    chrRequiredColumns = c("GroupLevel", "Param", "Value", "GroupID")
  )
  # dfResults isn't validated yet at this point, so do minimal validation.
  if (is.data.frame(dfResults)) {
    groupCols <- c("GroupID", "GroupLevel")
    if (any(groupCols %in% colnames(dfResults))) {
      dfGroupStudy <- x %>%
        dplyr::filter(.data$GroupLevel == "Study") %>%
        dplyr::distinct(.data$GroupID, .data$GroupLevel)

      dfGroupsUsed <- dfResults %>%
        dplyr::select(dplyr::any_of(groupCols)) %>%
        dplyr::distinct() %>%
        dplyr::bind_rows(dfGroupStudy)

      x <- dplyr::semi_join(
        x,
        dfGroupsUsed,
        by = groupCols
      )
    }
  }
}

#' Confirm that an object is a dfMetrics
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfMetrics <- function(x) {
  CheckDF(x, chrRequiredColumns = c("MetricID", "Metric"))
}

#' Confirm that an object is a dfBounds
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfBounds <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c("Threshold", "Denominator", "Numerator", "MetricID")
  )
}

#' Confirm that an object is a dfAnalyticsInput
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfAnalyticsInput <- function(x) {
  x <- CheckDF(
    x,
    chrRequiredColumns = c(
      "GroupLevel",
      "GroupID",
      "Metric",
      "MetricID",
      "SubjectID",
      "Numerator",
      "Denominator"
    )
  )
  return(x)
}
