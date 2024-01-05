library(magrittr)
library(gsm)

snapshot <- gsm::Make_Snapshot() %T>%
    gsm::Save_Snapshot('data-raw')

usethis::use_data(snapshot)
