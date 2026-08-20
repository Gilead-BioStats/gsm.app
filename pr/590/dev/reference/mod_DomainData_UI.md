# Domain Data Tab UI

Domain Data Tab UI

## Usage

``` r
mod_DomainData_UI(id, strDomainLabel, strDomainID)
```

## Arguments

- id:

  `character` The id for this element.

- strDomainLabel:

  `character` The domain name to display. For example, for ID `"AE"`,
  the label is `"Adverse Events"`. Can also be a
  [`shiny::uiOutput()`](https://rdrr.io/pkg/shiny/man/htmlOutput.html)
  which renders to an inline string.

- strDomainID:

  `character` The domain data.frame to load.

## Value

A
[`bslib::nav_panel()`](https://rstudio.github.io/bslib/reference/nav-items.html)
with either a placeholder, or a
[`gt::gt_output()`](https://gt.rstudio.com/reference/gt_output.html)
table.
