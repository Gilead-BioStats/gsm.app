get_workflows <- function(
    path = system.file('workflows', package = 'gsmApp')
) {
    workflows <- list.files(path) %>%
        map(~yaml::read_yaml(glue::glue('{path}/{.x}')))

    workflows
}
