AETimelines_Fetch <- function(lModuleConfig, strSiteID = NULL) {
    cli::cli_alert_info('Site ID: {strSiteID}')
    lData <- lModuleConfig$spec %>%
        purrr::imap(~
            do.call(
            '::',
                list(
                    'clindata',
                    switch(.y,
                        'Mapped_SUBJ' = 'rawplus_dm',
                        'Mapped_AE' = 'rawplus_ae'
                    )
                )
            )
    )

    dfSUBJ <- lData$Mapped_SUBJ %>%
        dplyr::filter(
            !is.na(.data$firstparticipantdate)
        ) %>%
        dplyr::select(tidyselect::all_of(names(lModuleConfig$spec$Mapped_SUBJ)))

    dfAE <- lData$Mapped_AE %>%
        dplyr::select(tidyselect::all_of(names(lModuleConfig$spec$Mapped_AE))) %>%
        dplyr::inner_join(
            dfSUBJ,
            'subjid'
        ) %>%
        dplyr::mutate(
            aest_dy = aest_dt - firstparticipantdate + 1,
            aeen_dy = aeen_dt - firstparticipantdate + 1
        ) %>%
        dplyr::group_by(subjid) %>%
        dplyr::arrange(subjid, aest_dy, aeen_dy, mdrpt_nsv, aetoxgr) %>%
        dplyr::mutate(
            aeseq = dplyr::row_number()
        ) %>%
        dplyr::ungroup()

    if (strSiteID != 'None' && !is.null(strSiteID)) {
        dfAE <- dfAE %>%
            dplyr::filter(
                invid == strSiteID
            )
    }

    return(dfAE)
}
