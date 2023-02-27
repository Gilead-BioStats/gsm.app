# TODO: download README.md and write to inst/resources/homeTab.md

library(magrittr)
library(gh)

releases <- gh::gh(
    '/repos/Gilead-BioStats/gsm/releases',
    token = remotes:::github_pat()
)
release <- releases[[1]]
version <- release$name %>% substring(2) %T>% message

#includeMarkdown('inst/resources/homeTab.md') %>%
#    writeLines('inst/resources/homeTab.html')
