#' List of reactive domain dfs
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()]s with domain dfs.
#' @keywords internal
mod_dfDomains_Server <- function(
  id,
  fnFetchData,
  chrDomains,
  dfSubjectGroups,
  l_rctvDomainsLoaded,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    chrDomainIDs <- rlang::set_names(names(chrDomains), names(chrDomains))
    rctv_strGroupID_Inferred <- reactive({
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      if (is.null(strGroupID) && !is.null(strSubjectID)) {
        return(
          dfSubjectGroups$GroupID[
            dfSubjectGroups$GroupLevel == rctv_strGroupLevel() &
              dfSubjectGroups$SubjectID == strSubjectID
          ]
        )
      }
      return(rctv_strGroupID())
    }) %>%
      bindCache(rctv_strGroupLevel(), rctv_strGroupID(), rctv_strSubjectID())

    l_rctvDomains <- purrr::map(chrDomainIDs, function(this_domain) {
      srvr_dfDomain(
        this_domain,
        fnFetchData = fnFetchData,
        l_rctvDomainLoaded = l_rctvDomainsLoaded[[this_domain]],
        rctv_dSnapshotDate = rctv_dSnapshotDate,
        rctv_strGroupID = rctv_strGroupID_Inferred,
        rctv_strGroupLevel = rctv_strGroupLevel,
        rctv_strSubjectID = rctv_strSubjectID
      )
    })
    return(l_rctvDomains)
  })
}

