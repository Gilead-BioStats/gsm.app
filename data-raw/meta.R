meta <- c(
    yaml::read_yaml(system.file('mappings', 'mapping_rawplus.yaml', package = 'gsm')),
    yaml::read_yaml(system.file('mappings', 'mapping_ctms.yaml', package = 'gsm')),
    yaml::read_yaml(system.file('mappings', 'mapping_edc.yaml', package = 'gsm'))
)

meta_data_frame <- map_meta_to_data_frame(meta)
usethis::use_data(
    meta_data_frame,
    overwrite = TRUE
)

meta_list <- map_meta_to_list(meta_data_frame)
usethis::use_data(
    meta_list,
    overwrite = TRUE
)
