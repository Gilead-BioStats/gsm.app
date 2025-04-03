cleanColumn <- function(df, chrColumn, fnCleaner) {
  dplyr::mutate(
    df,
    dplyr::across(
      dplyr::any_of(chrColumn),
      gsm.app:::AsFunction(fnCleaner)
    )
  )
}

ynToLogical <- function(x) {
  !is.na(x) & tolower(x) == "y"
}
