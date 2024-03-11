#' Read and assemble snapshot from `inst`.
#'
#' @return `list` {gsm} snapshot object.
#'
#' @examples
#' \dontrun{
#' snapshot <- read_snapshot()
#' }
#' @export
read_snapshot <- function() {
    cores <- parallel::makeCluster(parallel::detectCores())
    scattered_snapshots <- list.files(system.file("data", package = "gsmApp"), full.names = TRUE)

    all <- parallel::parLapply(cores, scattered_snapshots, function(x) {
        readRDS(x)
    }) %>%
        purrr::set_names(sub("snapshot_", "", tools::file_path_sans_ext(basename(scattered_snapshots))))

    parallel::stopCluster(cl = cores)

    all$lSnapshotDate <- all$lSnapshot$lSnapshotDate
    all$lSnapshot <- all$lSnapshot$lSnapshot
    return(all)
}


