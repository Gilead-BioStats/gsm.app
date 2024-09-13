out_Card <- function(tagTitle, ..., strID = NULL) {
  bslib::card(
    full_screen = TRUE,
    id = strID,
    bslib::card_title(tagTitle),
    ...
  )
}

out_Placeholder <- function(strRequirement) {
  bslib::card(
    class = "placeholder",
    glue::glue("Please select a {strRequirement}.")
  )
}
