library(magrittr)

#' Sync Business Requirement Snapshots
#'
#' Copies snapshots from the `testthat` directory to the vignette's `br/`
#' subdirectory. This is necessary for `pkgdown` to find the images when
#' building the site.
#'
#' This function should be ran interactively after test snapshots are updated,
#' and it will be ran by GitHub Actions before building the `pkgdown` site.
sync_br_snapshots <- function() {
  from <- here::here("tests/testthat/_snaps/br")
  if (!dir.exists(from)) {
    cli::cli_abort(
      "Snapshot directory not found at '",
      from,
      "'. Did you run the tests?"
    )
  }

  to <- here::here("vignettes/articles/business_requirements/img")
  if (fs::dir_exists(to)) {
    fs::dir_delete(to)
  }
  fs::dir_copy(from, to)

  to_subs <- fs::dir_ls(to, type = "directory")
  to_sub_issues <- to_subs %>%
    fs::path_file() %>%
    stringr::str_extract("br-\\d+")
  to_sub_issues_dirs <- fs::dir_create(
    fs::path(to, to_sub_issues)
  )
  purrr::walk2(
    to_subs,
    to_sub_issues_dirs,
    function(this_sub, this_issue_dir) {
      fs::file_move(fs::dir_ls(this_sub), this_issue_dir)
      fs::dir_delete(this_sub)
    }
  )
}

sync_br_snapshots()
