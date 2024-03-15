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
    scattered_snapshots <- list.files(system.file("sampledata", package = "gsmApp"), full.names = TRUE)

    all <- purrr::map(scattered_snapshots, function(x){
        qs::qread(x)
    }) %>%
        purrr::set_names(sub("snapshot_", "", tools::file_path_sans_ext(basename(scattered_snapshots))))


    all$lSnapshotDate <- all$lSnapshot$lSnapshotDate
    all$lSnapshot <- all$lSnapshot$lSnapshot
    return(all)
}


