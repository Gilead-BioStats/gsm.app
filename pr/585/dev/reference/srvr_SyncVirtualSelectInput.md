# Synchronize virtualSelectInput with reactive

Synchronize virtualSelectInput with reactive

## Usage

``` r
srvr_SyncVirtualSelectInput(
  id,
  session = getDefaultReactiveDomain(),
  rctv_chrChoices = NULL,
  rctv_strLabel = NULL,
  rctv_strSelected = NULL,
  rctv_lglDisable = NULL,
  rctv_chrDisabledChoices = NULL,
  rctv_lglOpen = NULL
)
```

## Arguments

- id:

  `character` The id for this element.

- session:

  `environment` Session from which to make a child scope (the default
  should almost always be used).

- rctv_chrChoices:

  `reactive character` Choices to set.

- rctv_strLabel:

  `reactive character` Label to set.

- rctv_strSelected:

  `reactive character` Selected value to set.

- rctv_lglDisable:

  `reactive logical` Whether to disable the menu.

- rctv_chrDisabledChoices:

  `reactive character` Choices to disable.

- rctv_lglOpen:

  `reactive logical` Whether to open (`TRUE`) or close (`FALSE`) the
  menu.

## Value

A [`shiny::observe()`](https://rdrr.io/pkg/shiny/man/observe.html) that
triggers
[`shinyWidgets::updateVirtualSelect()`](https://dreamrs.github.io/shinyWidgets/reference/updateVirtualSelect.html)
when the connected reactives change.
