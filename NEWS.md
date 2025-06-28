# gsm.app (development version)

This is a patch bugfix release.

## Bug Fixes
- The Data Summary in the sample Participant Profile plugin functions properly (#489).
- The Overview Table on the Study Overview tab now responds properly to the Group Level drop-down menu, showing "Enrolled" counts and proper hovers (#492).
- The "Site" (or "Country") drop-down menu maintains its bold formatting to match the other drop-down menus in the top nav bar.

# gsm.app 2.5.1

This patch release fixes bugs related to the presence of multiple "Group Levels" (eg, "Site" and "Country") in app data (#469).

## New Features
- Demo apps now include Country-level KRIs, in addition to Site-level KRIs (#477).

## Bug Fixes
- Study Overview tab:
  - The Overview Table is properly filtered to groups matching the selected Group Level (#471, #472).
  - The Scatter Plots tab is also filtered to groups matching the selected Group Level (#470).
- Metric Details tab:
  - The metric drop-down menu at the top-left of the charts is now filtered to metrics related to the selected Group Level (#473).
  - The Analysis Output tab respects Group Level (#474).
- Domain Details tab:
  - Sample domain data is now linked to the selected Group Level (#476).

# gsm.app 2.5.0

We now support multiple group levels! We also provided more options to allow app admins to optimize data fetches.

## New Features
- If `dfResults` included multiple `GroupLevel` values, apps now include a "Group Level" drop-down menu to choose between those levels ("Site" vs "Country", usually) (#203, #216).
- We added a new argument, `fnCountData`. By default, we use `fnFetchData` to fetch data and then count it for the "Domain Details" tab, but this argument allows app admins to provide faster functions when we only need a count (so we don't have to load *all* data when the user navigates to that tab) (#441).
- We overhauled the way data flows into plugins, allowing for greater flexibility in how plugins function. Importantly, plugins now have access to Subject-, Group-, *and* Study-level domain data. Plugins can also access the gsm Data Model data (`dfAnalyticsInput`, `dfBounds`, `dfGroups`, `dfMetrics`, and `dfResults`). As part of these changes, data fetching has been optimized to subset cached data when available. We hope this will speed up some slow operations (#430, #435, #438, #440, #447, #450).

## Other improvements
- The sample data is now more robust, and has already allowed us to find one issue which might turn up in real data (when a particular site doesn't have data for one or more KRIs) (#398).
- Each tab now has more control over its own interface, rather than requiring a large sidebar on every tab. As a result, the "Metric Details" tab has a more streamlined (and hopefully easier to navigate) interface (#428).
- `dfAnalyticsInput` can now provide information from multiple `SnapshotDate`s (#455).

# gsm.app 2.4.0

We continue to evolve the app layout toward better usability!

## New Features
- The "Site" and "Participant" inputs are now displayed in the top bar of the app, since they are used throughout the app. Tab-specific filters remain in the sidebar, which is collapsed by default (#400, #418). We will continue to evolve this layout through user feedback.
- The package has been updated to use [{gsm.core}](https://gilead-biostats.github.io/gsm.core/) and [{gsm.kri}](https://gilead-biostats.github.io/gsm.kri/), rather than the monolithic {gsm} (#412).
- The {gsm.ae} plugin has been split off into its own package ([site](https://openrbqm.github.io/gsm.ae/) | [demo app](https://openrbqm.shinyapps.io/gsm-ae/)). This split helps us identify tools that will help with future plugin development, and makes it easier to evolve the main app and the AE plugin independently (#325).
- We show the title of the study in the top bar by default, as well as in the name of the browser tab (#382).

## Other improvements
- Users can zoom tables on "Domain Details" to fill their screen (#399), and text fields now wrap to make the text easier to read (#404).
- Some internal UI functions are now available for use in plugins (#402), and the plugin-definition process has been streamlined with the new `plugin_Define()` function (#407), and better documentation of `plugin_Read()` (#406).
- Users have more flexibility about which domains to include in the app, and how to refer to them (#415). This interface will continue to evolve to better support plugins.

# gsm.app 2.3.0

Apps now feature site-level domain details!

## New Features
- A new "Domain Details" tab shows domain data at whatever level is selected via inputs -- study-level, site-level, or participant-level (#245, #353, #374).
- The former "Participant Details" has formed the core of a new "Participant Profile" plugin. We will expand and refine this plugin via user feedback (#342, #328).
- Communication with plugins is now bidirectional! Plugin authors can set inputs such as "Site" or "Participant", and those inputs push back to the app and to other tabs and plugins (#329).

## Other Improvements
- Domain data is now fetched at the app level and passed on to tabs and plugins, minimizing computation time (#345).
- "Domain" is now a top-level input, so that domains selected on the "Domain Details" tab can be passed into plugins, and domains selected inside plugins can be passed back to the "Domain Details" tab (#361).
- Errors generated by the function that fetches data are passed on to users of the app. This allows the deployment team to pass information to users about how to correct issues, such as by selecting a site or participant, or by avoiding a particular site or participant (#355).
- The "Time Series" plot on the "Metric Details" tab now supports longitudinal data. If more than one snapshot is provided to the app, the additional snapshots will be displayed here (#386, #390).

# gsm.app 2.2.0

Introducing Plugins! Plugins allow users to extend the apps produced by {gsm.app} with additional functionality for specific domains or combinations of domains.

## New Features
- We now support plugins! See the new "Plugins" vignette for details of how to create a plugin. A demo Adverse Events plugin is provided as part of the {gsm.app} installation (#319, #322, #323, #324).
- Domain data can now be fetched at a site or study level. Such data is currently only used by plugins, but it will also allow for further refinement of the main app going forward (#321).

## Other Improvements
- Numeric participant-domain data now automatically rounds to an appropriate number of significant digits (#313).
- All inputs are now implemented as full Shiny module inputs. The end result is that the various charts update more smoothly in response to changes elsewhere in the app (#309, #310).
- A new argument `chrDomains` can now be provided at launch to limit the domains the app expects (#333).
- KRIs that have 0 flags no longer break the "Analysis Output" table on the "Metric Details" tab (#339).
- Some variable names have been standardized (#331).

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