#' Reactive domain df
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] that generates a domain df, or `NULL`. If
#'   `fnFetchData()` throws an error, that error is passed to the user via
#'   [srvr_ShowConditionMessage()].
#' @keywords internal
srvr_dfDomain <- function(
  strDomainID,
  fnFetchData,
  l_rctvDomainLoaded,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  rctv_dfStudy <- reactive({
    l_rctvDomainLoaded$Study(TRUE)
    withProgress(
      message = glue::glue("Loading {strDomainID} study-level data"),
      {
        tryCatch(
          {
            fnFetchData(
              strDomainID,
              strGroupID = NULL,
              strGroupLevel = rctv_strGroupLevel(),
              strSubjectID = NULL,
              dSnapshotDate = rctv_dSnapshotDate()
            )
          },
          error = function(cnd) {
            srvr_ShowConditionMessage(
              cnd,
              chrPreMessage = glue::glue(
                "Could not fetch study-level {strDomainID} data."
              ),
              strTitle = glue::glue("Error loading {strDomainID} data")
            )
          }
        )
      }
    )
  }) %>%
    bindCache(strDomainID, rctv_strGroupLevel())

  rctv_dfGroup <- reactive({
    strGroupLevel <- NullifyEmpty(rctv_strGroupLevel())
    strGroupID <- NullifyEmpty(rctv_strGroupID())
    dSnapshotDate <- rctv_dSnapshotDate()

    l_rctvDomainLoaded[[strGroupLevel]][[strGroupID]](TRUE)
    # nocov start (tested manually)
    if (l_rctvDomainLoaded$Study() && NROW(rctv_dfStudy())) {
      return(
        FilterDomainData(
          rctv_dfStudy(),
          strDomainID = strDomainID,
          dSnapshotDate = dSnapshotDate,
          strGroupLevel = strGroupLevel,
          strGroupID = strGroupID,
          strSubjectID = NULL
        )
      )
    }
    # nocov end
    withProgress(
      message = glue::glue(
        "Loading {strDomainID} data for {strGroupLevel} {strGroupID}."
      ),
      {
        tryCatch(
          {
            fnFetchData(
              strDomainID,
              strGroupID = strGroupID,
              strGroupLevel = strGroupLevel,
              strSubjectID = NULL,
              dSnapshotDate = rctv_dSnapshotDate()
            )
          },
          error = function(cnd) {
            srvr_ShowConditionMessage(
              cnd,
              chrPreMessage = glue::glue(
                "Could not fetch {strDomainID} data for {strGroupLevel} {strGroupID}."
              ),
              strTitle = glue::glue("Error loading {strDomainID} data")
            )
          }
        )
      }
    )
  }) %>%
    bindCache(strDomainID, rctv_strGroupLevel(), rctv_strGroupID())

  rctv_dfSelection <- reactive({
    strGroupLevel <- rctv_strGroupLevel()
    strGroupID <- NullifyEmpty(rctv_strGroupID())
    strSubjectID <- NullifyEmpty(rctv_strSubjectID())
    dSnapshotDate <- rctv_dSnapshotDate()

    if (!length(strGroupID) && !length(strSubjectID)) {
      return(rctv_dfStudy())
    }
    if (!length(strSubjectID)) {
      return(rctv_dfGroup())
    }
    # nocov start (tested manually)
    if (
      l_rctvDomainLoaded[[strGroupLevel]][[strGroupID]]() &&
        NROW(rctv_dfGroup())
    ) {
      return(
        FilterDomainData(
          rctv_dfGroup(),
          strDomainID = strDomainID,
          dSnapshotDate = dSnapshotDate,
          strGroupLevel = strGroupLevel,
          strGroupID = strGroupID,
          strSubjectID = strSubjectID
        )
      )
    }
    # nocov end
    if (l_rctvDomainLoaded$Study() && NROW(rctv_dfStudy())) {
      return(
        FilterDomainData(
          rctv_dfStudy(),
          strDomainID = strDomainID,
          dSnapshotDate = dSnapshotDate,
          strGroupLevel = strGroupLevel,
          strGroupID = strGroupID,
          strSubjectID = strSubjectID
        )
      )
    }
    withProgress(
      message = glue::glue("Loading {strDomainID} data for participant {strSubjectID}."),
      {
        tryCatch(
          {
            fnFetchData(
              strDomainID,
              strGroupID = strGroupID,
              strGroupLevel = strGroupLevel,
              strSubjectID = strSubjectID,
              dSnapshotDate = dSnapshotDate
            )
          },
          # nocov start (tested via shinytest2)
          error = function(cnd) {
            srvr_ShowConditionMessage(
              cnd,
              chrPreMessage = glue::glue(
                "Could not fetch data for the {strDomainID} domain."
              ),
              strTitle = glue::glue("Error loading {strDomainID} data")
            )
          }
          # nocov end
        )
      }
    )
  }) %>%
    bindCache(
      strDomainID,
      rctv_dSnapshotDate(),
      rctv_strGroupID(),
      rctv_strGroupLevel(),
      rctv_strSubjectID()
    )

  return(
    list(
      Study = rctv_dfStudy,
      Group = rctv_dfGroup,
      Selection = rctv_dfSelection
    )
  )
}

#' Filter Domain Data by Relevant Fields
#'
#' @inheritParams shared-params
#' @returns The data.frame, with filters applied.
#' @keywords internal
FilterDomainData <- function(
  df,
  strDomainID,
  dSnapshotDate = NULL,
  dfGroups = NULL,
  strGroupLevel = NULL,
  strGroupID = NULL,
  strSubjectID = NULL
) {
  strDomainID <- toupper(strDomainID)
  strGroupID <- NullifyEmpty(strGroupID)
  strSubjectID <- NullifyEmpty(strSubjectID)

  df <- FilterByGroupAndLevel(
    df,
    strGroupLevel = strGroupLevel,
    strGroupID = strGroupID,
    dfGroups = dfGroups
  )
  df <- FilterBySubjectID(df, strSubjectID = strSubjectID)
  chrDateFields <- c(
    AE = "mincreated_dts",
    ENROLL = "enroll_dt",
    LB = "lb_dt",
    PD = "deviationdate",
    SDRGCOMP = "mincreated_dts",
    STUDCOMP = "mincreated_dts",
    SUBJ = "firstparticipantdate",
    Visit = "visit_dt",
    DATACHG = "visit_date",
    DATAENT = "visit_date",
    QUERY = "created"
  )
  if (
    length(dSnapshotDate) &&
      strDomainID %in% names(chrDateFields) &&
      chrDateFields[[strDomainID]] %in% colnames(df)
  ) {
    df <- FilterBefore(df, chrDateFields[[strDomainID]], dSnapshotDate)
  }
  return(dplyr::select(df, "SubjectID", "GroupID", dplyr::everything()))
}

