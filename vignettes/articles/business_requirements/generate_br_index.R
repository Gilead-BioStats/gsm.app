# This script is sourced from setup.R and assumes an object `lBRStatuses` exists.

all_status_md <- purrr::imap_chr(lBRStatuses, function(issues, status_name) {
  links_md <- purrr::map_chr(issues, function(issue_num) {
    br <- purrr::keep(lBRs, ~ .x$issue == issue_num)[[1]]
    if (is.null(br)) {
      cli::cli_warn(
        "Issue {issue_num} not found in business_requirements.yml"
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

final_qmd <- paste(qmd_header, all_status_md, "\n", sep = "\n")

output_path <- here::here("vignettes", "articles", "business_requirements.qmd")
readr::write_file(final_qmd, output_path)

rm(all_status_md, qmd_header, final_qmd, output_path)
