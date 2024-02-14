# gsmApp: Shiny application for `{gsm}` assessments

`{gsmApp}` is a Shiny application that enables drill-down functionality for [`{gsm}`](https://github.com/Gilead-BioStats/gsm) Assessments using the [`{safetyGraphics}`](https://github.com/SafetyGraphics/safetyGraphics) Framework.


A [PHUSE working group](https://advance.phuse.global/display/WEL/OpenRBQM%3A+Pre-Competitive+Collaboration+on+Open-Source+Software+for+RBQM), *OpenRBQM: Pre-Competitive Collaboration on Open-Source Software for RBQM*, has been formed to improve and develop new features for `{gsm}`, `{gsmApp}`, and future open-source RBQM tools and modules.

## Using The App

To install and run `{gsmApp}` using sample data:

```
devtools::install_github("Gilead-BioStats/gsmApp")
library(gsmApp)
gsmApp::run_app()
```

![]("https://github.com/Gilead-BioStats/gsmApp/blob/fix-69/inst/resources/gsmApp.gif")