#' List of Reactive Domain df Hashes
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()]s with hashes of domain dfs.
#' @keywords internal
mod_DomainHashes_Server <- function(
  id,
  l_rctvDomains,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    l_rctvDomainHashes <- purrr::imap(
      l_rctvDomains,
      function(l_rctvDomain, strDomainID) {
        purrr::imap(
          l_rctvDomain,
          function(rctv_dfDomain, strGroupLevel) {
            srvr_DomainHash(
              rctv_dfDomain,
              strDomainID = strDomainID,
              rctv_dSnapshotDate = rctv_dSnapshotDate,
              rctv_strGroupID = if (strGroupLevel != "Study") {
                rctv_strGroupID
              } else {
                reactiveVal(NULL) # nocov (only impacts caching)
              },
              rctv_strGroupLevel = rctv_strGroupLevel,
              rctv_strSubjectID = if (strGroupLevel == "Selection") {
                rctv_strSubjectID
              } else {
                reactiveVal(NULL) # nocov (only impacts caching)
              },
              strCache = strGroupLevel
            )
          }
        )
      }
    )
    return(l_rctvDomainHashes)
  })
}

#' Reactive domain df
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] that generates a hash of a domain df.
#' @keywords internal
srvr_DomainHash <- function(
  rctv_dfDomain,
  strDomainID,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  strCache = NULL
) {
  reactive({
    rlang::hash(rctv_dfDomain())
  }) %>%
    bindCache(
      strDomainID,
      rctv_dSnapshotDate(),
      rctv_strGroupID(),
      rctv_strGroupLevel(),
      rctv_strSubjectID(),
      strCache
    )
}

#' Count Domain Data
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()], which returns a named integer with counts for
#'   the current selection.
#' @keywords internal
srvr_DomainCounts <- function(
  id,
  fnCountData,
  chrDomains,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  reactive({
    chrDomainIDs <- rlang::set_names(names(chrDomains), names(chrDomains))
    purrr::map_int(
      chrDomainIDs,
      function(this_domain) {
        fnCountData(
          strDomainID = this_domain,
          strGroupID = rctv_strGroupID(),
          strGroupLevel = rctv_strGroupLevel(),
          strSubjectID = rctv_strSubjectID(),
          dSnapshotDate = rctv_dSnapshotDate()
        )
      }
    )
  }) %>%
    bindCache(
      rctv_dSnapshotDate(),
      rctv_strGroupID(),
      rctv_strGroupLevel(),
      rctv_strSubjectID(),
      cache = "session"
    )
}

#' Modal dialog for errors etc
#'
#' @param cnd `condition` The condition object.
#' @param strTitle `length-1 character` A title for the modal popup.
#' @param chrPreMessage `character` One more more messages to show before the
#'   condition message.
#' @param chrPostMessage `character` One or more messages to show after the
#'   condition message.
#' @param strDismiss `length-1 character` Text to show on the dismiss button.
#'
#' @returns A [shiny::modalDialog()] with the designated text, launched via
#'   [shiny::showModal()].
#' @keywords internal
srvr_ShowConditionMessage <- function(
  cnd,
  strTitle,
  chrPreMessage = character(),
  chrPostMessage = character(),
  strDismiss = "Dismiss"
) {
  cnd$use_cli_format <- FALSE
  showModal(
    modalDialog(
      !!!chrPreMessage,
      pre(rlang::cnd_message(cnd)),
      !!!chrPostMessage,
      title = strTitle,
      footer = modalButton(strDismiss)
    )
  )
}
