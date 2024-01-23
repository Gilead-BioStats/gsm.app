#' Ingest metadata
#'
#' @param type `character` type of metadata
#'   - assessments
#'   - workflows
#' @param path `character` location of .yaml files containing metadata
#'
#' @importFrom glue glue
#' @importFrom yaml read_yaml
#'
#' @return `list` list of assessment metadata
#'
#' @export

get_metadata_from_yaml <- function(
    type = NULL,
    path = system.file(type, package = 'gsmApp')
) {
    stopifnot(
        '[ type ] is not specified' = !is.null(type),
        '[ path ] does not exist' = path != '',
        '[ path ] does not contain any .yaml files' = length(list.files(path, '\\.yaml$')) > 0
    )

    metadata <- list.files(path, '\\.yaml$') %>%
        map(~yaml::read_yaml(glue::glue('{path}/{.x}')))

    metadata
}
