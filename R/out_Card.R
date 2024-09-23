#' Standardized card
#'
#' @inheritParams shared-params
#' @param tagTitle `html tag` A string or other html to use as the title of
#'   the card. Will be wrapped inside [bslib::card_title()].
#' @param ... `html tags` Objects to place in the card.
#'
#' @return A [bslib::card()].
#' @keywords internal
out_Card <- function(tagTitle, ..., strID = NULL) {
  bslib::card(
    full_screen = TRUE,
    id = strID,
    bslib::card_title(tagTitle),
    ...
  )
}

#' Placeholder card
#'
#' @param chrRequirement `character` Text to describe what is required, as a
#'   string or character vector.
#'
#' @return A [bslib::card()] with a placeholder.
#' @keywords internal
out_Placeholder <- function(chrRequirement) {
  bslib::card(
    class = "placeholder",
    htmlDependency_Stylesheet("placeholder.css"),
    cli::format_inline("Please select a {chrRequirement}.")
  )
}

#' Card subtitle
#'
#' @inheritParams out_Card
#' @param chrAdditionalClass `character` One or more additional classes to apply
#'   to the subtitle.
#'
#' @return A [bslib::card_title()] with appropriate classes.
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
