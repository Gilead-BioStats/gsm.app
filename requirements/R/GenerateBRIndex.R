GenerateBRIndex <- function(strPkgPath = here::here()) {
  strBRIndexQmd <- CompileBRIndexQmd(strPkgPath = strPkgPath)
  WriteBRIndexQmd(strBRIndexQmd, strPkgPath)
}

# CompileBRIndexQmd ----

CompileBRIndexQmd <- function(strPkgPath = here::here()) {
  lBRs <- ReadRequirementIssues(strPkgPath)
  lBRStatuses <- CompileBRsForTemplate(lBRs)
  strTemplate <- ReadTemplate("_br_index.qmd", strPkgPath = strPkgPath)
  whisker::whisker.render(strTemplate, data = list(lBRStatuses = lBRStatuses))
}

CompileBRsForTemplate <- function(lBRs) {
  lBRsByStatus <- CompileBRsByStatus(lBRs)
  unname(purrr::imap(lBRsByStatus, function(lBRSet, strStatus) {
    list(
      strStatus = strStatus,
      lBRIssues = lBRSet
    )
  }))
}

CompileBRsByStatus <- function(lBRs) {
  split(
    purrr::map(lBRs, function(lBR) {
      list(intIssueNumber = lBR$issue, strIssueTitle = lBR$title)
    }),
    purrr::map_chr(lBRs, "status")
  )
}

# WriteBRIndexQmd ----

WriteBRIndexQmd <- function(strBRIndexQmd, strPkgPath) {
  strOutputPath <- PackageArticlesPath(strPkgPath, "business_requirements.qmd")
  EnsureRequirementArticleDirs(strPkgPath)
  readr::write_file(strBRIndexQmd, strOutputPath)
  cli::cli_alert_success("Generated {strOutputPath}")
}
