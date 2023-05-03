devtools::load_all()

meta <- gsm::Read_Mapping(c('rawplus', 'edc', 'ctms'))

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
