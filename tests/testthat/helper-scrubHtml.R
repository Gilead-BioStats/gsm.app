scrub_card_ids <- function(chrLines) {
  gsub("bslib-card-\\d+", "bslib-card-XXXX", chrLines)
}
