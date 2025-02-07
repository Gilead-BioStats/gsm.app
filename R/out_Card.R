#' Standardized card
#'
#' A standardized [bslib::card()] for gsm.app modules and modules in plugins for
#' gsm.app. The `tagTitle` is applied as a [bslib::card_title()], and
#' `full_screen` is set to `TRUE` by default.
#'
#' @inheritParams shared-params
#' @param tagTitle `html tag` A string or other html to use as the title of the
#'   card. Will be wrapped inside [bslib::card_title()].
#' @param strFullScreenPosition `length-1 character` Used to set the
#'   `full_screen` argument of [bslib::card()], and, if necessary, update
#'   styling to position the "expand" button. The default value `"top"` sets
#'   `full_screen` to `TRUE` and positions the button at the top-right corner of
#'   the card. The value `"bottom"` positions the button at the bottom-right of
#'   the card, and the value `"none"` sets `full_screen` to `FALSE`.
#' @param ... `html tags` Objects to place in the card.
#'
#' @returns A [bslib::card()].
#' @export
#' @examples
#' ns <- shiny::NS("MyModule")
#' out_Card(
#'   "Domain Summary",
#'   shiny::textOutput(ns("text")),
#'   id = ns("card")
#' )
out_Card <- function(
  tagTitle,
  ...,
  id = NULL,
  strFullScreenPosition = c("top", "bottom", "none")
) {
  strFullScreenPosition <- rlang::arg_match(strFullScreenPosition)
  lglFullScreen <- strFullScreenPosition != "none"
  div(
    out_FullScreenButtonStyle(id, strFullScreenPosition),
    bslib::card(
      full_screen = lglFullScreen,
      id = id,
      out_CardTitle(tagTitle),
      ...
    )
  )
}

out_CardTitle <- function(tagTitle = NULL) {
  if (!is.null(tagTitle)) {
    bslib::card_title(tagTitle)
  }
}

out_FullScreenButtonStyle <- function(id, strFullScreenPosition) {
  if (length(id) && strFullScreenPosition == "top") {
    tags$style(
      paste0("#", id, " .bslib-full-screen-enter { bottom: unset !important; }")
    )
  }
}

#' Placeholder card
#'
#' @param ... `character` Text to describe what is required, as a string,
#'   character vector, or multiple strings or character vectors.
#'
#' @returns A [bslib::card()] with a placeholder.
#' @keywords internal
out_Placeholder <- function(...) {
  chrRequirements <- c(...)
  chrRequirements <- paste(choose_article(chrRequirements), chrRequirements)
  bslib::card(
    class = "placeholder",
    htmlDependency_Stylesheet("placeholder.css"),
    cli::format_inline("Please select {chrRequirements}.")
  )
}

#' Choose a or an
#'
#' @param chrWords Words to choose "a" or "an" for.
#'
#' @returns A vector of "a" and "an", the same length as chrWords.
#' @keywords internal
choose_article <- function(chrWords) {
  ifelse(grepl("^[aeiouAEIOU]", chrWords), "an", "a")
}


#' Card subtitle
#'
#' @inheritParams out_Card
#' @param chrAdditionalClass `character` One or more additional classes to apply
#'   to the subtitle.
#'
#' @returns A [bslib::card_title()] with appropriate classes.
#' @keywords internal
out_CardSubtitle <- function(tagTitle, chrAdditionalClass = character()) {
  bslib::card_title(
    tagTitle,
    container = h6,
    class = glue::glue_collapse(
      c("card-subtitle mb-2 text-muted", chrAdditionalClass),
      " "
    )
  )
}
