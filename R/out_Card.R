#' Standardized card
#'
#' @inheritParams shared-params
#' @param tagTitle `html tag` A string or other html to use as the title of
#'   the card. Will be wrapped inside [bslib::card_title()].
#' @param ... `html tags` Objects to place in the card.
#'
#' @returns A [bslib::card()].
#' @keywords internal
out_Card <- function(tagTitle, ..., id = NULL) {
  bslib::card(
    full_screen = TRUE,
    id = id,
    bslib::card_title(tagTitle),
    ...
  )
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
