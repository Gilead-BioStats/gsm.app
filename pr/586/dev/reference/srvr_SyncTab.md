# Synchronize selected tab with reactive

Synchronize selected tab with reactive

## Usage

``` r
srvr_SyncTab(
  id,
  strTargetTab,
  rctv_strValue,
  rctv_strCurrentTab,
  chrFromTabs,
  session = getDefaultReactiveDomain()
)
```

## Arguments

- id:

  `character` The id for this element.

- strTargetTab:

  `character` The tab to switch to.

- rctv_strValue:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the value of a field.

- rctv_strCurrentTab:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the currently selected tab.

- chrFromTabs:

  `character` A vector of tab names. Syncing is only triggered if the
  user is currently on one of these tabs.

- session:

  `environment` Session from which to make a child scope (the default
  should almost always be used).

## Value

A [`shiny::observe()`](https://rdrr.io/pkg/shiny/man/observe.html) that
triggers
[`bslib::nav_select()`](https://rstudio.github.io/bslib/reference/nav_select.html)
when the connected reactive changes.
