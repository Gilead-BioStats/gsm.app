library(desc)
library(fs)
library(brio)
library(glue)
library(purrr)
library(dplyr)
library(arrow)
library(pkgload)
library(rsconnect)

setup_deployment <- function(study_dir, snapshot_dir) {
  deployment_dir <- file.path("deployment", basename(study_dir), basename(snapshot_dir))

  if (dir_exists(deployment_dir)) {
    dir_delete(deployment_dir)
  }

  dir_create(deployment_dir)
  data_dir <- file.path("data", basename(study_dir), "data", basename(snapshot_dir))

  dir_create(file.path(deployment_dir, "pkgs"))
  dir_copy("R", file.path(deployment_dir, "pkgs/R"))
  dir_copy(data_dir, file.path(deployment_dir, "pkgs/data"))
  dir_copy("inst", file.path(deployment_dir, "pkgs/inst"))
  file_copy("DESCRIPTION", file.path(deployment_dir, "pkgs"))
  file_copy("NAMESPACE", file.path(deployment_dir, "pkgs"))


  new_data_dir <- file.path("pkgs/data")

  app_code <- glue::glue('
pkgload::load_all("pkgs/R", helpers = FALSE)
library(dplyr)
data_dir <- "{new_data_dir}"

results <- arrow::read_parquet(file.path(data_dir, "Reporting/Results.parquet"))
metrics <- arrow::read_parquet(file.path(data_dir, "Reporting/Metrics.parquet")) %>%
  dplyr::filter(!grepl("Analysis_cou", MetricID)) # filter out country level kris

groups <- arrow::read_parquet(file.path(data_dir, "Reporting/Groups.parquet"))
bounds <- arrow::read_parquet(file.path(data_dir, "Reporting/Bounds.parquet"))
analysis_inputs <- list.files(file.path(data_dir, "Analysis"), "Input", full.names = TRUE, recursive = TRUE)
analysis_inputs <- analysis_inputs %>% purrr::map(~arrow::read_parquet(.x)) %>% purrr::list_rbind()

fetch_participant_data <- function(
    data_path,
    metadata_domain = "SUBJ",
    metric_data_domains = c("AE", "DATACHG", "DATAENT", "ENROLL", "LB", "PD", "QUERY", "SDRGCOMP", "STUDCOMP")
) {{
  return(function(strSubjectID) {{
    metadata <- arrow::read_parquet(file.path(data_path, paste0(metadata_domain, ".parquet"))) %>%
      dplyr::filter(.data$subjid == strSubjectID) %>%
      as.list()

    metric_data <- purrr::map(metric_data_domains, function(domain) {{
      arrow::read_parquet(file.path(data_path, paste0(domain, ".parquet"))) %>%
        dplyr::filter(.data$subjid == strSubjectID)
    }}) %>%
      stats::setNames(metric_data_domains)

    return(list(metadata = metadata, metric_data = metric_data))
  }})
}}

pcpt_data <- fetch_participant_data(data_path = file.path(data_dir, "Mapped"))

gsm.app::run_gsm_app(analysis_inputs, bounds, groups, metrics, results, pcpt_data)
')

  write_file(app_code, file.path(deployment_dir, "app.R"))

  write_lines('', file.path(deployment_dir, ".renvignore"))

  pkg_deps <- c("shiny")
  ignored_pkgs <- c("gsm.app", "gsm.template")

  ds <- purrr::map(fs::dir_ls(file.path(deployment_dir, "pkgs/R"), recurse = TRUE, regexp = "DESCRIPTION"), ~ desc::desc_get_deps(.x)$package)

  all_pkg_deps <- sort(unique(c(pkg_deps, unlist(ds))))
  pkg_deps <- all_pkg_deps[!(all_pkg_deps %in% ignored_pkgs)]

  write_lines(glue::glue("library({pkg_deps})"), file.path(deployment_dir, "deps.R"))

  options(rsconnect.packrat = TRUE)

  withr::with_dir(deployment_dir, {
    rsconnect::writeManifest(verbose = TRUE)
  })
}

base_data_dir <- "data/"
study_dirs <- fs::dir_ls(base_data_dir, type = "directory")
purrr::walk(study_dirs, function(study_dir) {
  snapshot_dirs <- fs::dir_ls(file.path(study_dir, "data"), type = "directory")
  purrr::walk(snapshot_dirs, function(snapshot_dir) {
    setup_deployment(study_dir, snapshot_dir)
  })
})
