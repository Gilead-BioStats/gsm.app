GenerateBRIndex <- function(path = ".") {
  lBRs <- ReadRequirementIssues(path)
  strBRIndexQmd <- GenerateBRIndexQMD(lBRs)
  WriteBRIndexQmd(strBRIndexQmd, path)
}

ExtractBRStatuses <- function(lBRs) {
  split(purrr::map_int(lBRs, "issue"), purrr::map_chr(lBRs, "status"))
}

GenerateBRIndexQMD <- function(lBRs) {
  lBRStatuses <- ExtractBRStatuses(lBRs)
  all_status_md <- purrr::imap_chr(lBRStatuses, function(issues, status_name) {
    links_md <- purrr::map_chr(issues, function(issue_num) {
      br <- purrr::keep(lBRs, ~ .x$issue == issue_num)[[1]]
      if (is.null(br)) {
        cli::cli_warn(
          "Issue {issue_num} not found in requirement_issues.yml"
        )
        return("")
      }
      glue::glue("- [{br$issue}: {br$title}](br{br$issue}.html)")
    }) %>%
      paste(collapse = "\n")

    glue::glue("## {status_name}\n\n{links_md}")
  }) %>%
    paste(collapse = "\n\n") # Combine all status sections

  qmd_header <- '---
title: "Business Requirements"
format: html
---
'

  paste(qmd_header, all_status_md, "\n", sep = "\n")
}

WriteBRIndexQmd <- function(strBRIndexQmd, path) {
  strOutputPath <- PackageArticlesPath(path, "business_requirements.qmd")
  EnsureRequirementArticleDirs(path)
  readr::write_file(
    strBRIndexQmd,
    strOutputPath
  )
  cli::cli_alert_success("Generated {strOutputPath}")
}
