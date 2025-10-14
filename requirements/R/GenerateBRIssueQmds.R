# TODO: Update this template to a whisker template like I use for the index. That
# way the qmd doesn't have to load the requirement_issues.yml, and we should be
# able to simplify a lot of things.

GenerateBRIssueQmds <- function(strPkgPath = here::here()) {
  lBRs <- ReadRequirementIssues(strPkgPath)
  strTemplate <- ReadTemplate("_br_article.qmd", strPkgPath = strPkgPath)
  EnsureRequirementArticleDirs(strPkgPath)
  purrr::walk(lBRs, function(lBR) {
    GenerateIssueQmd(lBR, strPkgPath, strTemplate)
  })
}

GenerateIssueQmd <- function(lBR, strPkgPath, strTemplate) {
  strContent <- stringr::str_replace(
    stringr::str_replace_all(strTemplate, "BR_NUMBER", as.character(lBR$issue)),
    "BR_TITLE",
    lBR$title
  )

  strOutputPath <- PackageArticlesPath(
    strPkgPath,
    glue::glue("br{lBR$issue}.qmd")
  )
  readr::write_file(strContent, strOutputPath)

  cli::cli_alert_success("Generated {strOutputPath}")
}
