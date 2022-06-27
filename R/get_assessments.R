get_assessments <- function(
    path = system.file('assessments', package = 'gsmApp')
) {
    assessments <- list.files(path) %>%
        map(~yaml::read_yaml(glue::glue('{path}/{.x}')))

    assessments
}
