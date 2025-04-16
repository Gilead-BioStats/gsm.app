#' List of reactive domain dfs
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()]s with domain dfs.
#' @keywords internal
mod_dfDomains_Server <- function(
  id,
  fnFetchData,
  chrDomains,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    chrDomainIDs <- rlang::set_names(names(chrDomains), names(chrDomains))
    l_rctvDomains <- purrr::map(chrDomainIDs, function(this_domain) {
      srvr_dfDomain(
        this_domain, fnFetchData, rctv_strSiteID, rctv_strSubjectID
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
  rctv_strSiteID,
  rctv_strSubjectID
) {
  # This is an area that could use a lot of optimization; this is almost
  # certainly the slowest part of the app.
  reactive({
    withProgress(
      message = glue::glue("Loading {strDomainID} data"),
      {
        tryCatch(
          {
            fnFetchData(
              strDomainID,
              strSiteID = NullifyEmpty(rctv_strSiteID()),
              strSubjectID = NullifyEmpty(rctv_strSubjectID())
            )
          },
          error = function(cnd) {
            srvr_ShowConditionMessage(
              cnd,
              chrPreMessage = glue::glue(
                "Could not fetch data for the {strDomainID} domain."
              ),
              strTitle = glue::glue("Error loading {strDomainID} data")
            )
          }
        )
      }
    )
  }) %>%
    bindCache(
      strDomainID,
      rctv_strSiteID(),
      rctv_strSubjectID(),
      cache = "session"
    )
}

#' List of Reactive Domain df Hashes
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()]s with hashes of domain dfs.
#' @keywords internal
mod_DomainHashes_Server <- function(
  id,
  l_rctvDomains,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    l_rctvDomainHashes <- purrr::imap(
      l_rctvDomains,
      function(rctvDomain, strDomainID) {
        srvr_DomainHash(
          rctvDomain,
          strDomainID,
          rctv_strSiteID,
          rctv_strSubjectID
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
  rctvDomain,
  strDomainID,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  reactive({
    rlang::hash(rctvDomain())
  }) %>%
    bindCache(strDomainID, rctv_strSiteID(), rctv_strSubjectID())
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
