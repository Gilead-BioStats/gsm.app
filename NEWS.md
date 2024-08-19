# dev

- Renamed app to {gsm.app} for consistency with related apps.


# gsmApp 1.0.0

This is the first major release of `{gsmApp}`! 🥳

## New Features
- Adds a faceted scatter plot view for easy comparison of a site across all assessments.
- New approach for using sample data, using the `{qs}`. This allows the app to be deployed to [shinyapps.io](https://www.shinyapps.io/).
- All columns are now available for view/inspection for a given domain.
- UI has been modified for a better user experience.

## Other Improvements
- Fixed bug in sample data that erroneously used `{gsm} v1.9.2` instead of the current `dev` branch, which includes fixes to `htmlwidgets` allowing for interaction with a Shiny app. 

# gsmApp 0.6.0

This release is planned to be the pre-`v1.0.0` release and includes some significant changes to the UI, as well as changes that allow the app to be used experimentally on live study data.

## New Features
- Adds site and participant metadata with improved drill-down functionality.
- All charts are linked to the side-panel, so when a site is selected, metadata is presented for the selected site across all tabs.
- The UI has been modified based on user feedback to provide a better experience while navigating the app.

## Other Improvements
- Namespacing and documentation has been updated to be consistent with other R packages and apps in the ecosystem.

