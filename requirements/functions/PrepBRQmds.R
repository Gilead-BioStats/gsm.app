GenerateAllBRIssueQmds <- function(path) {
  lBRs <- ReadRequirementIssues(path)
  strTemplate <- readr::read_file(
    fs::path(path, "requirements", "templates", "_br_article.qmd")
  )
  EnsureRequirementArticleDirs(path)

  purrr::walk(lBRs, function(lBR) {
    GenerateIssueQmd(lBR, path, strTemplate)
  })
}

GenerateIssueQmd <- function(lBR, path, strTemplate) {
  # Substitute placeholders
  strContent <- strTemplate %>%
    stringr::str_replace_all("BR_NUMBER", as.character(lBR$issue)) %>%
    stringr::str_replace("BR_TITLE", lBR$title)

  # Define output path
  strOutputPath <- PackageArticlesPath(
    path,
    glue::glue("br{lBR$issue}.qmd")
  )

  # Write the new file
  readr::write_file(strContent, strOutputPath)

  cli::cli_alert_success("Generated {strOutputPath}")
}
