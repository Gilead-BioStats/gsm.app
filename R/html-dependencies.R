html_dependency_Stylesheet <- function() {
  htmltools::htmlDependency(
    name = "Stylesheet",
    version = "1.0.0",
    src = "www",
    package = "gsm.app",
    stylesheet = "styles.css"
  )
}

html_dependency_HighlightTableRow <- function() {
  htmltools::htmlDependency(
    name = "HighlightTableRow",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "highlightTableRow.js"
  )
}

html_dependency_TableClick <- function() {
  htmltools::htmlDependency(
    name = "TableClick",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "tableClick.js"
  )
}
