colorScheme <- function(
  strColorName = c("gray", "green", "amber", "red"),
  strColorFamily = c("dark", "light")
) {
  strColorName <- tolower(strColorName)
  strColorFamily <- tolower(strColorFamily)
  strColorName <- rlang::arg_match(strColorName)
  strColorFamily <- rlang::arg_match(strColorFamily)
  colors <- list(
    light = c(
      red = "#FFABAC",
      amber = "#FED480",
      green = "#9ED782",
      gray = "#E5E5E5"
    ),
    dark = c(
      red = "#FF5859",
      amber = "#FEAA02",
      green = "#3DAF06",
      gray = "#828282"
    )
  )
  colors[[strColorFamily]][[strColorName]]
}
