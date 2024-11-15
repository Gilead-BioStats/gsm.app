# gsm.app 2.1.0

This version focuses on stability, as well as integration with `{gsm}` 2.1.2:

## New Features
- Add optional arguments to allow users to customize the UI and/or server of the resulting Shiny app. This will allow users to add logging functionality, for example (#283).
- All tables have been standardized to use the {gt} package. This adds sorting and resizing functionality to all columns, and fixes several bugs (#187, #208, #224, #248, #289, #294).
- The sample data now contains all KRIs, to demonstrate a more fully functional app (#207).
- The Overview Table on the Study Overview tab is now interactive. Click a site and/or KRI to view details about that KRI at that site. The filters of this table can also be updated by clicking the red/amber pills at the top of the Overview Table tab (#196, #243, #244, #264).

## Other Improvements
- Code has been separated into easier-to-manage subfunctions (#286).
- The sidebar now uses `Report_Studyinfo()` from {gsm}, rather than a custom app. The table is collapsible/expandable to show a subset of information vs all available information about the study (#288).

# gsm.app 2.0.0

This is a complete rewrite of the package for use with `{gsm}` 2.0+.

## New Features
- The sidebar (with overall study information and drop-down menus) can be collapsed to focus on the drill-down modules.
- Charts and tables can be expanded to fill more of the browser window.
- Participant details now have loading animations to make it clearer when data is processing.

## Other Improvements
- Renamed package to {gsm.app} for consistency with related apps.
- Apps produced by this version of the package should load *much* faster than those produced by the previous version.
- Numerous improvements have been made under-the-hood to improve stability and maintainability.
- 100% of code is covered by tests.

# gsm.app 1.0.0

This is the first major release of `{gsmApp}`! 🥳

## New Features
- Adds a faceted scatter plot view for easy comparison of a site across all assessments.
- New approach for using sample data, using the `{qs}`. This allows the app to be deployed to [shinyapps.io](https://www.shinyapps.io/).
- All columns are now available for view/inspection for a given domain.
- UI has been modified for a better user experience.

## Other Improvements
- Fixed bug in sample data that erroneously used `{gsm} v1.9.2` instead of the current `dev` branch, which includes fixes to `htmlwidgets` allowing for interaction with a Shiny app. 

# gsm.app 0.6.0

This release is planned to be the pre-`v1.0.0` release and includes some significant changes to the UI, as well as changes that allow the app to be used experimentally on live study data.

## New Features
- Adds site and participant metadata with improved drill-down functionality.
- All charts are linked to the side-panel, so when a site is selected, metadata is presented for the selected site across all tabs.
- The UI has been modified based on user feedback to provide a better experience while navigating the app.

## Other Improvements
- Namespacing and documentation has been updated to be consistent with other R packages and apps in the ecosystem.

